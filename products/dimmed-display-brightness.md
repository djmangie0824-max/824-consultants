# Dimmed display brightness vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/dimmed-display-brightness.html

Companion to [dim display after](dim-display-after.html) and [display brightness on AC](display-brightness-ac.html). VIDEODIM is the idle-dim timer. VIDEONORMALLEVEL is the working percentage from the first second. This pack is the remaining nits floor: **Display → Dimmed display brightness**. GUID `f1faff23-45d6-45aa-81f7-15f500fdf866`. Balanced default is often 50%. The timer fires. The lid drops to half. Dual ultrawide stay enumerated. Task Scheduler still shows Ready. **The floor is not the timer. Dim is still not a DP unplug.**

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Turn off display after, and Console lock display off can already be honest. Prefer Dim display after 0 on AC. Some images hide VIDEODIM after unhide. Some operators leave five minutes because an OLED lid “should rest.” Either way the lid still looks dead after idle. Display settings still lists both screens. The dock does not re-enumerate. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the DP lead failed. A percent floor napped the backlight after the timer, or instead of the timer.

This is not Sleep. This is not VIDEOIDLE. This is not VIDEOCONLOCK. This is not VIDEODIM. A black panel with a handshake is an off timer. A drop to a dimmed level with both screens still listed is either the timer or this floor. If VIDEODIM is already 0 on AC, this row does not fire. Leave it. Do not cargo-cult 100% as a second Never. If VIDEODIM still fires, or the timer GUID is missing after unhide, the remaining honesty is this percent: 100 on AC. The floor is not the timer. Dim is still not a DP unplug.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Session unlocked. Panels black. Dock re-enumerates | [turn-off-display-after](turn-off-display-after.html). That is a DP drop. Wrong page. |
| Session locked. Panels black. Dock re-enumerates | [console-lock-display-off](console-lock-display-off.html). Wrong page. |
| VIDEOIDLE and VIDEOCONLOCK already 0. Lid drops after idle minutes. Dim display after is not 0 on AC | [dim-display-after](dim-display-after.html) first. Zero the timer. Then this page is leftover. |
| Brightness hunts with room light. Dim-after already 0. Floor already 100 | [adaptive-brightness-ac](adaptive-brightness-ac.html). ALS, not a floor. |
| Internal panel looks dead from the first second. Percentage leftover 20–40. No wait for idle | [display-brightness-ac](display-brightness-ac.html). Working percent, not the dimmed floor. |
| Quick Settings leaf on. ~30% dim. Power mode greyed | Energy saver overlay. Not this GUID. |
| VIDEODIM already 0 on AC. Floor still 50. Lid never drops | Skip. The floor does not fire when the timer is Never. Do not treat 50 as a fail. |
| VIDEODIM still fires, or the timer GUID is missing after unhide. Dual ultrawide stay listed. Laptop lid drops to a dimmed level (often half). First input restores nits with no handshake. Dimmed display brightness on AC is 50 or 20 | **This page**. The floor is not the timer. Dim is still not a DP unplug. |
| GUID missing from `powercfg /query SCHEME_CURRENT SUB_VIDEO` after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |

Do not set Dimmed display brightness as the first click on a new host. Sleep, lid, Turn off display after, Console lock display off, and Dim display after first. Prefer VIDEODIM 0. This page is the remaining nits floor when the timer still fires or cannot be zeroed. 100 on AC is the pass for that leftover. Hidden is not 100. A black panel with a dock re-plug is VIDEOIDLE or VIDEOCONLOCK, not this click. The floor is not the timer. Dim is still not a DP unplug.

## What to change (plugged-in Grok desk)
1. Confirm the off-timer and idle-dim layers are already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Turn off display after is 0 on AC. Console lock display off is 0 on AC (or skip if missing). Prefer [Dim display after](dim-display-after.html) 0 on AC. If VIDEODIM is already 0, stop here. This row will not fire. Do not cargo-cult the floor.
2. Unhide the row if it is missing. Dimmed display brightness is ATTRIB_HIDE on many consumer images. Missing from Display before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Display** → **Dimmed display brightness**.
4. Set **Plugged in** to **100** percent. On battery may stay 50 if the laptop actually travels. A desk that never unplugs should not idle-dim the operator TUI to half nits.
5. Leave Dim display after, Turn off display after, Display brightness, and Enable adaptive brightness alone on this click. VIDEODIM is the timer. VIDEOIDLE is off. VIDEONORMALLEVEL is the working percentage. ADAPTBRIGHT is ALS. This GUID is the floor after the timer. 100 on the floor is not Never on the timer.
6. Leave Energy saver and Always use energy saver alone. A leaf-on overlay is a different dim.
7. Leave the current plan in place. This is one display knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not Apply all on Energy recommendations.
8. Confirm.

```
powercfg -attributes SUB_VIDEO f1faff23-45d6-45aa-81f7-15f500fdf866 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_VIDEO f1faff23-45d6-45aa-81f7-15f500fdf866
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEODIM
powercfg /setacvalueindex SCHEME_CURRENT SUB_VIDEO f1faff23-45d6-45aa-81f7-15f500fdf866 100
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

`SUB_VIDEO` / GUID `f1faff23-45d6-45aa-81f7-15f500fdf866` is Dimmed display brightness. Units are percent. **100 on AC is the pass** when the idle-dim timer still fires. 50 remaining on AC is Balanced laptop default, not a pass for that leftover. There is often no well-known alias — query by GUID. Apply with `/setactive` or the GUI change does not take. Unhide is `powercfg -attributes … -ATTRIB_HIDE`, not a registry paste. If powercfg still omits the GUID after that, this edition did not expose the knob — stop; do not invent a dimmed-floor hack on a public page. VIDEODIM is the timer, not this click. VIDEOIDLE is unlocked off, not this click. VIDEONORMALLEVEL is the working percentage, not this click. ADAPTBRIGHT is ALS, not this click. If VIDEODIM is already 0, this floor does not apply — leave it. External DP/HDMI often ignore this Windows dim and keep their own OSD — a dim lid with both screens still listed is this click or the timer, not a handshake. The floor is not the timer. Dim is still not a DP unplug. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep, lid, VIDEOIDLE, and VIDEOCONLOCK already honest. Prefer VIDEODIM 0. If VIDEODIM is already 0, this soak is a skip, not a red fail. The floor does not fire.
2. When the timer still fires: leave the desk idle past the dim minutes. Lid closed, dedicated NIC plugged, dual ultrawide up. Laptop lid stays at working nits, not half. Display settings still shows the same screens. No dock re-plug. First input does not handshake.
3. **The floor is not the timer. Dim is still not a DP unplug.** Fail this soak only if the dimmed percent was the liar. A black-then-handshake is VIDEOIDLE or VIDEOCONLOCK. A drop that recovers when you zero VIDEODIM is the timer page, not this one. Do not buy a DP cable because the laptop lid looked dark.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a half-nits lid is not forever if this floor is still 50 and the timer still fires.
5. GUID still 100 on AC if this page applied. If someone set 50 to “save the OLED lid,” restore 100 on this class of operator desk, or zero VIDEODIM instead. Do not “fix” it by switching the whole plan to High performance.
6. Missing GUID after unhide = skip, not a red soak. Do not invent the dimmed-floor value in the registry to make this page apply.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the floor is already 100. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not dim-display-after. That timer is [dim-display-after](dim-display-after.html).
- Not turn-off-display-after. That blackout is [turn-off-display-after](turn-off-display-after.html).
- Not Console lock display off. That blackout is [console-lock-display-off](console-lock-display-off.html).
- Not Enable adaptive brightness. That ALS hunt is [adaptive-brightness-ac](adaptive-brightness-ac.html).
- Not Display brightness on AC. That leftover percentage is [display-brightness-ac](display-brightness-ac.html).
- Not Energy saver Always-use. A leaf-on 30% cut is the overlay, not this GUID.
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not a DisplayPort SKU. Dim is still not a DP unplug. That cable page is [displayport-cable-sitstand](../reviews/displayport-cable-sitstand.html).
- Not a High-performance plan essay. One display setting.
- Not a registry paste. If Settings and `powercfg` omit the knob after unhide, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
