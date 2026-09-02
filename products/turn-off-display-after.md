# Turn off display after vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/turn-off-display-after.html

Companion to [sleep vs forever](windows-sleep-vs-forever.html) and [lid close](lid-close-do-nothing.html). Session sleep and lid can already be honest and a ship still stalls on video. This pack is the remaining panel timer: **Display → Turn off display after**. Ten minutes blacks dual ultrawide. The dock re-enumerates. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep and lid can already be honest. The process is still alive. The session is still unlocked. Balanced **Turn off display after** on AC is often 5 or 10 minutes. The panels go black. DP/HDMI drop. The dock treats it as unplug. Windows rebuilds the desktop. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the DP lead failed. A timer napped the link.

This is not Sleep. This is not HIPM. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. The display idle policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| SATA disk spins down; panels still on | Hard disk idle timeout. Wrong page. |
| DISPLAY holder in `powercfg /requests` | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Cable yank on sit/stand rise; timer is already Never | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| Sleep and lid already honest. Session unlocked. Named task Ready / 267009. Dual ultrawide go black and the dock re-enumerates. Turn off display after is not 0 on AC | **This page** |

Do not set display idle to Never as the first click on a new host. Sleep and lid first.

## What to change (plugged-in Grok desk)
1. Confirm the session layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html). If the desk still *intends* to sleep every idle, stop here.
2. Power Options → Change plan settings → Change advanced power settings → **Display** → **Turn off display after**.
3. Set **Plugged in** to **0** minutes (Never). On battery may stay 5–10 if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
4. Leave Sleep after and Hard disk idle alone on this click. Those are siblings.
5. Leave the current plan in place. This is one display knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
6. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEOIDLE
powercfg /a
```

`VIDEOIDLE` is seconds in the query; the GUI speaks minutes. **0** on AC is Never. 300 or 600 remaining on AC is 5 or 10 minutes — Balanced default, not a pass. If the alias is missing, stop. Do not invent a registry hack. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak
Sleep and lid honest. Idle 30 minutes, lid closed, NIC plugged, dual ultrawide up. Panels stay on. Both screens still enumerated. A black-then-handshake on first input fails if VIDEOIDLE was not 0 on AC. `LEXXII-Materialize-Forever` still has a next-run. No fourth Grok TUI. 267009 is still-running, not proof the panels stayed enumerated.

## What this is not
Not systemd. Not a fleet GPO. Not sleep-vs-forever. Not lid-close. Not powercfg /requests. Not “Turn off hard disk after.” Not a DisplayPort SKU. Not a High-performance plan essay. Not a brokerage number.
