# Primary NVMe idle timeout vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/nvme-idle-timeout.html

Companion to [NVMe APST](nvme-apst.html) and [PCIe ASPM](pcie-link-state-power.html). APST is the controller table on/off. ASPM is the PCIe link. DISKIDLE is minutes on a spinning or USB disk. This pack is the remaining host timer: **Hard disk → Primary NVMe Idle Timeout**. GUID `d639518a-e56d-4345-8af2-b9f32fb26109`. Balanced default is often 100–200 ms. The NVMe stays Present. The first write after idle stalls. Task Scheduler still shows Ready. The timeout is not APST enable.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. ASPM can already be Off. APST can already be Off where firmware exposes it. DISKIDLE can already be Never. A ship still stalls on the first write after a few idle seconds. Device Manager still says Present. No re-enumerate. `schtasks` still prints Ready and last result 267009. The operator thinks Git hung. Primary NVMe Idle Timeout walked PS0 in milliseconds. APST Off does not replace a 200 ms host timeout when the row still exists.

This is not a vanished NVMe. A device that disappears is ASPM or D3. This page is Present + stall. Do not paste `nvme_core.default_ps_max_latency_us=0` on this Windows profile.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| NVMe disappears then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) or PCI D3 |
| SATA PHY flaps; HIPM/DIPM is not Active | [ahci-link-power-management](ahci-link-power-management.html) |
| Spinning or USB disk waits on spin-up; DISKIDLE is not 0 | [hard-disk-idle-timeout](hard-disk-idle-timeout.html) |
| USB-C NVMe stick brown-out or UASP drop | [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html) |
| ASPM Off. BIOS APST still Enabled. Device stays Present. First write stalls | [nvme-apst](nvme-apst.html) first. Then this page is leftover. |
| GUID missing from powercfg after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| ASPM already Off. APST already Off or skip. NVMe stays Present. Named task Ready / 267009. First write after idle is a stall. Primary NVMe Idle Timeout on AC is still 100–200 ms | **This page.** Host idle timeout. Not APST enable. Not ASPM. |

Do not set Primary NVMe Idle Timeout as the first click. Sleep, lid, ASPM, DISKIDLE, and APST first. Hidden is not a long timeout. A vanished NVMe is ASPM or D3, not this click.

## What to change (plugged-in Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. ASPM Off on AC. DISKIDLE Never if the row exists. APST Off where firmware exposes it, or skip if missing. See [nvme-apst](nvme-apst.html) and [pcie-link-state-power](pcie-link-state-power.html).
2. Unhide the row if it is missing. Primary NVMe Idle Timeout is ATTRIB_HIDE on many images. Missing from Hard disk before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Hard disk** → **Primary NVMe Idle Timeout**. Set **Plugged in** far above 200 ms. On this forever desk, a large millisecond value (or the GUI maximum) is the pass. On battery may stay short if the laptop actually travels.
4. Leave Secondary NVMe Idle Timeout and NVMe Power State Transition Latency Tolerance as siblings. Those are not this click. Do not cargo-cult them to zero. Zero is not “never.”
5. Leave APST, ASPM, write-cache, and TRIM alone on this click. The timeout is not the table. Do not switch RST to Microsoft storNVMe on a public page.
6. Leave the current plan in place. Not a switch to High performance. Do not claim a fleet GPO.
7. Confirm.

```
powercfg -attributes SUB_DISK d639518a-e56d-4345-8af2-b9f32fb26109 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_DISK d639518a-e56d-4345-8af2-b9f32fb26109
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK d639518a-e56d-4345-8af2-b9f32fb26109 2000000
powercfg /setactive SCHEME_CURRENT
```

`SUB_DISK` / GUID `d639518a-e56d-4345-8af2-b9f32fb26109` is Primary NVMe Idle Timeout. Units are milliseconds. Balanced default 100–200 is not a pass for this desk. **2000000 ms (~33 minutes) on AC** is an honest host-forever try — long enough that a 5-minute pulse does not walk PS0 between fires. If powercfg omits the GUID after unhide, this edition did not expose the knob — stop. Secondary NVMe Idle Timeout is a sibling, not this click. APST enable is [nvme-apst](nvme-apst.html), not this click. Do not paste `nvme_core.default_ps_max_latency_us`. That is Linux. This host is Windows. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. ASPM already Off. APST already Off or skip. DISKIDLE already Never if present. Otherwise this soak is lying about the link or the table.
2. Idle past a few seconds (covers a leftover 200 ms) and past a minute. First write to the boot NVMe is not a stall. Device Manager still says Present. No re-enumerate.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a stalled first write is not forever if this timeout is still 200 ms.
4. Missing GUID after unhide = skip, not a red soak. Do not invent the millisecond value in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the timeout is already long. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
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
