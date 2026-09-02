# Console lock display off vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/console-lock-display-off.html

Companion to [turn off display after](turn-off-display-after.html). VIDEOIDLE can already be 0 on AC and a ship still stalls on video the moment the session is locked. This pack is the remaining lock-screen timer: **Display → Console lock display off timeout**. Hidden by default. Balanced AC is often 60 seconds. Win+L blacks dual ultrawide. The dock re-enumerates. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, and Turn off display after can already be honest. The process is still alive. The session is still logged in — it is locked, not slept. Balanced **Console lock display off timeout** on AC is often 60 seconds. The operator hits Win+L, Dynamic lock, or a lock from the screen saver. The panels go black. DP/HDMI drop. The dock treats it as unplug. Windows rebuilds the desktop on unlock. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks VIDEOIDLE lied. A second timer napped the lock screen.

This is not Sleep. This is not unlocked idle. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. VIDEOIDLE can still be 0. The lock-screen display policy is the liar. The row is hidden by default — missing from the GUI is not Never.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle / lock | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Session unlocked. Panels black after 5–10 minutes. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html) |
| DISPLAY holder in `powercfg /requests` | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Cable yank on sit/stand rise; both timers already 0 | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| VIDEOIDLE already 0 on AC. Session locked. Named task Ready / 267009. Dual ultrawide go black in about a minute. Console lock display off is not 0 on AC, or the row is still hidden | **This page** |
| GUID missing from `powercfg /query SCHEME_CURRENT SUB_VIDEO` after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |

Do not set Console lock display off to Never as the first click on a new host. Sleep, lid, and Turn off display after first. Hidden is not Never.

## What to change (plugged-in Grok desk)
1. Confirm the unlocked layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Turn off display after is 0 on AC. See [turn-off-display-after](turn-off-display-after.html). If VIDEOIDLE is still 5–10 minutes, stop here.
2. Unhide the row. Console lock display off timeout is ATTRIB_HIDE on most consumer images. Missing from the GUI before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Display** → **Console lock display off timeout**.
4. Set **Plugged in** to **0** (Never). On battery may stay 60 seconds if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave Turn off display after alone on this click. VIDEOIDLE is unlocked idle. This row is lock-screen idle.
6. Leave the current plan in place. This is one display knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg -attributes SUB_VIDEO 8ec4b3a5-6868-48c2-be75-4f3044be88a7 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_VIDEO 8ec4b3a5-6868-48c2-be75-4f3044be88a7
powercfg /setacvalueindex SCHEME_CURRENT SUB_VIDEO 8ec4b3a5-6868-48c2-be75-4f3044be88a7 0
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

The setting GUID is Microsoft’s Console lock display off timeout under `SUB_VIDEO`. Some editions alias it `VIDEOCONLOCK` — query by GUID if the alias is missing. The AC index is **seconds**. **0** is Never. 60 is the usual hidden default. Apply with `/setactive` or the GUI change does not take. Unhide is `powercfg -attributes … -ATTRIB_HIDE`, not a registry paste. If powercfg still omits the GUID after that, this edition did not expose the knob — stop; do not invent a lock-screen hack on a public page. VIDEOIDLE is unlocked idle, not this click. STANDBYIDLE is Sleep after, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep, lid, and VIDEOIDLE already honest. Otherwise this soak is lying about unlocked idle.
2. Win+L. Leave the desk locked 5 minutes, lid closed, dedicated NIC plugged, dual ultrawide up. Windows must not drop DP/HDMI. A black-then-handshake on unlock is a fail if the GUID was not 0 on AC.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a dead DP link is not forever.
4. The GUID still 0 on AC. If someone set 60 seconds to "save the OLEDs on the lock screen," restore 0. Do not "fix" it by switching the whole plan to High performance.
5. Missing GUID after unhide = skip, not a red soak. Do not invent the lock-screen value in the registry to make this page apply.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the panels stayed enumerated.

## What this page is not
- Not turn-off-display-after. That is [turn-off-display-after](turn-off-display-after.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not powercfg /requests. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not “Turn off hard disk after.” That is [hard-disk-idle-timeout](hard-disk-idle-timeout.html).
- Not a DisplayPort SKU. That is [displayport-cable-sitstand](../reviews/displayport-cable-sitstand.html).
- Not a High-performance plan essay. One hidden display setting.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
