# Energy Efficient Ethernet vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/energy-efficient-ethernet.html

Companion to [USB selective suspend](usb-selective-suspend.html). That pack diagnoses a sleeping USB hub/NIC and unchecks “turn off this device” on the USB Root Hub. This pack is the remaining PHY layer: IEEE 802.3az Low Power Idle (Green Ethernet / EEE) on the dedicated adapter while Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend can already be Disabled on AC and the dedicated NIC still gaps after idle, or the negotiated speed falls to 100 Mb while the adapter stays Present. Realtek often labels the knob Green Ethernet. Intel often labels it Energy Efficient Ethernet. A USB4/Thunderbolt dock nap is a different layer ([PCIe ASPM](pcie-link-state-power.html)).

Grok in-session schedulers are a different layer: they expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| USB hub / USB NIC vanished | [usb-selective-suspend](usb-selective-suspend.html) |
| USB suspend already Disabled on AC; Thunderbolt/USB4 dock or NVMe still drops | [pcie-link-state-power](pcie-link-state-power.html) |
| USB suspend already Disabled; NIC stays Present; ping gaps or speed downshifts | **This page** |
| No dedicated NIC; Wi-Fi is the only path | Hardware fail. [USB Ethernet review](../reviews/usb-ethernet-operator-host.html) |

Do not disable Energy Efficient Ethernet as the first click on a new host. Do not cargo-cult this onto Wi-Fi.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend **Plugged in** is already **Disabled**. USB Root Hub that feeds Ethernet already has “Allow the computer to turn off this device” unchecked.
2. Device Manager → Network adapters → **the dedicated Ethernet adapter** (not Wi-Fi).
3. Properties → **Advanced** → Energy Efficient Ethernet / Green Ethernet / EEE = **Disabled**. Ultra Low Power or Reduce Speed During Standby, if listed, Disabled.
4. Same adapter → **Power Management** → uncheck **Allow the computer to turn off this device to save power**. That is not the USB Root Hub checkbox.
5. Confirm.

```
Get-NetAdapter | Where-Object Status -eq 'Up' | Format-Table Name, InterfaceDescription, LinkSpeed
Get-NetAdapterAdvancedProperty -Name '*' | Where-Object { $_.DisplayName -match 'Energy|Green|EEE|Idle' } | Format-Table Name, DisplayName, DisplayValue
```

If no Energy / Green / EEE property exists, this driver did not expose the knob. Stop. Do not invent a registry hack on a public page. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB suspend already Disabled on AC.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged.
3. Ping out that NIC. One silent gap is a fail — but if the NIC vanished, it is USB or ASPM, not this page.
4. Link speed after idle matches link speed before idle. A quiet downshift to 100 Mb is a fail here.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. A Ready task with a napping PHY is not forever.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not PCIe ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not a USB Ethernet SKU.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
