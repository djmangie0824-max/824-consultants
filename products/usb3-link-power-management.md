# USB 3 Link Power Management vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/usb3-link-power-management.html

Companion to [USB selective suspend](usb-selective-suspend.html). That pack disables device-level D3 / U3 and the hub Power Management checkbox. This pack is the remaining SuperSpeed row: **USB settings → USB 3 Link Power Management**. U1 and U2 can drop a dedicated USB NIC while the laptop still looks awake and Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend can already be Disabled on AC and the NIC still flaps after idle. USB 3 SuperSpeed links have U0 (active), U1 (fast idle), U2 (slower idle), and U3 (suspend). U3 is the selective-suspend layer. This page is U1/U2. Balanced defaults USB 3 LPM to Moderate or Maximum power savings. Cheap ASIX / Realtek USB NICs and many USB-C hubs mishandle U2. The adapter looks unplugged. TCP resets. GitHub MCP vanishes. A `git push` hangs. The named hourly task still claims Ready.

This happens while the machine is awake. It is not Modern Standby. It is not ASPM. It is not IEEE 802.3az.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| USB selective suspend still Enabled on AC | [usb-selective-suspend](usb-selective-suspend.html) |
| USB suspend already Disabled on AC; dedicated USB NIC or USB-C hub still flaps while awake | **This page** |
| USB already honest; Thunderbolt/USB4 dock or NVMe still drops | [pcie-link-state-power](pcie-link-state-power.md) |
| NIC stays Present; ping gaps or speed downshifts | [energy-efficient-ethernet](energy-efficient-ethernet.md) |
| NIC drops only after the laptop entered standby | [network-standby-connectivity](network-standby-connectivity.md) |
| No dedicated NIC; Wi-Fi is the only path | Hardware fail. [USB Ethernet review](../reviews/usb-ethernet-operator-host.html) |

Do not set USB 3 Link Power Management to Off as the first click on a new host.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend **Plugged in** is already **Disabled**. Hub that carries Ethernet already unchecked for *Allow the computer to turn off this device to save power*.
2. Power Options → Change plan settings → Change advanced power settings → **USB settings** → **USB 3 Link Power Management**.
3. Set **Plugged in** to **Off**. On battery may stay Moderate if the laptop actually travels.
4. Leave the current plan in place. This is one USB knob, not a switch to High performance.
5. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_USB
powercfg /a
```

`SUB_USB` is the USB subgroup. USB 3 LPM is a sibling of USB selective suspend on SKUs that expose it. Off on AC is the pass. If the USB 3 LPM row is missing, this firmware or edition did not expose the knob. Stop. Do not invent a registry hack on a public page. Hidden is not the same as Off. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB selective suspend already Disabled on AC. Hub Power Management already honest. Lid close already Do nothing on AC.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. NIC stays Present. One silent re-enumerate is a fail.
3. Ping out the USB NIC. One silent gap is a fail — unless USB suspend is still Enabled (wrong page) or the NIC stays Present and only speed downshifts (EEE).
4. USB-C hub downstream devices stay enumerated if that is the Ethernet path.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. A Ready task with a napping SuperSpeed link is not forever.
6. No fourth Grok TUI. Last result 267009 is still-running, not an LPM bug.

## What this page is not
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not PCI Express ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not Energy Efficient Ethernet. That is [energy-efficient-ethernet](energy-efficient-ethernet.html).
- Not Network connectivity in Standby. That is [network-standby-connectivity](network-standby-connectivity.html).
- Not a High-performance plan essay. One USB setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
