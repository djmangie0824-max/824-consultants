# Primary NVMe latency tolerance vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/nvme-primary-latency-tolerance.html

Companion to [Primary NVMe Idle Timeout](nvme-idle-timeout.html) and [Secondary NVMe Idle Timeout](secondary-nvme-idle-timeout.html). Those packs are when StorNVMe starts looking. APST is the controller table. ASPM is the PCIe link. This pack is the remaining depth knob: **Hard disk → Primary NVMe Power State Transition Latency Tolerance**. GUID `fc95af4d-40e7-4b6d-835a-56d131dbc80e`. Units are milliseconds. Microsoft min 0, max `0xea60` = **60000**. After the primary idle timeout expires, StorNVMe picks the deepest non-operational F-state whose ENLAT+EXLAT is still ≤ this value. **Higher milliseconds make a deeper F-state more likely.** Balanced S0 Working default is **15 ms AC / 50 ms DC**. Performance scheme AC is **0 ms**. The NVMe stays Present. The first write after idle hitch-pauses on a 10–60 ms exit. Task Scheduler still shows Ready. The tolerance is not the timeout.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Primary timeout can already be raised. Secondary timeout can already be at the GUID maximum. APST can already be Off. ASPM can already be Off. A ship still hitch-pauses on the first write whenever that timeout still fires. Device Manager still says Present. No re-enumerate. `schtasks` still prints Ready and last result 267009. The operator lengthens the timeout again. Microsoft’s documented maximum for the NVMe idle-timeout GUIDs is **60000 ms**, not “Never.” When 60 seconds of quiet expire, StorNVMe still walks the F-state table. Primary NVMe Power State Transition Latency Tolerance is still 15 ms on Balanced AC. A power state with ~10–15 ms ENLAT+EXLAT is legal. The first write pays that exit. Lengthening the timer does not set the depth.

This is not a vanished NVMe. A device that disappears is ASPM or D3. This page is Present + a legal F-state because the tolerance was wide enough. Do not paste `nvme_core.default_ps_max_latency_us=0` on this Windows profile. Do not cargo-cult this GUID to 60000. On this row, bigger is deeper, not safer.

Grok in-session schedulers expire in 7 days even when durable. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| NVMe disappears then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) or PCI D3 |
| Spinning or USB disk waits on spin-up; DISKIDLE is not 0 | [hard-disk-idle-timeout](hard-disk-idle-timeout.html) |
| ASPM Off. BIOS APST still Enabled. First write stalls in ~100–200 ms | [nvme-apst](nvme-apst.html), then [nvme-idle-timeout](nvme-idle-timeout.html) |
| Primary timeout still 100–200 ms | [nvme-idle-timeout](nvme-idle-timeout.html) first |
| Primary already raised. First write hitch-pauses after ~1–2 s | [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html) first |
| GUID missing from powercfg after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| Primary timeout already raised (or at the 60000 ms GUID max). Device stays Present. Named task Ready / 267009. First write after the timeout still hitch-pauses. This GUID on AC is still 15–100 ms | **This page.** Depth after the timeout. Not the timer. Not APST. |

Do not set latency tolerance as the first click. Sleep, lid, ASPM, DISKIDLE, APST, and both NVMe idle timeouts first. Hidden is not 0 ms. A vanished NVMe is ASPM or D3, not this click. On this GUID, 0 ms on AC is the pass. 60000 ms is the opposite of a forever desk.

## What to change (plugged-in Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. ASPM Off on AC. DISKIDLE Never if the row exists. APST Off where firmware exposes it, or skip if missing. Primary NVMe Idle Timeout already raised on AC. Secondary timeout already at the GUID maximum if that row exists. See [nvme-idle-timeout](nvme-idle-timeout.html), [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html), [nvme-apst](nvme-apst.html), and [pcie-link-state-power](pcie-link-state-power.html).
2. Unhide the row if it is missing. Primary NVMe Power State Transition Latency Tolerance is ATTRIB_HIDE on many images. Missing from Hard disk before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Hard disk** → **Primary NVMe Power State Transition Latency Tolerance**. Set **Plugged in** to **0** milliseconds. That is Microsoft’s Performance-scheme AC default. On battery may stay 50–200 ms if the laptop actually travels.
4. Leave both idle-timeout GUIDs and Secondary latency tolerance as siblings. Those are not this click. Secondary tolerance GUID `dbc9e238-6de9-49e3-92cd-8c2b4946b472` is a later pack. Do not cargo-cult this GUID to 60000. Bigger is deeper.
5. Leave APST, ASPM, write-cache, and TRIM alone on this click. The tolerance is not the table. Do not switch RST to Microsoft storNVMe on a public page.
6. Leave the current plan in place. Not a switch to High performance. Do not claim a fleet GPO.
7. Confirm.

```
powercfg -attributes SUB_DISK fc95af4d-40e7-4b6d-835a-56d131dbc80e -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_DISK fc95af4d-40e7-4b6d-835a-56d131dbc80e
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK fc95af4d-40e7-4b6d-835a-56d131dbc80e 0
powercfg /setactive SCHEME_CURRENT
```

`SUB_DISK` / GUID `fc95af4d-40e7-4b6d-835a-56d131dbc80e` is Primary NVMe Power State Transition Latency Tolerance. Units are milliseconds. Microsoft min 0, max `0xea60` = 60000, increment 1. StorNVMe Balanced S0 Working default is 15 ms AC / 50 ms DC. Power Saver is 100 ms AC / 200 ms DC. Performance AC is 0 ms. **0 ms on AC** is the pass for this forever desk: when the idle timeout still fires, only F-states with essentially zero ENLAT+EXLAT stay legal. If powercfg omits the GUID after unhide, this edition did not expose the knob — stop. The timeout is [nvme-idle-timeout](nvme-idle-timeout.html). Secondary timeout is [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html). APST enable is [nvme-apst](nvme-apst.html). Do not paste `nvme_core.default_ps_max_latency_us`. That is Linux. This host is Windows. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. ASPM already Off. APST already Off or skip. DISKIDLE already Never if present. Primary and Secondary idle timeouts already raised. Otherwise this soak is lying about the link, the table, or the timers.
2. Idle past the primary timeout (covers leftover 200 ms and the 60000 ms GUID max). First write to the boot NVMe is not a 10–60 ms F-state hitch. Device Manager still says Present. No re-enumerate.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a stalled first write is not forever if this tolerance is still 15–100 ms.
4. Missing GUID after unhide = skip, not a red soak. Do not invent the millisecond value in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof this GUID is already 0. 0 ms here is not “Never idle.” It is “do not pick a deep F-state.” Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not Primary NVMe Idle Timeout. That first timer is [nvme-idle-timeout](nvme-idle-timeout.html).
- Not Secondary NVMe Idle Timeout. That second timer is [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html).
- Not NVMe APST enable/disable. That table is [nvme-apst](nvme-apst.html).
- Not PCIe ASPM. That link is [pcie-link-state-power](pcie-link-state-power.html).
- Not DISKIDLE. That minutes timer is [hard-disk-idle-timeout](hard-disk-idle-timeout.html).
- Not an enclosure SKU. That review is [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html).
- Not a Linux sysfs paste. This host is Windows.
- Not a High-performance plan essay. One Hard disk row.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
