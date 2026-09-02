# AHCI Link Power Management vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/ahci-link-power-management.html

Companion to [USB 3 LPM](usb3-link-power-management.html) and [PCIe ASPM](pcie-link-state-power.html). SuperSpeed and PCIe links can already be Off on AC and a ship still stalls on disk. This pack is the remaining SATA/AHCI link: **Hard disk → AHCI Link Power Management - HIPM/DIPM**. HIPM+DIPM parks the PHY. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, USB selective suspend, USB 3 LPM, and PCIe ASPM can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Balanced **AHCI Link Power Management - HIPM/DIPM** on AC is often HIPM+DIPM. Host-initiated and device-initiated link power drop the SATA PHY. The next Git object, Pages payload, or Grok session write waits on a link that went to Partial/Slumber. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the NVMe died. A SATA link napped.

This is not USB. This is not PCIe ASPM. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. The AHCI link policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| USB suspend already Disabled; SuperSpeed NIC still flaps | [usb3-link-power-management](usb3-link-power-management.html) |
| Thunderbolt/USB4 dock or NVMe drops after USB is honest | [pcie-link-state-power](pcie-link-state-power.html) |
| Mechanical disk spins down after N minutes; AHCI LPM already Active | Different layer. Hard disk idle timeout is not this page. Do not invent a second click here. |
| USB NIC / Wi-Fi radio dropped | USB / Wi-Fi playbooks. Wrong page. |
| USB 3 LPM and PCIe ASPM already Off on AC. Session awake. Named task Ready / 267009. Disk or SATA fallback disappears for seconds then returns. HIPM/DIPM is not Active | **This page** |
| Row missing from GUI and from `powercfg /query` | This firmware or NVMe-only edition did not expose AHCI LPM. Stop. Not a fail. Not a registry hack. |

Do not set AHCI LPM to Active as the first click on a new host. Missing row on an NVMe-only laptop is a skip.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm USB 3 LPM and PCIe ASPM are already Off on AC if those rows exist. If they still allow U1/U2 or ASPM, that is [USB 3 LPM](usb3-link-power-management.html) or [PCIe ASPM](pcie-link-state-power.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Hard disk** → **AHCI Link Power Management - HIPM/DIPM**.
4. Set **Plugged in** to **Active**. On battery may stay HIPM or HIPM+DIPM if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave HIPM-only and DIPM-only alone on AC. Active is no link power management. HIPM still lets the host park the PHY.
6. Leave “Turn off hard disk after” as a sibling. That is idle timeout / spin-down, not link power. Do not treat 20 minutes as this click.
7. Leave the current plan in place. This is one hard-disk knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_DISK
powercfg /a
```

`SUB_DISK` is the hard-disk subgroup. The AHCI LPM row is HIPM/DIPM (aliases vary by edition; look for HIPM, DIPM, or “AHCI Link Power Management”). **Active** on AC is the pass for this desk: no host-initiated and no device-initiated SATA link power. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Active. If powercfg also omits it, this firmware did not expose the knob — stop; do not invent a registry hack on a public page. USB 3 LPM is SuperSpeed, not this click. PCIe ASPM is the dock/NVMe bus, not this click. Disk idle timeout is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. USB 3 LPM already Off on AC if the row exists. PCIe ASPM already Off on AC if the row exists. Otherwise this soak is lying about the bus.
2. Idle 30 minutes, lid closed, dedicated NIC plugged. The Grok TUI still accepts input. Disk Present does not flap. One silent 2-second stall on the first write after idle is a fail if the AHCI row exists and was not Active.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a napping SATA PHY is not forever.
4. AHCI LPM still Active on AC. If someone set HIPM+DIPM to "save the SSD," restore Active. Do not "fix" it by switching the whole plan to High performance.
5. Missing row + NVMe-only host = skip, not a red soak. Do not invent HIPM in the registry to make this page apply.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the SATA link stayed up.

## What this page is not
- Not USB 3 LPM. That is [usb3-link-power-management](usb3-link-power-management.html).
- Not PCIe ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not “Turn off hard disk after.” Idle timeout is a sibling.
- Not an NVMe enclosure SKU. That is [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html).
- Not a High-performance plan essay. One hard-disk setting.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
