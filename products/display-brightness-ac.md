# Display brightness on AC vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/display-brightness-ac.html

Companion to [turn off display after](turn-off-display-after.html) and [sleep vs forever](windows-sleep-vs-forever.html). Session sleep and VIDEOIDLE can already be honest and the desk still looks like video died. This pack is the remaining percentage: **Display → Display brightness** on AC. A leftover 20–40% makes the laptop panel look dead. Display settings still lists it. Task Scheduler still shows Ready. **A dim panel is not a DP unplug.**

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep and lid can already be honest. Turn off display after can already be 0 on AC. The process is still alive. The session is still unlocked. Balanced or a restored plan can leave **Display brightness** on AC at a battery leftover — 20, 30, or 40 percent. Settings → System → Display → Brightness (internal) matches that leftover. The laptop lid looks off. Dual ultrawide still enumerate. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the DP lead failed. A percentage napped the backlight. The link never dropped.

This is not Sleep. This is not VIDEOIDLE. A black panel with a handshake and a dock re-enumerate is the off timer — that is [turn-off-display-after](turn-off-display-after.html). This page is dim, not black. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. VIDEOIDLE can still be 0. The brightness policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Panels go black. Dock re-enumerates. Handshake on first input | [turn-off-display-after](turn-off-display-after.html). Off timer, not a dim. |
| VIDEOIDLE already 0. Session locked. Panels black in about a minute | [console-lock-display-off](console-lock-display-off.html) |
| Brightness hunts with room light / ALS. Percentage was already honest | Different layer. Enable adaptive brightness (`ADAPTBRIGHT`). Wrong page. |
| Quick Settings leaf on. Screen ~30% under the set value. Power mode greyed | Different layer. Energy saver overlay. Not `VIDEONORMALLEVEL`. |
| Cable yank on sit/stand rise; percentage already matches the set AC level | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| External OSD backlight is low; Windows AC percentage already honest | Different layer. Monitor OSD / DDC. External DP/HDMI often ignore this Windows row. |
| Sleep and VIDEOIDLE already honest. Session unlocked. Named task Ready / 267009. Internal panel looks dead or far dimmer than the operator set. Display settings still lists the same screens. No handshake. No dock re-enumerate. AC Display brightness is a leftover 20–40 | **This page**. A dim panel is not a DP unplug. |

Do not drag Display brightness to 100 as the first click on a new host. Sleep and Turn off display after first. 100 is not a religion — 80 can be a pass if that is the set OLED working level. A leftover 20–40 on AC is the fail. Adaptive brightness Off is not this page.

## What to change (plugged-in Grok desk)
1. Confirm the session and off-timer layers are already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. [Turn off display after](turn-off-display-after.html) is 0 on AC. If the desk still *intends* to sleep or black the panels every idle, stop here.
2. Power Options → Change plan settings → Change advanced power settings → **Display** → **Display brightness**.
3. Set **Plugged in** to the working AC level. On this class of operator desk that is typically **80–100**. On battery may stay 20–40 if the laptop actually travels. A desk that never unplugs should not inherit the DC copy. Settings → System → Display → Brightness (internal) is the same percentage on most laptops; the Quick Settings slider is the same internal backlight. They should agree on AC.
4. Leave Turn off display after and Console lock display off alone on this click. Those are off timers. Dim is not off.
5. Leave Enable adaptive brightness alone on this click. That is `ADAPTBRIGHT`, the ALS hunt. Dragging this percentage does not disable the sensor.
6. Leave Energy saver alone on this click. Always use energy saver can still cut ~30% on top of an honest percentage. If the leaf is on, the overlay is the liar, not this row.
7. Leave the current plan in place. This is one display percentage, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not Apply all on Energy recommendations.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEONORMALLEVEL
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEOIDLE
powercfg /a
```

`VIDEONORMALLEVEL` is 0–100; the query speaks hex. **0x64** on AC is 100. **0x50** is 80 — a pass if that is the operator’s set OLED level. **0x28** or **0x14** on AC is 40 or 20 — a DC leftover, not a pass on this desk. VIDEOIDLE remaining 0 on AC only proves the off timer. Adaptive brightness is `ADAPTBRIGHT`, not this click. External DP/HDMI panels often ignore this Windows percentage and keep their own OSD backlight — a dim ultrawide with a live identity in Display settings is still a live link. If the alias is missing, stop. Do not invent a registry hack. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak
Sleep and lid honest. VIDEOIDLE already 0 on AC. Idle 30 minutes, lid closed, NIC plugged, dual ultrawide up. Internal panel (or any Windows-driven backlight) still matches the set AC level — not a surprise 20–40. Display settings still shows the same screens. **A dim panel is not a DP unplug.** A black-then-handshake with a dock re-enumerate is a VIDEOIDLE fail, not this page. Do not buy a DP cable because the laptop lid looks dark. `LEXXII-Materialize-Forever` still has a next-run. No fourth Grok TUI. 267009 is still-running, not proof AC brightness is already honest.

## What this is not
Not systemd. Not a fleet GPO. Not sleep-vs-forever. Not turn-off-display-after (black + handshake). Not Enable adaptive brightness. Not console-lock-display-off. Not Energy saver Always-use. Not a DisplayPort SKU. Not a High-performance plan essay. Not a registry paste. Not a brokerage number. A dim panel is not a reason to buy another cable.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
