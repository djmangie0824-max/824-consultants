# Bluetooth adapter power saving vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/bluetooth-adapter-power-saving.html

Companion to [Wi-Fi power saving](wifi-adapter-power-saving.html) and [USB selective suspend](usb-selective-suspend.html). WLAN Maximum Performance and USB suspend Disabled can already be honest on AC and input still dies after idle. This pack is the remaining radio: Device Manager → Bluetooth → Power Management → **Allow the computer to turn off this device to save power**. Checked, a HID dongle naps. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, USB selective suspend, USB 3 LPM, and Wi-Fi Maximum Performance can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Device Manager still lets Windows power-manage the Bluetooth radio. After idle the radio drops. A Bluetooth mouse, keyboard, or headset re-pairs late or not at all. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the TUI froze. The HID radio left.

This is not Wi-Fi. Power Options → Wireless Adapter Settings does not own Bluetooth. This is not USB 3 U1/U2. An on-board CNVi Bluetooth radio is not a SuperSpeed NIC.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| USB suspend still Enabled on AC; USB Bluetooth dongle disappears | [usb-selective-suspend](usb-selective-suspend.html) |
| Wi-Fi radio drops / reassociates; Ethernet already honest | [wifi-adapter-power-saving](wifi-adapter-power-saving.html) |
| Wired USB mouse still works; Bluetooth HID is gone | **This page** |
| No Bluetooth radio in Device Manager | Skip. This firmware did not expose BT. Not a fail. Do not invent a registry paste. |
| Checkbox already unchecked; HID still drops | Different layer. Dongle SKU, USB hub, or 2.4 GHz interference. Hardware, not this click. |

Do not uncheck Bluetooth power management as the first click on a new host. A desk that never uses Bluetooth can skip.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend Plugged in is already Disabled. Wireless Adapter Settings on AC is already Maximum Performance if the WLAN exists. See [USB suspend](usb-selective-suspend.html) and [Wi-Fi](wifi-adapter-power-saving.html). If those are still travel defaults, stop here.
2. Device Manager → **Bluetooth**. Open the radio (often “Intel Wireless Bluetooth”, “Realtek Bluetooth Adapter”, or a USB dongle name). If the branch is missing, skip this page.
3. Properties → **Power Management**. Uncheck **Allow the computer to turn off this device to save power**. Do not disable the device. Do not uninstall the driver.
4. Repeat for a USB Bluetooth dongle if both exist. On-board CNVi and a dongle are two radios.
5. Leave Power Options Wireless Adapter Settings alone. That row is Wi-Fi. Do not hunt a Bluetooth subgroup in advanced power settings.
6. Confirm.

```
Get-PnpDevice -Class Bluetooth | Format-Table Status, Class, FriendlyName
powercfg /query SCHEME_CURRENT SUB_WIFI
```

`Get-PnpDevice -Class Bluetooth` names the radio. Status OK is not proof the Power Management checkbox is off — open the property sheet. `SUB_WIFI` is the Wi-Fi sibling, not this click. There is no portable `SUB_BLUETOOTH` alias on this host class. If Device Manager omits Bluetooth, stop. Do not invent a registry paste on a public page. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB suspend already Disabled on AC. Wi-Fi already Maximum Performance on AC if the radio exists. Otherwise this soak is lying about the bus.
2. Idle 30 minutes, lid closed, dedicated NIC plugged. Bluetooth mouse or keyboard still moves / types without a re-pair. One silent 10-second HID gap after idle is a fail if the checkbox was still on.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a napping BT radio is not forever.
4. The Power Management checkbox still unchecked. If someone re-checked it to "save the radio," uncheck it. Do not "fix" it by switching the whole plan to High performance.
5. Missing Bluetooth branch = skip, not a red soak. Do not invent the checkbox in the registry.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof HID stayed up.

## What this page is not
- Not Wi-Fi power saving. That is [wifi-adapter-power-saving](wifi-adapter-power-saving.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not USB 3 LPM. That is [usb3-link-power-management](usb3-link-power-management.html).
- Not a mouse SKU. That is [mouse-14h-operator](../reviews/mouse-14h-operator.html).
- Not “disable Bluetooth” and not airplane mode.
- Not a High-performance plan essay. One Device Manager checkbox.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
