# Screen saver timeout vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/screen-saver-vs-videoidle.html

Companion to [turn off display after](turn-off-display-after.html). VIDEOIDLE can already be 0 on AC and a `.scr` still paints over the Grok TUI, or locks the session and hands the rest to [console lock display off](console-lock-display-off.html). This pack is the remaining Personalization timer: **Screen Saver Settings**. Not a `powercfg` alias. Not systemd.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, and Turn off display after can already be honest. The process is still alive. The session is still unlocked. Control Panel still has a screen saver Wait of 1 minute on a lot of consumer images. Blank, Photos, Bubbles, Mystify, Ribbons, or 3D Text starts. The TUI disappears under a full-screen overlay. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks VIDEOIDLE lied. A different timer, in a different applet, napped the desk.

Worse path: **On resume, display logon screen** is checked. The saver does not just overlay — it locks. Then VIDEOCONLOCK can drop dual ultrawide about a minute later. The dock re-enumerates. That lock is not Win+L and not Dynamic lock. It is `ScreenSaverIsSecure`.

This is not Turn off display after. `powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEOIDLE` can still be 0 on AC while `ScreenSaveActive` is 1. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. The screen saver is a user-session policy under `HKCU\Control Panel\Desktop`, not a `SUB_VIDEO` index.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Session unlocked. Panels actually power off after 5–10 minutes. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html) |
| Win+L. VIDEOIDLE already 0. Panels black in about a minute | [console-lock-display-off](console-lock-display-off.html) |
| Phone walks out of range. Session locks by itself | [dynamic-lock-vs-forever](dynamic-lock-vs-forever.html) |
| DISPLAY holder in `powercfg /requests` | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Cable yank on sit/stand rise; timers already honest | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| VIDEOIDLE already 0 on AC. Session was not Win+L. Named task Ready / 267009. A Blank/Photos overlay covers the TUI after ~1 minute, or the lock screen appears from the saver. Screen saver is not (None) | **This page** |
| Screen Saver Settings dialog missing after the Control Panel path | This edition did not expose the knob. Stop. Not a fail. Not a registry paste to invent one. |

Do not disable the screen saver as the first click on a new host. Sleep, lid, and Turn off display after first. (None) is the pass on a plugged-in forever desk. A travel cube may keep a short saver.

## What to change (plugged-in Grok desk)
1. Confirm the display-idle layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Turn off display after is 0 on AC. See [turn-off-display-after](turn-off-display-after.html). If VIDEOIDLE is still 5–10 minutes, stop here. Black panels that actually power off are that pack, not this click.
2. Open **Screen Saver Settings**. Win11 path: Settings → Personalization → Lock screen → Screen saver settings. Classic path: Control Panel → Appearance and Personalization → Change screen saver. Direct: `control desk.cpl,,@screensaver`.
3. Set **Screen saver** to **(None)**. Wait greys out. That is expected.
4. Uncheck **On resume, display logon screen** if it is still checked. A leftover secure bit can still lock even when operators think the saver is off.
5. Apply / OK. Leave VIDEOIDLE and VIDEOCONLOCK alone on this click. Those are `SUB_VIDEO`. This dialog is Personalization.
6. Confirm.

```
control desk.cpl,,@screensaver
reg query "HKCU\Control Panel\Desktop" /v ScreenSaveActive
reg query "HKCU\Control Panel\Desktop" /v ScreenSaveTimeOut
reg query "HKCU\Control Panel\Desktop" /v ScreenSaverIsSecure
reg query "HKCU\Control Panel\Desktop" /v SCRNSAVE.EXE
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEOIDLE
```

`ScreenSaveActive` **0** is the pass (saver off). **1** with a Wait of 60 is the usual 1-minute lie. `ScreenSaverIsSecure` **0** means the saver will not lock on resume. `SCRNSAVE.EXE` should not still point at `Blank.scr`, `PhotoScreensaver.scr`, or a 3D `.scr` if the dialog says (None). `ScreenSaveTimeOut` is **seconds** in the registry — 60 is one minute, not one hour. VIDEOIDLE staying 0 does not prove this layer. If the dialog is missing, this edition did not expose the knob — stop; do not invent a Desktop-value paste as the public how-to. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep, lid, and VIDEOIDLE already honest. Otherwise this soak is lying about panel power-off.
2. Do not Win+L. Do not walk a paired phone out of range. Leave the desk idle 5 minutes, lid closed, dedicated NIC plugged, dual ultrawide up. The Grok TUI must stay visible. No Blank overlay. No lock screen from the saver. A black-then-handshake is a VIDEOIDLE/VIDEOCONLOCK fail, not this page, unless a `.scr` was on screen first.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a Photos slideshow covering the TUI is not forever.
4. `ScreenSaveActive` still 0. If someone set Blank at 1 minute to “save the OLEDs,” restore (None) on this class of operator desk. OLED care is the monitor’s own power button or a later honest idle policy — not a `.scr` that looks like VIDEOIDLE.
5. Missing Screen Saver Settings dialog = skip, not a red soak. Do not write Desktop values by hand to make this page apply.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the TUI stayed on screen.

## What this page is not
- Not turn-off-display-after. That is [turn-off-display-after](turn-off-display-after.html). VIDEOIDLE.
- Not console-lock-display-off. That is [console-lock-display-off](console-lock-display-off.html). VIDEOCONLOCK after the session is already locked.
- Not dynamic-lock. That is [dynamic-lock-vs-forever](dynamic-lock-vs-forever.html). A phone walk-away lock.
- Not require-sign-in-when-away. That is [require-sign-in-wake](require-sign-in-wake.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not powercfg /requests. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not “Turn off hard disk after.” That is [hard-disk-idle-timeout](hard-disk-idle-timeout.html).
- Not a DisplayPort SKU. That is [displayport-cable-sitstand](../reviews/displayport-cable-sitstand.html).
- Not a High-performance plan essay. One Personalization dialog.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
