# Power mode Best power efficiency overlay vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/power-mode-overlay-ac.html

Companion to [Energy saver](windows11-energy-saver.html) and [Battery saver](battery-saver-ac-desk.html). Those overlays can already be Off, the leaf gone, Minimum processor state already 100, and the named task still looks frozen. This pack is Windows Settings → System → Power & battery → **Power mode**. A docked AC Grok desk should not sit on **Best power efficiency**. The overlay greys the plan: Control Panel still stars Balanced. Distinct from Energy saver and Battery saver. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, Energy saver, and Battery saver can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Settings Power mode is still **Best power efficiency** (Windows 10: Better battery). That is overlay scheme `OVERLAY_SCHEME_MIN`, not a second plan. It rides on Balanced and overrides CPU / PPM plus background power throttling. Display, disk, and sleep stay on the plan. `powercfg /getactivescheme` still prints Balanced. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The overlay greys the plan.

Two greys, two pages:
- Energy saver On greys the Power mode *control*. Dropdown locked. That is [windows11-energy-saver](windows11-energy-saver.html).
- This page: Energy saver Off, leaf gone, Power mode changeable, Plugged in = Best power efficiency. Balanced is still starred. The overlay is the liar.

Switching the classic plan off Balanced (High performance / Power saver / Ultimate) also greys Power mode, because the overlay only lives on Balanced. Do not cargo-cult High performance to hide Best power efficiency.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. The Power mode overlay is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| DISPLAY / SYSTEM / AWAYMODE holder is not None | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Settings still says Battery saver. Leaf on | [battery-saver-ac-desk](battery-saver-ac-desk.html). Pre-24H2 name. Wrong page. |
| Quick Settings Energy saver On. Leaf on. Power mode greyed | [windows11-energy-saver](windows11-energy-saver.html). That overlay greys this control. |
| Always use energy saver On / Adaptive. Power mode greyed | Different layer. Always-use Energy saver, not Power mode. |
| Power mode greyed because the plan is High performance / Power saver / Ultimate | Overlay only lives on Balanced. Restore Balanced. Not a plan switch. |
| Power mode already Balanced or Best performance; leaf gone; background work still EcoQoS-starved | Different layer. Process EcoQoS. Wrong page. |
| Maximum processor state 99 or 80 after the overlay is already Balanced | [processor-power-throttling](processor-power-throttling.html). Plan ceiling, not the overlay. |
| Docked, brick in the wall, Settings still says On battery or Plugged in, not charging | Dock / PD / cable lie. Fix AC detection first. |
| Session still awake. Named task Ready / 267009. Grok TUI looks frozen. Energy saver Off. Leaf gone. Power mode changeable. Control Panel still Balanced. Settings Power mode is Best power efficiency (or Better battery / Recommended) | **This page** |
| Plugged in already Balanced or Best performance; Energy saver Off; leaf gone; TUI still starves | Different layer. Plan CPU / cooling / USB. Do not invent a registry paste here. |

Do not drag Power mode as the first click on a new host. If Power mode is greyed, you are not on this page. Best power efficiency on Plugged in is the fail. Balanced overlay (none) is the pass.

## What to change (docked AC Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here. The overlay does not own those timers.
2. Confirm Minimum processor state is already honest on AC — 100 on plugged-in. If the floor is still 5%, that is [min-state](processor-min-state-ac.html), not this page. Best power efficiency on top of a 5% floor is two liars.
3. Confirm Energy saver / Battery saver are Off so Power mode is changeable — `Win+A` leaf gone. If the Power mode dropdown is greyed, that overlay is still on. [Energy saver](windows11-energy-saver.html) (24H2) or [Battery saver](battery-saver-ac-desk.html) (pre-24H2). Stop. Do not cargo-cult Best performance on a locked control.
4. Confirm Windows reports Plugged in while docked — Settings → System → Power & battery, top of the page. On battery with the brick in the wall is a dock / PD / cable lie. The On battery Power mode dropdown is then the one that fires.
5. Confirm the classic plan is still Balanced — Control Panel → Power Options, or `powercfg /getactivescheme`. The overlay only lives on Balanced. If the starred plan is High performance, Power saver, or Ultimate Performance, Power mode greys. Restore Balanced. Leaving Balanced starred while Power mode is Best power efficiency is the grey this page names.
6. Settings → System → Power & battery → **Power mode** — set *Plugged in* to **Balanced** (overlay none). **Best performance** is allowed on a desk that never unplugs. **Best power efficiency** is the fail. Windows 10 labels: Better battery / Better performance / Best performance. OEM “Recommended” is often still the efficiency overlay. Some 24H2 builds expose two dropdowns (Plugged in and On battery). This page’s AC pass is the Plugged in row.
7. Leave On battery as travel if the cube actually leaves the wall. Better battery / Best power efficiency on DC is travel insurance. A desk that never unplugs can set both dropdowns to Balanced. Do not leave Plugged in on Best power efficiency “until the next trip.”
8. Leave Energy saver, Battery saver, and Lower screen brightness alone once Off. Those pages own the leaf. Do not Apply all on Energy recommendations.
9. Leave Maximum processor state, EcoQoS registry, and Intel Speed Shift EPP alone on this page. Best power efficiency engages background power throttling as a side effect. Clearing the overlay is the click here.
10. Leave the Balanced plan in place. This is one Settings overlay, not a switch to High performance. High performance greys Power mode. Do not rename the plan. Do not claim a fleet GPO.
11. Confirm.

```
powercfg /getactivescheme
powercfg /aliasesh
powercfg /query OVERLAY_SCHEME_MIN
powercfg /a
```

`/getactivescheme` still prints Balanced while Power mode is Best power efficiency. That is the overlay greying the plan — it is not proof the overlay is none. `/aliasesh` must list `OVERLAY_SCHEME_MIN` (Better Battery-life Overlay). `OVERLAY_SCHEME_NONE` is the all-zeros Balanced overlay. `OVERLAY_SCHEME_MAX` is Best performance. If those aliases are omitted, this firmware or edition did not expose overlay schemes — stop; do not invent a registry hack on a public page. `/query OVERLAY_SCHEME_MIN` enumerates that overlay’s PPM. It does **not** prove the overlay is live this session. Settings Power mode is the live tell. There is no honest public `powercfg /getactiveoverlay` on this host. Do not write `/overlaysetactive` from this page; Settings is the click. Do not paste `ActiveOverlayAcPowerScheme`. Hidden is not Off. `powercfg /a` still names the standby type; this page is not sleep. Plugged in = Balanced (or Best performance) + Energy saver Off + Power mode changeable + plan still Balanced is the pass. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Minimum processor state already 100 on AC. Energy saver / Battery saver already Off. Otherwise this soak is lying.
2. Settings → Power & battery shows Plugged in. Dock and brick still seated. Power mode is changeable (not greyed).
3. Power mode Plugged in is Balanced or Best performance. Not Best power efficiency. Not Better battery. Not an OEM Recommended chip that is still the efficiency overlay.
4. Control Panel still stars Balanced. `powercfg /getactivescheme` still prints Balanced. That is expected. The overlay is none or MAX, not MIN. The plan is not greyed by a High performance switch.
5. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. A session that paints but never completes a tool call because Best power efficiency paused background work is a fail on this page.
6. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with Best power efficiency on is not forever. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the overlay is already none.

## What this page is not
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not the Windows 11 Energy saver slider (leaf, auto-on, greys this control).
- Not legacy Battery saver (battery-saver-ac-desk). Pre-24H2, DC-designed.
- Not Always use energy saver (On / Adaptive).
- Not a High-performance plan essay. One Settings overlay. Leave Balanced starred.
- Not Maximum processor state and not EcoQoS registry.
- Not Energy recommendations Apply all.
- Not a registry paste. If Settings and `powercfg /aliasesh` omit the overlay, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
