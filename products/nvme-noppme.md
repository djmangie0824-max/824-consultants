# NVMe NOPPME vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/nvme-noppme.html

Companion to [Primary NVMe Idle Timeout](nvme-idle-timeout.html) and [Secondary NVMe Idle Timeout](secondary-nvme-idle-timeout.html). Those packs are millisecond timers. APST is the controller table. ASPM is the PCIe link. This pack is the remaining On/Off: **Hard disk → NVMe NOPPME**. GUID `fc7372b6-ab2d-43ee-8797-15e9841f2cca`. Alias `DISKNVMENOPPME`. Friendly names are **Off** (index 0) and **On** (index 1). NOPPME is Non-Operational Power State Permissive Mode. When On, StorNVMe may permit the NVMe non-operational power-state feature while the disk looks Present. Balanced images often leave it **On on AC / Off on DC**. Task Scheduler still shows Ready. The first write after idle still waits on a non-op wakeup. The checkbox is not an idle timeout.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Primary timeout can already be raised. Secondary timeout can already be 60000 ms. APST can already be Off. ASPM can already be Off. A ship still hitch-pauses on the first write after idle. Device Manager still says Present. `schtasks` still prints Ready and last result 267009. The operator thinks Git hung. NVMe NOPPME is still On on AC. Permissive mode is still allowed. The controller may sit in a non-operational power state (NOPS=1: no I/O processed until a doorbell) even though the timeouts look long. Off is the remaining click. Off is not “delete every F-state.” Timeouts still exist. Off is “do not permit the non-operational power-state feature on this plugged-in desk.”

Do not paste `nvme_core.default_ps_max_latency_us=0` on this Windows profile.

Grok in-session schedulers expire in 7 days even when durable. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| NVMe disappears then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) or PCI D3 |
| First write stalls in ~100–200 ms; Primary still 100–200 ms | [nvme-idle-timeout](nvme-idle-timeout.html) |
| Primary already long. First write hitch-pauses after ~1–2 s | [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html) |
| ASPM Off. BIOS APST still Enabled | [nvme-apst](nvme-apst.html) |
| Timeouts already honest. NOPPME still On on AC. First write after idle still waits. Device stays Present | **This page.** Permissive mode On/Off. Not a millisecond timer. |
| GUID missing from powercfg after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |

Do not set NOPPME as the first click. Sleep, lid, ASPM, DISKIDLE, APST, Primary timeout, and Secondary timeout first. Hidden is not Off. Off is not Never-F-state. A vanished NVMe is ASPM or D3, not this checkbox.

## What to change (plugged-in Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. ASPM Off on AC. DISKIDLE Never if the row exists. APST Off where firmware exposes it, or skip if missing. Primary and Secondary NVMe idle timeouts already raised on AC. See [nvme-idle-timeout](nvme-idle-timeout.html) and [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html).
2. Unhide the row if it is missing. NVMe NOPPME is ATTRIB_HIDE on many images. Missing from Hard disk before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Hard disk** → **NVMe NOPPME**. Set **Plugged in** to **Off**. On battery may stay Off (typical) or follow OEM. Do not flip DC On to “make it match AC.”
4. Leave both idle-timeout GUIDs and both latency-tolerance GUIDs as siblings. Those are milliseconds. This click is On/Off. Do not cargo-cult timeouts to zero because NOPPME moved.
5. Leave APST, ASPM, write-cache, and TRIM alone on this click. Permissive mode is not the APST table. Do not switch RST to Microsoft storNVMe on a public page.
6. Leave the current plan in place. Not a switch to High performance. Do not claim a fleet GPO.
7. Confirm.

```
powercfg -attributes SUB_DISK fc7372b6-ab2d-43ee-8797-15e9841f2cca -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_DISK fc7372b6-ab2d-43ee-8797-15e9841f2cca
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK fc7372b6-ab2d-43ee-8797-15e9841f2cca 0
powercfg /setactive SCHEME_CURRENT
```

`SUB_DISK` / GUID `fc7372b6-ab2d-43ee-8797-15e9841f2cca` is NVMe NOPPME. Alias `DISKNVMENOPPME`. Index 0 = Off. Index 1 = On. Balanced images often ship On on AC. **Off on AC** is the honest host-forever try on a plugged-in Interactive desk. If powercfg omits the GUID after unhide, this edition did not expose the knob — stop. Off does not delete Primary/Secondary idle timeouts. Those milliseconds still fire. Do not paste `nvme_core.default_ps_max_latency_us`. That is Linux. This host is Windows. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. ASPM already Off. APST already Off or skip. DISKIDLE already Never if present. Primary and Secondary timeouts already raised. Otherwise this soak is lying about the timers.
2. Confirm AC index is 0. Idle past a few seconds and past a minute. First write to the boot NVMe is not a stall. Device Manager still says Present. No re-enumerate.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a stalled first write is not forever if NOPPME is still On.
4. Missing GUID after unhide = skip, not a red soak. Do not invent an On/Off DWORD in the registry on a public page.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof NOPPME is already Off. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not Primary NVMe Idle Timeout. That first timer is [nvme-idle-timeout](nvme-idle-timeout.html).
- Not Secondary NVMe Idle Timeout. That second timer is [secondary-nvme-idle-timeout](secondary-nvme-idle-timeout.html).
- Not NVMe APST enable/disable. That table is [nvme-apst](nvme-apst.html).
- Not PCIe ASPM. That link is [pcie-link-state-power](pcie-link-state-power.html).
- Not DISKIDLE. That minutes timer is [hard-disk-idle-timeout](hard-disk-idle-timeout.html).
- Not an enclosure SKU. That review is [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html).
- Not a Linux sysfs paste. This host is Windows.
- Not a High-performance plan essay. One Hard disk On/Off.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
