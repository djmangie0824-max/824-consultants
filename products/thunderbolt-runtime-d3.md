# Thunderbolt/USB4 Runtime D3 vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/thunderbolt-runtime-d3.html

Companion after [USB selective suspend](usb-selective-suspend.html), [USB 3 Link Power Management](usb3-link-power-management.html), and [PCI Express ASPM](pcie-link-state-power.html). Those three can already be honest on AC and the dock still full re-enumerates after idle. This pack is the remaining controller: Device Manager → **USB4 Host Router** / Intel Thunderbolt controller → Power Management → **Allow the computer to turn off this device to save power**. That checkbox is Runtime D3. The controller itself goes D3Cold while the laptop is still in S0. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend can already be Disabled on AC. USB 3 LPM can already be Off. PCI Express Link State Power Management can already be Off. The process is still alive. The session is still unlocked. After idle the USB4 Host Router or Thunderbolt controller takes Runtime D3. Displays black, then reconnect. The dock NIC re-enumerates. Device Manager flashes. Kernel-PnP surprise removal. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks Git or the dock SKU failed. The Thunderbolt domain left.

Runtime D3 is not ASPM. ASPM is L0s/L1 on a live D0 device — the controller stays in Device Manager. RTD3 is the device entering D3Hot or D3Cold while the platform stays in S0. A USB4 Host Router that takes D3Cold powers off tunneled DisplayPort, tunneled PCIe, and tunneled USB. Wake needs a PME / in-band hotplug. That is a full re-enumerate, not a SuperSpeed U2 blink and not a USB Root Hub nap.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| USB selective suspend still Enabled on AC, or USB Root Hub still has “turn off this device” | [usb-selective-suspend](usb-selective-suspend.html) |
| USB suspend already Disabled; SuperSpeed USB NIC / USB-C hub flaps without the Thunderbolt controller leaving | [usb3-link-power-management](usb3-link-power-management.html) |
| USB already honest. Dock or NVMe drops quietly; USB4 Host Router stays Present | [pcie-link-state-power](pcie-link-state-power.html) |
| USB + USB 3 LPM + ASPM already honest. USB4 Host Router or Thunderbolt controller itself disappears then returns | **This page** |
| No USB4 Host Router and no Thunderbolt controller in Device Manager | Skip. This firmware is USB-C / xHCI only. Not a fail. Do not invent a registry paste. |
| Controller stays Present; checkbox already unchecked; dock still full re-enumerates | Different layer. Cable, PD budget, or dock firmware. Hardware. [Dock review](../reviews/dock-multi-monitor.html). |

Do not uncheck Thunderbolt Runtime D3 as the first click on a new host. Do not uncheck Power Management on every PCI Express Root Port.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend Plugged in is already **Disabled**. USB 3 Link Power Management on AC is already **Off** if the row exists. PCI Express Link State Power Management on AC is already **Off** if the row exists. See [USB suspend](usb-selective-suspend.html), [USB 3 LPM](usb3-link-power-management.html), and [ASPM](pcie-link-state-power.html). If those are still travel defaults, stop here.
2. Device Manager → **View → Devices by connection**. Find **USB4 Host Router** (Microsoft USB4 stack) and/or **Intel(R) Thunderbolt(TM) Controller**. They hang off a PCI Express Root Port. If neither exists, skip this page.
3. Properties → **Power Management**. Uncheck **Allow the computer to turn off this device to save power** on the Host Router and on the Thunderbolt controller. Do not disable the device. Do not uninstall `usb4.sys`. Do not uninstall the Intel Thunderbolt driver.
4. Leave the PCI Express Root Port checkbox alone. Unchecking the parent root port is a cargo-cult that can D3 other devices on that port.
5. Intel Thunderbolt Control Center, if it is already installed: disable Runtime D3 / RTD3 if that settings row exists. If Control Center is not installed, skip. Do not download a random Intel utility from a forum.
6. BIOS TBT RTD3 only if the Device Manager checkbox is missing or does not stick across reboot. Firmware names vary: Thunderbolt Runtime D3, TBT RTD3, USB4 Runtime D3. Set Disabled on a desk that never unplugs. Do not flash Thunderbolt firmware from this page.
7. Leave the current plan in place. This is one Device Manager checkbox, not a switch to High performance.
8. Confirm.

```
Get-PnpDevice | Where-Object { $_.FriendlyName -match 'Thunderbolt|USB4 Host Router' } | Format-Table Status, Class, FriendlyName
powercfg /query SCHEME_CURRENT SUB_PCIEXPRESS
powercfg /query SCHEME_CURRENT SUB_USB
```

`Get-PnpDevice` names the controller. Status OK is not proof the Power Management checkbox is off — open the property sheet. `SUB_PCIEXPRESS` is ASPM. `SUB_USB` is USB selective suspend and USB 3 LPM. Those queries prove the earlier layers, not this click. There is no portable `SUB_THUNDERBOLT` alias on this host class. If Device Manager omits USB4 and Thunderbolt, stop. Do not invent a registry paste on a public page. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB selective suspend already Disabled on AC. USB 3 LPM already Off on AC if the row exists. PCI Express ASPM already Off on AC if the row exists. Lid close already Do nothing on AC. Otherwise this soak is lying about the bus.
2. Idle 30 minutes, lid closed, cooling stand in place, Thunderbolt/USB4 dock + dedicated NIC plugged. The USB4 Host Router / Thunderbolt controller stays Present. One silent controller disappearance is a fail.
3. Displays stay, or resume without a “monitor identified” reconnect storm. One full dock re-enumerate is a fail — but if the controller never left Device Manager, it is ASPM or USB, not this one.
4. Dock NIC stays Present. A NIC that vanishes with the controller is this page. A NIC that flaps while the controller stays OK is USB 3 LPM or USB suspend.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. A Ready task with a D3Cold Thunderbolt domain is not forever.
6. The Power Management checkbox still unchecked. If firmware re-checked it after reboot, that is the BIOS TBT RTD3 step, not a High-performance plan switch.
7. Missing USB4 and Thunderbolt names = skip, not a red soak. Do not invent the checkbox in the registry.
8. No fourth Grok TUI. Last result 267009 is still-running, not proof the dock stayed up.

## What this page is not
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not USB 3 LPM. That is [usb3-link-power-management](usb3-link-power-management.html).
- Not PCI Express ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not Energy Efficient Ethernet. That is [energy-efficient-ethernet](energy-efficient-ethernet.html).
- Not a dock or NVMe SKU. That is [dock-multi-monitor](../reviews/dock-multi-monitor.html) and [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html).
- Not a Thunderbolt firmware flash, not a BIOS unlock guide, and not an Intel Control Center install.
- Not “uncheck Power Management on every PCI Express Root Port.”
- Not a High-performance plan essay. One Device Manager checkbox.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
