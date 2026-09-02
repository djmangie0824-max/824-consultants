# Hard disk idle timeout vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/hard-disk-idle-timeout.html

Companion to [AHCI LPM](ahci-link-power-management.html). HIPM/DIPM can already be Active on AC and a ship still stalls on the first write after idle. This pack is the remaining minutes knob: **Hard disk → Turn off hard disk after**. Balanced AC is often 20 minutes. A SATA HDD, a USB spinning fallback, or a SATA SSD that still honors STANDBY then parks. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, USB selective suspend, USB 3 LPM, PCIe ASPM, and AHCI LPM can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Balanced **Turn off hard disk after** on AC is often 20 minutes. Windows issues the idle timeout. Platters spin down. Some SATA SSDs still take a STANDBY IMMEDIATE and stall the next I/O. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks Git hung. A disk idle timer fired.

This is not HIPM. This is not USB 3 U1/U2. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. The disk idle value is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| SATA PHY flaps; HIPM/DIPM is not Active | [ahci-link-power-management](ahci-link-power-management.html) |
| USB suspend already Disabled; SuperSpeed NIC still flaps | [usb3-link-power-management](usb3-link-power-management.html) |
| Thunderbolt/USB4 dock or NVMe drops after USB is honest | [pcie-link-state-power](pcie-link-state-power.html) |
| USB NIC / Wi-Fi radio dropped | USB / Wi-Fi playbooks. Wrong page. |
| AHCI LPM already Active on AC if the row exists. Session awake. Named task Ready / 267009. First write after ~20 minutes waits on a disk. Turn off hard disk after is not Never | **This page** |
| NVMe-only laptop. DISKIDLE already 0, or the disk never stalls after idle | This firmware ignores the minutes knob. Stop. Not a fail. Not a registry hack. |

Do not set Turn off hard disk after to Never as the first click on a new host. NVMe-only that never stalls is a skip.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm AHCI LPM is already Active on AC if the row exists. If HIPM/DIPM still parks the PHY, that is [AHCI LPM](ahci-link-power-management.html), not this page. USB 3 LPM and PCIe ASPM already Off on AC if those buses exist.
3. Power Options → Change plan settings → Change advanced power settings → **Hard disk** → **Turn off hard disk after**.
4. Set **Plugged in** to **Never** (0 minutes). On battery may stay 5–20 minutes if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave AHCI Link Power Management alone on this click. HIPM/DIPM is the PHY. This row is idle minutes.
6. Leave USB enclosure firmware alone. A USB HDD that spins down from its own box timer is not this Windows knob.
7. Leave the current plan in place. This is one hard-disk knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_DISK DISKIDLE
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK DISKIDLE 0
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

`SUB_DISK` is the hard-disk subgroup. `DISKIDLE` is Turn off hard disk after. The AC index is **seconds**. **0** is Never. 1200 is 20 minutes — the usual Balanced lie. Apply with `/setactive` or the GUI change does not take. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Never. If powercfg also omits DISKIDLE, this firmware did not expose the knob — stop; do not invent a registry hack on a public page. AHCI LPM is HIPM/DIPM, not this click. USB 3 LPM is SuperSpeed, not this click. PCIe ASPM is the dock/NVMe bus, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. AHCI LPM already Active on AC if the row exists. USB 3 LPM and PCIe ASPM already Off on AC if those rows exist. Otherwise this soak is lying about the bus.
2. Idle 30 minutes, lid closed, dedicated NIC plugged. The Grok TUI still accepts input. First write after idle is not a multi-second spin-up stall. One silent wait on the first Git object is a fail if DISKIDLE was not 0 and a SATA/USB disk is in the path.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a spun-down disk is not forever.
4. DISKIDLE still 0 on AC. If someone set 20 minutes to "save the SSD," restore Never. Do not "fix" it by switching the whole plan to High performance.
5. NVMe-only host that never stalls = skip, not a red soak. Do not invent STANDBY in the registry to make this page apply.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the disk stayed up.

## What this page is not
- Not AHCI LPM. That is [ahci-link-power-management](ahci-link-power-management.html).
- Not USB 3 LPM. That is [usb3-link-power-management](usb3-link-power-management.html).
- Not PCIe ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not an NVMe enclosure SKU. That is [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html).
- Not a High-performance plan essay. One hard-disk setting.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
