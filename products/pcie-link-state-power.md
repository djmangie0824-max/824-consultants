# PCI Express Link State Power Management vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/pcie-link-state-power.html

Companion to [USB selective suspend](usb-selective-suspend.html). That pack diagnoses a sleeping USB hub/NIC and tells you **not** to cargo-cult PCI Express Link State Power Management as the first click. This pack is the remaining layer: ASPM parking a Thunderbolt/USB4 dock or NVMe while Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend can already be Disabled on AC and the dock still blinks after idle. A USB4/Thunderbolt dock is a PCIe tunnel. Balanced-plan ASPM (Moderate / Maximum power savings) lets the root port nap. Displays black. The dedicated NIC looks unplugged. NVMe for local models re-enumerates. The named hourly task still claims Ready.

Grok in-session schedulers are a different layer: they expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| USB hub / USB NIC slept | [usb-selective-suspend](usb-selective-suspend.html) |
| USB suspend already Disabled on AC; Thunderbolt/USB4 dock, NVMe, or internal PCIe NIC still drops | **This page** |
| NIC stays Present; ping gaps or speed downshifts after idle | [energy-efficient-ethernet](energy-efficient-ethernet.html) |
| Start menu Shut down that was not a boot | [windows-fast-startup](windows-fast-startup.md) |
| No dedicated NIC; Wi-Fi is the only path | Hardware fail. [USB Ethernet review](../reviews/usb-ethernet-operator-host.html) |

Do not set Link State Power Management to Off as the first click on a new host.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend **Plugged in** is already **Disabled**.
2. Power Options → Change plan settings → Change advanced power settings → **PCI Express** → **Link State Power Management**.
3. Set **Plugged in** to **Off**. On battery may stay Moderate if the laptop actually travels.
4. Leave the current plan in place. This is one PCI Express knob, not a switch to High performance.
5. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PCIEXPRESS
powercfg /a
```

If the subgroup is missing, this firmware did not expose the knob. Stop. Do not invent a registry hack on a public page. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB suspend already Disabled on AC. Lid close already Do nothing on AC.
2. Idle 30 minutes, lid closed, cooling stand in place, dock + dedicated NIC plugged.
3. Displays stay, or resume without a Device Manager hunt. One silent dock reset is a fail.
4. NVMe stays Present. A disk that vanishes and re-enumerates is a fail.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. A Ready task with a parked PCIe dock is not forever.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not Energy Efficient Ethernet. That is [energy-efficient-ethernet](energy-efficient-ethernet.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not a dock or NVMe SKU.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
