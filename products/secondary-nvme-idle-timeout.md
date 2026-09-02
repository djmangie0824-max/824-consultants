# Secondary NVMe idle timeout vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/secondary-nvme-idle-timeout.html

Companion to [Primary NVMe Idle Timeout](nvme-idle-timeout.html) and [NVMe APST](nvme-apst.html). Primary is the first host timer into F1. APST is the controller table on/off. ASPM is the PCIe link. DISKIDLE is minutes on a spinning or USB disk. This pack is the remaining host timer: **Hard disk → Secondary NVMe Idle Timeout**. GUID `d3d55efd-c1ff-424e-9dc3-441be7833010`. StorNVMe Balanced default in S0 Working is **2000 ms AC / 1000 ms DC**. After Primary already walked a non-operational F-state, two seconds later the driver considers deeper F2. The NVMe stays Present. The first write after a quiet gap stalls harder than F1. Task Scheduler still shows Ready. The timeout is not APST enable.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Primary timeout can already be raised. APST can already be Off. ASPM can already be Off. DISKIDLE can already be Never. A ship still hitch-pauses on the first write after a couple of idle seconds. Device Manager still says Present. No re-enumerate. `schtasks` still prints Ready and last result 267009. The operator thinks Git hung. Secondary NVMe Idle Timeout is still 2000 ms. Primary walked F1. Secondary walked F2.

This is not a vanished NVMe. A device that disappears is ASPM or D3. This page is Present + a deeper stall than Primary. Do not paste `nvme_core.default_ps_max_latency_us=0` on this Windows profile. Do not cargo-cult this GUID to **0**. Zero is not “never.” Zero means StorNVMe may consider the deeper F-state as soon as Primary has already fired.

Grok in-session schedulers expire in 7 days even when durable. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| NVMe disappears then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) or PCI D3 |
| SATA PHY flaps; HIPM/DIPM is not Active | [ahci-link-power-management](ahci-link-power-management.html) |
| Spinning or USB disk waits on spin-up; DISKIDLE is not 0 | [hard-disk-idle-timeout](hard-disk-idle-timeout.html) |
| ASPM Off. BIOS APST still Enabled. First write stalls in ~100–200 ms | [nvme-apst](nvme-apst.html), then [nvme-idle-timeout](nvme-idle-timeout.html) |
| Primary timeout already long. First write still hitch-pauses after ~1–2 s idle. Device stays Present | **This page.** Secondary host idle timeout. Not Primary. Not APST. |
| GUID missing from powercfg after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| Want “Never” on this GUID | Impossible. Microsoft max is `0xea60` = **60000 ms**. Pair with Primary, APST Off, ASPM Off, and [nvme-noppme](nvme-noppme.html). |

Do not set Secondary NVMe Idle Timeout as the first click. Sleep, lid, ASPM, DISKIDLE, APST, and Primary timeout first. Hidden is not a long timeout. A vanished NVMe is ASPM or D3, not this click. Zero is not never.

## What to change (plugged-in Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. ASPM Off on AC. DISKIDLE Never if the row exists. APST Off where firmware exposes it, or skip if missing. Primary NVMe Idle Timeout already raised on AC. See [nvme-idle-timeout](nvme-idle-timeout.html), [nvme-apst](nvme-apst.html), and [pcie-link-state-power](pcie-link-state-power.html).
2. Unhide the row if it is missing. Secondary NVMe Idle Timeout is ATTRIB_HIDE on many images. Missing from Hard disk before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Hard disk** → **Secondary NVMe Idle Timeout**. Set **Plugged in** to the GUID maximum. On this forever desk, **60000 ms** is the pass. On battery may stay 1000 ms if the laptop actually travels.
4. Leave Primary NVMe Idle Timeout, both latency-tolerance GUIDs, and NVMe NOPPME as siblings. Those are not this click. Do not cargo-cult Secondary to zero. Zero is not “never.”
5. Leave APST, ASPM, write-cache, and TRIM alone on this click. The timeout is not the table. Do not switch RST to Microsoft storNVMe on a public page.
6. Leave the current plan in place. Not a switch to High performance. Do not claim a fleet GPO.
7. Confirm.

```
powercfg -attributes SUB_DISK d3d55efd-c1ff-424e-9dc3-441be7833010 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_DISK d3d55efd-c1ff-424e-9dc3-441be7833010
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK d3d55efd-c1ff-424e-9dc3-441be7833010 60000
powercfg /setactive SCHEME_CURRENT
```

`SUB_DISK` / GUID `d3d55efd-c1ff-424e-9dc3-441be7833010` is Secondary NVMe Idle Timeout. Units are milliseconds. Microsoft min 0, max `0xea60` = 60000, increment 1. Balanced S0 Working default is 2000 ms AC / 1000 ms DC — that is not a pass for this desk. **60000 ms (60 seconds) on AC** is the honest host-forever ceiling this GUID allows. A 5-minute pulse can still walk F2 if the desk sits quiet longer than 60 seconds. That is a GUID limit, not a lie. If powercfg omits the GUID after unhide, this edition did not expose the knob — stop. Primary is [nvme-idle-timeout](nvme-idle-timeout.html). NOPPME is [nvme-noppme](nvme-noppme.html). APST enable is [nvme-apst](nvme-apst.html). Do not paste `nvme_core.default_ps_max_latency_us`. That is Linux. This host is Windows. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. ASPM already Off. APST already Off or skip. DISKIDLE already Never if present. Primary timeout already raised. Otherwise this soak is lying about the link, the table, or F1.
2. Idle past 2 seconds (covers leftover Balanced 2000 ms) and past 60 seconds (covers the GUID max). First write to the boot NVMe is not a stall. Device Manager still says Present. No re-enumerate.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a stalled first write is not forever if this timeout is still 2000 ms.
4. Missing GUID after unhide = skip, not a red soak. Do not invent the millisecond value in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the timeout is already 60000. 60000 is still not Never. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not Primary NVMe Idle Timeout. That first timer is [nvme-idle-timeout](nvme-idle-timeout.html).
- Not NVMe NOPPME. That On/Off is [nvme-noppme](nvme-noppme.html).
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
