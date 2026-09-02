# Windows 11 Energy saver slider vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/windows11-energy-saver.html

Companion to [processor min-state](processor-min-state-ac.html) and [sleep vs forever](windows-sleep-vs-forever.html). Timeouts and the Balanced plan can already be honest and the named task still looks frozen. This pack is the live Windows 11 control: **Quick Settings (Win+A) → Energy saver** plus Settings → **Turn energy saver on automatically when battery level is at**. A docked AC Grok desk should not sit under Energy saver. Distinct from legacy Battery saver and processor power throttling. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, and Minimum processor state can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Windows 11 24H2 replaced Battery saver with **Energy saver** and put a live slider in Quick Settings. Microsoft copy tells people to leave it on all the time. Display drops ~30%. Background processes pause. Power mode greys out. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The leaf was on.

Two controls, one overlay:
- Live slider: `Win+A` → Energy saver. On a docked desk this overlay is legal even with the brick in the wall.
- Auto-on threshold: Settings → System → Power & battery → Energy saver → Turn energy saver on automatically when battery level is at → Never / 10% / 20% / **30% default** / 40% / 50% / Always. A USB-C dock that reports On battery, or Plugged in, not charging, lets 30% fire while AC is physically present.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. The Energy saver slider is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| DISPLAY / SYSTEM / AWAYMODE holder is not None | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Boost mode Disabled; clocks sit on base | [processor-boost-mode](processor-boost-mode.html) |
| Settings still says Battery saver, not Energy saver | Different layer. Legacy Battery saver (pre-24H2, DC-only). battery-saver-ac-desk, not this slider. |
| Energy saver Off, leaf gone, Power mode still changeable; background work still EcoQoS-starved | Different layer. Processor power throttling. Wrong page. |
| Power mode is Best power efficiency; Energy saver is Off; leaf is gone | Different layer. Power mode overlay. Wrong page. |
| Always use energy saver is On / Adaptive; auto-on row is hidden | Different layer. Always-use overlay, not the live slider. |
| Docked, brick in the wall, Settings still says On battery or Plugged in, not charging | Dock / PD / cable lie. [USB-C PD honesty](../reviews/usbc-pd-cable-honesty.html). Fix AC detection first. |
| Session still awake. Named task Ready / 267009. Grok TUI looks frozen. Screen dimmer than set. Power mode greyed. Quick Settings Energy saver is On. Leaf on a docked AC desk | **This page** |
| Live tile already Off; auto-on still Always or 30% and the dock reports DC | **This page.** Auto-on Never is the pass on a desk that never unplugs. |
| Live tile Off; auto-on Never; leaf gone; Power mode changeable; TUI still starves | Different layer. Plan CPU / cooling / USB. Do not invent a registry paste here. |

Do not drag Energy saver Off as the first click on a new host. Off on the live slider is the pass. Auto-on Always is not Off. Auto-on 30% is not Never.

## What to change (docked AC Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Minimum processor state is already honest on AC — 100 on plugged-in. If the floor is still 5%, that is [min-state](processor-min-state-ac.html), not this page. Energy saver on top of a 5% floor is two liars.
3. Confirm this host says Energy saver, not Battery saver — 24H2 and later. If Settings still labels the card Battery saver, this is the wrong page. Legacy Battery saver was DC-only.
4. Confirm Windows reports Plugged in while docked — Settings → System → Power & battery, top of the page. On battery with the brick in the wall is a dock / PD / cable lie. See [USB-C PD honesty](../reviews/usbc-pd-cable-honesty.html) and [GaN brick](../reviews/gan-usbc-charger-14h-laptop.html). The auto-on threshold fires on whatever Windows thinks is DC.
5. Live slider Off now — `Win+A` (or the battery / power icon) → Energy saver. Off. The leaf over the battery means the overlay is live *this session*. Scroll the Quick Settings grid if the tile is hidden on 24H2. Power mode must become changeable again after this tap.
6. Auto-on threshold → **Never**. Settings → System → Power & battery → Energy saver → Turn energy saver on automatically when battery level is at → Never. 10 / 20 / 30 / 40 / 50 are travel values. Always in that dropdown is a fail on a desk that lives on a dock. This is not the Always use energy saver row. If that Always-use row is On or Adaptive, the auto-on control is often hidden — different layer, stop.
7. Leave **Lower screen brightness when using energy saver** alone. That checkbox only matters when Energy saver is actually on (travel DC). Unchecking it does not disable the CPU cap.
8. Leave Power mode alone on this page. Best power efficiency / Balanced / Best performance is a sibling overlay. If that row is greyed, the Energy saver slider is still on.
9. Leave Processor power throttling alone on this page. EcoQoS is not this tile.
10. Leave the current plan in place. This is the live slider plus the auto-on threshold, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not Apply all on Energy recommendations.
11. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_ENERGYSAVER ESBATTTHRESHOLD
powercfg /query SCHEME_CURRENT SUB_ENERGYSAVER ESBRIGHTNESS
powercfg /a
```

`ESBATTTHRESHOLD` is the plan’s auto-on battery percentage. Typical travel default is 30 (`0x0000001e`). That query does **not** prove the live Quick Settings slider is Off, and it does not prove Settings Never on every build — Never is a Settings click, not a public `powercfg /energy-saver-off`. Do not write `/setdcvalueindex` to 0 and claim Never; 0 is not documented the same way on every 24H2 servicing stack. `ESBRIGHTNESS` is the dim scale, not the on/off. `powercfg /a` still names the standby type; this page is not sleep. If `SUB_ENERGYSAVER` or `ESBATTTHRESHOLD` is missing, this firmware or edition did not expose the old Battery-saver subgroup — stop; do not invent a registry hack on a public page. Hidden is not Off. Quick Settings leaf gone + auto-on Never + Power mode still changeable + Settings showing Plugged in is the pass for a docked desk. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Minimum processor state already 100 on AC. Otherwise this soak is lying.
2. Settings → Power & battery shows Plugged in (not On battery, not a surprise Plugged in, not charging). Dock and brick still seated.
3. Quick Settings Energy saver is Off. No leaf on the battery / power icon. Power mode is still changeable (not greyed). Screen brightness matches the operator’s set value, not a surprise 30% cut.
4. Auto-on is Never on a desk that never unplugs. Always and 30% with a lying dock are fails on this page.
5. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. A session that paints but never completes a tool call because Energy saver paused background work is a fail on this page.
6. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with the leaf on is not forever. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the slider is already Off.

## What this page is not
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not Processor performance boost mode. That is [processor-boost-mode](processor-boost-mode.html).
- Not legacy Battery saver (battery-saver-ac-desk). Pre-24H2, DC-only.
- Not Processor power throttling / EcoQoS.
- Not Always use energy saver (On / Adaptive). Different Settings row.
- Not the Power mode overlay (Best power efficiency / Balanced / Best performance).
- Not Energy recommendations Apply all.
- Not a High-performance plan essay. One live slider and one auto-on threshold.
- Not a registry paste. If Settings and `powercfg` omit the knob, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
