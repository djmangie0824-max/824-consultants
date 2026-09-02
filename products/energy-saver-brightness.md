# Energy saver brightness vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/energy-saver-brightness.html

Companion to [Windows 11 Energy saver slider](windows11-energy-saver.html) and [Display brightness on AC](display-brightness-ac.html). The slider pack already says Off / auto-on Never. VIDEONORMALLEVEL is the working percent. This pack is the leftover nits cut: **Lower screen brightness when using energy saver**. Default is On. A dock that reports On battery turns the leaf back on. Nits drop ~30%. Dual ultrawide stay listed. Task Scheduler still shows Ready. The overlay brightness cut is not Display brightness.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. The live Energy saver tile can already be Off. Auto-on can already be Never. Display brightness can already be the operator percent. Dim display after can already be 0. A USB-C dock still reports On battery or Plugged in, not charging. The leaf returns. **Lower screen brightness when using energy saver** is still checked. The lid drops ~30% from VIDEONORMALLEVEL the moment the overlay arms — no wait for idle minutes. Display settings still lists both screens. `schtasks` still prints Ready and last result 267009. The operator thinks Display brightness drifted. The overlay cut fired.

This is not Sleep. This is not VIDEOIDLE. This is not VIDEODIM. This is not ALS. A cut that appears the moment the leaf turns on is this checkbox. If Energy saver is already Off and never re-arms, this row does not fire. Leave it. Do not cargo-cult the uncheck as a second Off.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom | Layer |
|---|---|
| Quick Settings Energy saver still On; auto-on Always or 30% | [windows11-energy-saver](windows11-energy-saver.html) first. Off / Never. Then this page is leftover. |
| Internal panel leftover 20–40 from the first second. Leaf off. No wait | [display-brightness-ac](display-brightness-ac.html) |
| Idle minutes then a dim lid. VIDEODIM not 0 | [dim-display-after](dim-display-after.html) |
| VIDEODIM still fires. Dimmed display brightness 50 | [dimmed-display-brightness](dimmed-display-brightness.html) |
| Brightness hunts with room light. Leaf off. Timers 0 | [adaptive-brightness-ac](adaptive-brightness-ac.html) |
| Leaf Off. Auto-on Never. Lower-brightness still checked. Nits never drop | Skip. The cut does not fire when the overlay is Off. |
| Slider Off. Auto-on Never. Dock reports DC. Leaf returns. Lid drops ~30% immediately. Dual ultrawide stay listed. Named task Ready / 267009. Lower screen brightness when using energy saver is still checked | **This page.** Overlay brightness cut. |

Do not uncheck Lower screen brightness as the first click. Energy saver Off / auto-on Never first. Hidden is not unchecked. A black panel with a dock re-plug is VIDEOIDLE or VIDEOCONLOCK, not this checkbox.

## What to change (docked Grok desk)
1. Confirm the slider layer is already done — Win+A Energy saver Off. Auto-on Never. See [windows11-energy-saver](windows11-energy-saver.html). If the live tile is still On, stop here.
2. Settings → System → Power & battery → **Energy saver**. Uncheck **Lower screen brightness when using energy saver**. A travel cube may keep it. A desk that never unplugs should not lose 30% nits the moment a dock lies about DC.
3. Leave Display brightness, Dim display after, Dimmed display brightness, and ALS alone. VIDEONORMALLEVEL, VIDEODIM, the dimmed floor, and ADAPTBRIGHT are siblings. This checkbox is the overlay cut.
4. Leave the current plan in place. Do not Apply all on Energy recommendations. That card can re-arm auto-on.
5. Confirm.

```
powercfg /query SCHEME_CURRENT
REM Settings → System → Power & battery → Energy saver
REM Uncheck: Lower screen brightness when using energy saver
powercfg /a
```

There is often no well-known `powercfg` alias for this checkbox. The Settings toggle is the click. Do not invent a registry paste on a public page. If the row is missing, this edition did not expose it — skip. Query VIDEONORMALLEVEL and VIDEODIM so you do not confuse this overlay with those siblings. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Energy saver Off. Auto-on Never. VIDEOIDLE and VIDEODIM already honest. Otherwise this soak is lying about a timer or the slider.
2. If a dock can still report DC: unplug/replug PD once, then idle. Lid stays at working nits even if the leaf toasts. Display settings still lists the same screens. No handshake.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a 30% lid under a leftover leaf is not forever if this checkbox is still On.
4. No fourth Grok TUI. Last result 267009 is still-running, not proof the overlay cut is already Off. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not the Energy saver slider. That Off / Never pack is [windows11-energy-saver](windows11-energy-saver.html).
- Not Display brightness. That leftover percent is [display-brightness-ac](display-brightness-ac.html).
- Not Dim display after. That timer is [dim-display-after](dim-display-after.html).
- Not Dimmed display brightness. That floor is [dimmed-display-brightness](dimmed-display-brightness.html).
- Not ALS. That hunt is [adaptive-brightness-ac](adaptive-brightness-ac.html).
- Not a Linux systemd unit. This host is Windows.
- Not a SKU. Not a commission claim. Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
