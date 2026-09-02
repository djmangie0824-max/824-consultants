# Enable adaptive brightness on AC vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/adaptive-brightness-ac.html

Companion to [turn off display after](turn-off-display-after.html) and [console lock display off](console-lock-display-off.html). VIDEOIDLE and VIDEOCONLOCK can already be 0 on AC and the operator still thinks video died. This pack is the remaining ALS hunter: **Display → Enable adaptive brightness**. On AC it still hunts the room. The laptop lid dips. Dual ultrawide stay enumerated. Task Scheduler still shows Ready. **A brightness dip is not a DP drop.**

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Turn off display after, and Console lock display off can already be honest. The process is still alive. The session is still unlocked. Balanced **Enable adaptive brightness** on AC is often On. The ambient-light sensor sees a cloud, a sit/stand lamp, or night. The laptop panel dims. Dual ultrawide OSD does not follow. Display settings still lists both screens. The dock does not re-enumerate. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the DP lead failed. The ALS hunted. The link never dropped.

This is not Sleep. This is not VIDEOIDLE. This is not VIDEOCONLOCK. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. VIDEOIDLE can still be 0. VIDEOCONLOCK can still be 0. The panels are still on the bus. The brightness policy is the liar. A dim lid with both screens still listed is this click, not a handshake.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle / light change | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the desk to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Session unlocked. Panels black. Dock re-enumerates. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html). That is a DP drop. Wrong page. |
| VIDEOIDLE already 0. Session locked. Panels black in about a minute. Dock re-enumerates | [console-lock-display-off](console-lock-display-off.html). That is a DP drop. Wrong page. |
| Quick Settings leaf on. ~30% dim. Power mode greyed. Always use energy saver On | [energy-saver-ac](energy-saver-ac.html). Overlay dim, not ALS. |
| ALS Off. Lid still hunts as the TUI paints. Display Settings “Change brightness based on content” On | Different layer. Content Adaptive Brightness Control (CABC). Sibling overlay. Not ADAPTBRIGHT. |
| Cable yank on sit/stand rise; timers already 0; brightness already operator-set | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| VIDEOIDLE and VIDEOCONLOCK already 0 on AC. Named task Ready / 267009. Dual ultrawide stay listed. Laptop lid dips when the room changes. Enable adaptive brightness is On on AC, or Settings ALS is still On | **This page**. A brightness dip is not a DP drop. |
| GUID / alias missing from `powercfg /query SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT` | This chassis did not expose an ALS knob. Stop. Not a fail. Not a registry hack. |

Do not set Enable adaptive brightness Off as the first click on a new host. Sleep, lid, Turn off display after, and Console lock display off first. Off on AC is the pass. On is not Off. Hidden is not Off. A black panel with a dock re-plug is VIDEOIDLE or VIDEOCONLOCK, not this click. A brightness dip is not a DP drop.

## What to change (plugged-in Grok desk)
1. Confirm the timer layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Turn off display after is 0 on AC. Console lock display off is 0 on AC (or the GUID was missing after unhide — that is a skip, not a leftover 60 seconds). See [turn-off-display-after](turn-off-display-after.html) and [console-lock-display-off](console-lock-display-off.html). If VIDEOIDLE is still 5–10 minutes, stop here. A black-then-handshake is those pages.
2. Power Options → Change plan settings → Change advanced power settings → **Display** → **Enable adaptive brightness**.
3. Set **Plugged in** to **Off**. On battery may stay On if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube hunting daylight.
4. Settings → System → Display → Brightness — if the row *Change brightness automatically when lighting changes* exists, set it Off on this desk. That Settings ALS toggle can hunt even when the operator only clicked the plan GUI. Off here plus Off in the plan is the pass. Missing Settings row is not a skip of the plan row, and missing plan row is not a skip of Settings if Settings is present.
5. Leave Turn off display after and Console lock display off alone on this click. VIDEOIDLE and VIDEOCONLOCK are blackouts and link drops. ADAPTBRIGHT is a nits hunter.
6. Leave Energy saver and CABC alone on this click. Energy saver’s ~30% dim is the leaf overlay ([energy-saver-ac](energy-saver-ac.html)). Content Adaptive Brightness Control is “Change brightness based on content” / “Automatically adjust contrast based on what’s on the screen.” GPU control-panel Display Power Saving Technology is another sibling. None of those are ADAPTBRIGHT.
7. Leave the current plan in place. This is one display knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT
powercfg /setacvalueindex SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT 0
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

`SUB_VIDEO` / `ADAPTBRIGHT` is Enable adaptive brightness (GUID `fbd9aa60-c5e0-11d7-99b3-0000e81ac1ac`). The AC index is **0 = Off**, **1 = On**. Apply with `/setactive` or the GUI change does not take. Query by GUID if the alias is missing. If powercfg still omits the GUID, this chassis did not expose an ALS knob — stop; do not invent a sensor hack on a public page. VIDEOIDLE is unlocked idle, not this click. VIDEOCONLOCK is lock-screen idle, not this click. STANDBYIDLE is Sleep after, not this click. Settings ALS Off without plan Off is not a pass if the plan row exists. A brightness dip is not a DP drop. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep, lid, VIDEOIDLE, and VIDEOCONLOCK already honest. Otherwise this soak is lying about a timer blackout.
2. ADAPTBRIGHT is 0 on AC. Settings ALS is Off if the row exists. Cover the ALS (or kill the desk lamp) for 2 minutes. Laptop lid brightness stays at the operator-set value. Dual ultrawide stay listed in Display settings. No dock re-plug. No black-then-handshake. A dim lid with both screens still enumerated is a fail if the row was still On — and it is still not a DP drop.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a dipped lid is not forever if ALS is still On. Ready + 267009 with a dead DP link is the timer pages, not this one.
4. The alias still 0 on AC. If someone set On to “save the OLED lid,” restore Off. Do not “fix” it by switching the whole plan to High performance.
5. Missing GUID = skip, not a red soak. Do not invent the ALS value in the registry to make this page apply. Then check Settings ALS; if that row exists, Off is still required.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the ALS is already Off. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not turn-off-display-after. That blackout is [turn-off-display-after](turn-off-display-after.html).
- Not Console lock display off. That blackout is [console-lock-display-off](console-lock-display-off.html).
- Not Energy saver on AC. That overlay dim is [energy-saver-ac](energy-saver-ac.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not CABC, Night light, HDR SDR-content brightness, or a GPU “Display Power Saving Technology” slider.
- Not a DisplayPort SKU. A brightness dip is not a DP drop. That cable page is [displayport-cable-sitstand](../reviews/displayport-cable-sitstand.html).
- Not a High-performance plan essay. One display setting.
- Not a registry paste. If Settings and `powercfg` omit the knob, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
