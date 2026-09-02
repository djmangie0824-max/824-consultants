# Network connectivity in Standby vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/network-standby-connectivity.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [Energy Efficient Ethernet](energy-efficient-ethernet.md). Sleep-vs-forever diagnoses S0ix pausing the hourly. EEE is IEEE 802.3az while the session is still awake. This pack is the NIC-during-S0ix policy: Windows **Network connectivity in Standby** can drop the dedicated Ethernet adapter the moment the laptop enters connected standby.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend, ASPM, and EEE can already be honest and the dedicated NIC still dies only after Modern Standby. Settings values:

- **Always** — keep network during Standby on this plugged-in desk.
- **Managed by Windows** — often treats a laptop as a battery even with a GaN brick in.
- **Never** — disconnects Ethernet during S0ix on purpose.

Wake timers are a different layer ([wake-timers-forever](wake-timers-forever.html)): whether a named task can leave sleep. This page is whether the NIC is still there when it does.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| S0ix paused the hourly | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Sleep happened and the hourly never recovered | [wake-timers-forever](wake-timers-forever.md) |
| USB hub / USB NIC vanished while awake | [usb-selective-suspend](usb-selective-suspend.html) |
| USB4/Thunderbolt dock or NVMe dropped while awake | [pcie-link-state-power](pcie-link-state-power.html) |
| NIC Present while awake; ping gapped or speed downshifted | [energy-efficient-ethernet](energy-efficient-ethernet.html) |
| USB / ASPM / EEE honest; NIC Present; link dies only after S0ix | **This page** |
| No dedicated NIC; Wi-Fi is the only path | Hardware fail. [USB Ethernet review](../reviews/usb-ethernet-operator-host.html) |

Do not set Always as the first click on a new host. Do not cargo-cult Always onto a battery-only commute laptop.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend is Disabled on AC. ASPM Off if USB4/Thunderbolt is in the path. EEE / Green Ethernet Disabled on the dedicated adapter.
2. Settings → System → Power & battery → **Network connectivity in Standby** = **Always** on this plugged-in desk. Not Never. Not Managed by Windows.
3. If the Settings row is missing, query the Sleep subgroup. Do not invent a registry hack on a public page.
4. Do not copy Always onto On battery.
5. Confirm.

```
powercfg /a
powercfg /q SCHEME_CURRENT SUB_SLEEP
Get-NetAdapter | Where-Object Status -eq 'Up' | Format-Table Name, InterfaceDescription, LinkSpeed, MediaConnectionState
```

If Standby is not available, this page does not apply — classic S3 is sleep-vs-forever timeouts. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB / ASPM / EEE already honest.
2. Network connectivity in Standby is Always on AC.
3. Short S0ix, lid closed, cooling stand in place, dedicated NIC plugged. Adapter still Up with a DHCP lease after resume. No human replug.
4. Vanished NIC = USB or ASPM. Awake downshift = EEE. This page is Standby-only disconnect.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not wake timers. That is [wake-timers-forever](wake-timers-forever.html).
- Not USB selective suspend, ASPM, or EEE.
- Not a USB Ethernet SKU.
- Not permission to keep 5-minute sleep because the NIC stays up.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
