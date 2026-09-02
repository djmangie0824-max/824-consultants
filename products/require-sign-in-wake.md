# Require sign-in on wake vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/require-sign-in-wake.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.html) and [screen saver timeout](screen-saver-vs-videoidle.html). Sleep after can already be Never and a `.scr` can already be (None). Settings still has **If you've been away, when should Windows require you to sign in again?** on When PC wakes up from sleep, or on 1 / 3 / 5 / 15 minutes. An awake Interactive session still locks. Task Scheduler still shows Ready. Distinct from Dynamic lock. Not STANDBYIDLE. Not systemd.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, and screen saver can already be honest. The process is still alive. The session is still a user. Settings → Accounts → Sign-in options → Additional settings still has the away dropdown. Five minutes of no keyboard and Windows locks anyway. The Grok TUI is behind the password screen. Then VIDEOCONLOCK can drop dual ultrawide. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks Sleep after lied. Sleep after never fired. This dropdown locked a session that stayed in S0.

The wake path is the other lie. A brief S0ix from a different layer, then this dropdown at **When PC wakes up from sleep**, dumps the operator onto sign-in. Interactive logon is still the user. The session is locked. The 5-minute pulse cannot see the TUI.

This is not Sleep after. `powercfg /query SCHEME_CURRENT SUB_SLEEP STANDBYIDLE` can still be 0 on AC while the away dropdown is 5 minutes. `powercfg /a` still reports the same standby type. `CONSOLELOCK` (Require a password on wakeup, GUID `0e796bdb-100d-47d6-a2d5-f7d2daa51f51`) is the power-scheme sibling of Never-on-wake. That is not VIDEOCONLOCK. VIDEOCONLOCK is Console lock display off timeout — a panel timer after a lock already happened.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle / wake | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby. Sleep after is not Never | [windows-sleep-vs-forever](windows-sleep-vs-forever.html). STANDBYIDLE lives there. This page does not retune Sleep after. |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Blank/Photos overlay. Screen saver is not (None) | [screen-saver-vs-videoidle](screen-saver-vs-videoidle.html) |
| Win+L already locked. Panels black in about a minute | [console-lock-display-off](console-lock-display-off.html). VIDEOCONLOCK after a lock. |
| Session unlocked. Panels power off. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html) |
| Sleep after already Never. Session was not Win+L. Named task Ready / 267009. Lock screen appears after 1 / 3 / 5 / 15 minutes of idle, or after a wake, because the away dropdown is not Never | **This page** |
| Never missing from the dropdown, or InactivityTimeoutSecs is a nonzero policy | This edition or a GPO did not expose the knob. Stop. Not a fail. Not a registry paste to invent Never. |

Do not set the away dropdown to Never as the first click on a new host. Sleep after and lid first. Never is the pass on a plugged-in forever desk. A travel cube may keep When PC wakes up from sleep.

## What to change (plugged-in Grok desk)
1. Confirm the sleep layer is already done — plugged-in Sleep after is already Never. Lid close on AC is Do nothing. See [sleep vs forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here. This page does not set STANDBYIDLE.
2. Open **Sign-in options**. Settings → Accounts → Sign-in options → Additional settings. Direct: `ms-settings:signinoptions`.
3. Set **If you've been away, when should Windows require you to sign in again?** to **Never**. When PC wakes up from sleep still locks after any S0ix. 1 / 3 / 5 / 15 minutes lock an awake session. Every time is worse.
4. Leave the rest of Sign-in options alone on this click. This page is the away dropdown. Do not retune Windows Hello, PIN, or any other checkbox on that page. Screen Saver Settings is a different applet.
5. Leave the Balanced (or current) plan in place. This page is not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
6. Confirm, then soak unlocked.

```
start ms-settings:signinoptions
powercfg /query SCHEME_CURRENT SUB_NONE 0e796bdb-100d-47d6-a2d5-f7d2daa51f51
reg query "HKCU\Control Panel\Desktop" /v DelayLockTimeout
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v InactivityTimeoutSecs
powercfg /a
```

The setting GUID is Microsoft’s **Require a password on wakeup** under `SUB_NONE`. Some editions alias it `CONSOLELOCK` — query by GUID if the alias is missing. AC index **0** is Do not require a password on wakeup (the Never-on-wake sibling). **1** is When PC wakes up from sleep. That is not VIDEOCONLOCK. `DelayLockTimeout` is **milliseconds** under `HKCU\Control Panel\Desktop`. 60000 / 180000 / 300000 / 900000 are the 1 / 3 / 5 / 15 minute idle locks on an awake desk. The Settings dropdown is the source of truth. If Never is missing, this edition did not expose it — stop; do not invent a Desktop-value paste as the public how-to. If `InactivityTimeoutSecs` exists and is not 0, a policy owns the idle lock — stop; this page is not a domain GPO pack. STANDBYIDLE is Sleep after, not this click. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Sleep after and lid already honest. Otherwise this soak is lying about an awake session. Do not retune STANDBYIDLE on this page.
2. Do not Win+L. Leave the desk idle 5 minutes, lid closed, dedicated NIC plugged, dual ultrawide up. The Windows session stays unlocked. The Grok TUI stays visible. A lock screen from this dropdown is a fail. A Blank overlay is the screen-saver pack, not this click.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 behind a password screen is not forever.
4. The dropdown still Never. CONSOLELOCK still 0 on AC if the GUID exists. If someone set 5 minutes to “secure the kitchen walk,” restore Never on this class of operator desk. Travel laptops may differ.
5. Missing Never, or nonzero `InactivityTimeoutSecs` = skip, not a red soak. Do not write DelayLockTimeout by hand to make this page apply.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the session stayed unlocked.

## What this page is not
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html). STANDBYIDLE. This page does not mint Sleep after.
- Not screen-saver. That is [screen-saver-vs-videoidle](screen-saver-vs-videoidle.html).
- Not console-lock-display-off. That is [console-lock-display-off](console-lock-display-off.html). VIDEOCONLOCK after a lock already happened.
- Not turn-off-display-after. That is [turn-off-display-after](turn-off-display-after.html). VIDEOIDLE.
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not unattended-sleep-timeout. That is [unattended-sleep-timeout](unattended-sleep-timeout.html). UNATTENDSLEEP after a wake-timer.
- Not VIDEOCONLOCK. That GUID is Console lock display off timeout. This GUID is Require a password on wakeup.
- Not a High-performance plan essay. One Sign-in options dropdown.
- Not a Linux systemd unit. This host is Windows.
- Not a group-policy pack. Nonzero `InactivityTimeoutSecs` is stop, not a fight.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
