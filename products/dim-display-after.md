# Dim display after vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/dim-display-after.html

Companion to [turn off display after](turn-off-display-after.html) and [console lock display off](console-lock-display-off.html). VIDEOIDLE and VIDEOCONLOCK can already be 0 on AC and the operator still thinks video died after a few idle minutes. This pack is the remaining idle-dim timer: **Display → Dim display after**. Five minutes drops laptop nits. Dual ultrawide stay enumerated. Task Scheduler still shows Ready. **Dim is not a DP unplug.**

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Turn off display after, and Console lock display off can already be honest. The process is still alive. The session is still unlocked. Balanced **Dim display after** on AC is often 5 minutes. The laptop lid drops to the dimmed level. External DP/HDMI keep their OSD. Display settings still lists both screens. The dock does not re-enumerate. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the DP lead failed. A timer napped the backlight. The link never dropped.

This is not Sleep. This is not VIDEOIDLE. This is not VIDEOCONLOCK. A black panel with a handshake and a dock re-enumerate is an off timer — those are the other two pages. This page is dim, still enumerated. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. VIDEOIDLE can still be 0. VIDEOCONLOCK can still be 0. The idle-dim policy is the liar. The row is hidden on many images — missing from the GUI is not Never. Dim is not a DP unplug.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Session unlocked. Panels black. Dock re-enumerates. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html). That is a DP drop. Wrong page. |
| VIDEOIDLE already 0. Session locked. Panels black in about a minute. Dock re-enumerates | [console-lock-display-off](console-lock-display-off.html). That is a DP drop. Wrong page. |
| Brightness hunts with room light / ALS. Dim-after is already 0 | [adaptive-brightness-ac](adaptive-brightness-ac.html). ALS, not an idle timer. |
| Internal panel looks dead from the first second on AC. Percentage is a leftover 20–40. No wait for idle minutes | [display-brightness-ac](display-brightness-ac.html). Static percentage, not VIDEODIM. |
| Quick Settings leaf on. ~30% dim. Power mode greyed. Always use energy saver On | Energy saver overlay. Not `VIDEODIM`. |
| Cable yank on sit/stand rise; timers already 0; brightness already operator-set | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| VIDEOIDLE and VIDEOCONLOCK already 0 on AC. Named task Ready / 267009. Dual ultrawide stay listed. Laptop lid (or any Windows-driven backlight) drops after a few idle minutes, then recovers on first input with no handshake and no dock re-plug. Dim display after is not 0 on AC | **This page**. Dim is not a DP unplug. |
| GUID missing from `powercfg /query SCHEME_CURRENT SUB_VIDEO` after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |

Do not set Dim display after to Never as the first click on a new host. Sleep, lid, Turn off display after, and Console lock display off first. Never on AC is 0. Hidden is not Never. A black panel with a dock re-plug is VIDEOIDLE or VIDEOCONLOCK, not this click. Dim is not a DP unplug.

## What to change (plugged-in Grok desk)
1. Confirm the off-timer layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Turn off display after is 0 on AC. Console lock display off is 0 on AC (or the GUID was missing after unhide — that is a skip, not a leftover 60 seconds). See [turn-off-display-after](turn-off-display-after.html) and [console-lock-display-off](console-lock-display-off.html). If VIDEOIDLE is still 5–10 minutes, stop here. A black-then-handshake is those pages.
2. Unhide the row if it is missing. Dim display after is ATTRIB_HIDE on many consumer images, and Windows 11 often omits it from the GUI even when powercfg still has the GUID. Missing from Display before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Display** → **Dim display after**.
4. Set **Plugged in** to **0** minutes (Never). On battery may stay 2–5 if the laptop actually travels. A desk that never unplugs should not idle-dim the operator TUI.
5. Leave Turn off display after and Console lock display off alone on this click. VIDEOIDLE and VIDEOCONLOCK are blackouts and link drops. VIDEODIM is an idle nits cut. Dim is not off.
6. Leave Display brightness, Enable adaptive brightness, Energy saver, and Dimmed display brightness alone on this click. `VIDEONORMALLEVEL` is the working percentage. `ADAPTBRIGHT` is the ALS hunt. Energy saver is the leaf overlay. Dimmed display brightness is the nits floor *after* this timer fires. Zeroing the timer is the pass; dragging the dimmed floor is not Never.
7. Leave the current plan in place. This is one display knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not Apply all on Energy recommendations.
8. Confirm.

```
powercfg -attributes SUB_VIDEO 17aaa29b-8b43-4b94-aafe-35f64daaf1ee -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEODIM
powercfg /query SCHEME_CURRENT SUB_VIDEO 17aaa29b-8b43-4b94-aafe-35f64daaf1ee
powercfg /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEODIM 0
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

`SUB_VIDEO` / `VIDEODIM` is Dim display after (GUID `17aaa29b-8b43-4b94-aafe-35f64daaf1ee`). The AC index is **seconds** in the query; the GUI speaks minutes. **0** is Never. 300 remaining on AC is 5 minutes — Balanced laptop default, not a pass. Apply with `/setactive` or the GUI change does not take. Query by GUID if the alias is missing. Unhide is `powercfg -attributes … -ATTRIB_HIDE`, not a registry paste. If powercfg still omits the GUID after that, this edition did not expose the knob — stop; do not invent an idle-dim hack on a public page. VIDEOIDLE is unlocked off, not this click. VIDEOCONLOCK is lock-screen off, not this click. STANDBYIDLE is Sleep after, not this click. Dimmed display brightness is the floor, not the timer. External DP/HDMI often ignore this Windows dim and keep their own OSD — a dim lid with both screens still listed is this click, not a handshake. Dim is not a DP unplug. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep, lid, VIDEOIDLE, and VIDEOCONLOCK already honest. Otherwise this soak is lying about an off-timer blackout.
2. Leave the desk idle past the old dim minutes (10 minutes covers a leftover 5). Lid closed, dedicated NIC plugged, dual ultrawide up. Laptop lid (or any Windows-driven backlight) stays at the operator-set working level — not a surprise drop to the dimmed floor. Display settings still shows the same screens. No dock re-plug. First input does not handshake.
3. **Dim is not a DP unplug.** Fail this soak only if the idle-dim timer was the liar. A black-then-handshake on first input with a dock re-enumerate is a VIDEOIDLE or VIDEOCONLOCK fail, not this page. Do not buy a DP cable because the laptop lid looked dark.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a dimmed lid is not forever if VIDEODIM is still 300. Ready + 267009 with a dead DP link is the off-timer pages, not this one.
5. VIDEODIM still 0 on AC. If someone set 5 minutes to “save the OLED lid,” restore 0. Do not “fix” it by switching the whole plan to High performance.
6. Missing GUID after unhide = skip, not a red soak. Do not invent the idle-dim value in the registry to make this page apply. Then check [ALS](adaptive-brightness-ac.html) and [Display brightness](display-brightness-ac.html); those siblings can still make a live panel look dead.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the idle-dim timer is already Never. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not turn-off-display-after. That blackout is [turn-off-display-after](turn-off-display-after.html).
- Not Console lock display off. That blackout is [console-lock-display-off](console-lock-display-off.html).
- Not Enable adaptive brightness. That ALS hunt is [adaptive-brightness-ac](adaptive-brightness-ac.html).
- Not Display brightness on AC. That leftover percentage is [display-brightness-ac](display-brightness-ac.html).
- Not Energy saver Always-use. A leaf-on 30% cut is the overlay, not `VIDEODIM`.
- Not Dimmed display brightness. That is the nits floor after this timer fires, not the timer.
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not a DisplayPort SKU. Dim is not a DP unplug. That cable page is [displayport-cable-sitstand](../reviews/displayport-cable-sitstand.html).
- Not a High-performance plan essay. One display setting.
- Not a registry paste. If Settings and `powercfg` omit the knob after unhide, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
