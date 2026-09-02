# Wireless adapter power saving vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/wifi-adapter-power-saving.html

Companion to [USB 3 Link Power Management](usb3-link-power-management.html) and [USB Ethernet](../reviews/usb-ethernet-operator-host.html). Dedicated USB Ethernet is still the primary path. This pack is the remaining radio: **Wireless Adapter Settings → Power Saving Mode**. Maximum Power Saving can drop Wi-Fi after idle so the fallback is gone the moment SuperSpeed flaps. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend and USB 3 LPM can already be honest on AC. The dedicated NIC is still the ship path. The radio is the backup when that NIC re-enumerates. Balanced defaults Wireless Adapter Settings to Medium or Maximum Power Saving on AC. The adapter parks MIMO antennas, misses beacons, and looks disconnected for seconds. GitHub MCP vanishes. A `git push` hangs. The named hourly task still claims Ready.

This happens while the machine is awake. It is not Modern Standby. It is not USB U1/U2. It is not IEEE 802.3az on the Ethernet PHY.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| USB selective suspend still Enabled on AC | [usb-selective-suspend](usb-selective-suspend.html) |
| USB suspend already Disabled; SuperSpeed NIC still flaps | [usb3-link-power-management](usb3-link-power-management.html) |
| NIC stays Present; ping gaps or speed downshifts | [energy-efficient-ethernet](energy-efficient-ethernet.md) |
| NIC drops only after the laptop entered standby | [network-standby-connectivity](network-standby-connectivity.md) |
| Ethernet already honest; Wi-Fi radio still drops / reassociates while awake | **This page** |
| No dedicated NIC; Wi-Fi is the only path | Hardware fail first. [USB Ethernet review](../reviews/usb-ethernet-operator-host.html). This page does not make Wi-Fi the primary rail. |

Do not set Wireless Adapter Settings to Maximum Performance as the first click on a new host.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend **Plugged in** is already **Disabled**. USB 3 Link Power Management on AC is already **Off** if this SKU exposes it. Dedicated NIC still exists — this page is not a Wi-Fi-only desk.
2. Power Options → Change plan settings → Change advanced power settings → **Wireless Adapter Settings** → **Power Saving Mode**.
3. Set **Plugged in** to **Maximum Performance**. On battery may stay Medium Power Saving if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
4. Device Manager → Network adapters → the Wi-Fi adapter → Properties → **Power Management**. Uncheck **Allow the computer to turn off this device to save power**. That checkbox is the radio sibling of the USB hub checkbox on the selective-suspend page. Do it here, not as a second USB essay.
5. Leave the current plan in place. This is one wireless knob, not a switch to High performance.
6. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_WIFI
powercfg /devicequery wake_armed
```

`SUB_WIFI` is the wireless subgroup on SKUs that expose it. Maximum Performance on AC is the pass for this desk. If the subgroup is missing, this firmware or edition did not expose the plan row — stop at the Device Manager checkbox; do not invent a registry hack on a public page. Hidden is not the same as Maximum Performance. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB suspend already Disabled on AC. USB 3 LPM already Off on AC if the row exists. Lid close already Do nothing on AC. Dedicated NIC still Present.
2. Idle 30 minutes, lid closed, cooling stand in place, Ethernet plugged. Wi-Fi adapter stays Present in Device Manager. One silent radio reassociate is a fail on this page.
3. Do not unplug Ethernet as a required soak. The primary rail stays the dedicated NIC. If you need a fallback proof, disable the Ethernet *adapter* for 60 seconds — not the cable yank — and confirm Wi-Fi already has a known SSID and does not sit in Power Saving. Then re-enable Ethernet.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. A Ready task with a napping radio is not forever.
5. No fourth Grok TUI. Last result 267009 is still-running, not a Wi-Fi bug.

## What this page is not
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not USB 3 Link Power Management. That is [usb3-link-power-management](usb3-link-power-management.html).
- Not Energy Efficient Ethernet. That is [energy-efficient-ethernet](energy-efficient-ethernet.html).
- Not Network connectivity in Standby. That is [network-standby-connectivity](network-standby-connectivity.html).
- Not a USB Ethernet SKU. That is [usb-ethernet-operator-host](../reviews/usb-ethernet-operator-host.html).
- Not a claim that Wi-Fi is the ship path. Ethernet stays primary.
- Not a High-performance plan essay. One wireless setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
