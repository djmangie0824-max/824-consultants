# Wake on Magic Packet vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/wake-on-magic-packet.html

Companion to [Allow wake timers](wake-timers-forever.html) and [powercfg /lastwake](powercfg-lastwake.html). Those packs are Windows RTC / important-only timers and the log of who yanked the last sleep. This pack is the NIC property: Device Manager → dedicated Ethernet → Power Management “Allow this device to wake the computer” plus Advanced **Wake on Magic Packet** and **Wake on pattern match**. A directed LAN packet can yank Modern Standby or S3 at 03:00 after sleep, lid, USB suspend, ASPM, and EEE are already honest. That wake is not proof `LEXXII-Materialize-Forever` fired.

## What this is
OEM defaults often leave Magic Packet On. Pattern match is broader than a classic WoL frame. Task Scheduler WakeToRun and Allow wake timers do not own a magic packet. The NIC does. Turning the whole USB Ethernet device off is the wrong fix — the [dedicated NIC](../reviews/usb-ethernet-operator-host.html) is the ship path. This page is two Advanced properties and the wake checkbox, after USB selective suspend and EEE are already honest.

If the operator actually uses directed wake from another box, skip. This pack is not a ban on intentional WoL.

## When this page applies
| Symptom | Layer |
|---|---|
| Laptop went to S0ix / S3 on a schedule you set | [Sleep vs forever](windows-sleep-vs-forever.html) |
| Important-only wake timers made WakeToRun a lie | [Allow wake timers](wake-timers-forever.html) |
| Need the name of the last wake source | [powercfg /lastwake](powercfg-lastwake.html), then this page if it names the NIC |
| USB NIC itself napped | [USB selective suspend](usb-selective-suspend.html) / [EEE](energy-efficient-ethernet.html) |
| Unattended sleep after a legitimate wake | [UNATTENDSLEEP](unattended-sleep-timeout.html) |
| lastwake / wake_armed names the Ethernet device. Operator is not using directed wake | **This page** |
| Operator uses directed WoL on purpose | Skip |

Do not disable the dedicated NIC. Do not confuse “Allow the computer to turn off this device to save power” with Magic Packet.

## What to change (plugged-in Grok desk)
1. Confirm Sleep / lid / Allow wake timers already honest. If lastwake names the Windows timer, stop.
2. List `powercfg /devicequery wake_armed` and `wake_programmable`.
3. Dedicated NIC → Power Management: uncheck Allow this device to wake the computer if directed wake is not in use. Leave the adapter enabled.
4. Same NIC → Advanced: Wake on Magic Packet Disabled. Wake on pattern match Disabled if present. Missing property = skip, not a registry hack.
5. Leave EEE, Speed & Duplex, and USB selective suspend alone on this click.
6. Confirm `wake_armed` no longer lists that NIC, or lastwake after a soak is not a magic packet the operator did not send.

```
powercfg /devicequery wake_armed
powercfg /devicequery wake_programmable
powercfg /lastwake
powercfg /waketimers
```

Do not paste live brokerage numbers. Do not paste `auth.json`. Do not invent a registry WoL DWORD on a public page.

## Soak test
1. Sleep, lid, USB suspend, ASPM, EEE, and Allow wake timers already honest.
2. Lid closed, dedicated NIC plugged, named task next-run still in the future. No 03:00 surprise S0 from a packet the operator did not send.
3. `/lastwake` after a scheduled task run names the timer or the operator, not a magic packet.
4. USB Ethernet adapter still Enabled and still has a link.
5. Host-forever is `LEXXII-Materialize-Forever`. Not systemd.

## Forbidden
- Disabling the dedicated NIC as a WoL fix.
- Claiming a Linux FULL AUTO daemon on this Windows profile.
- Publishing NLV, cash, tickers, quantities, or account IDs.

## Ownership
ONLY YOU. FOREVER.
