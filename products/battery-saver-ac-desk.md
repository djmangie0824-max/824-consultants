# Battery saver on a plugged-in desk vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/battery-saver-ac-desk.html

Companion to [processor min-state](processor-min-state-ac.html) and [sleep vs forever](windows-sleep-vs-forever.html). Timeouts and the Balanced floor can already be honest and the named task still looks frozen. This pack is the named **Battery saver** overlay on Windows 10 and Windows 11 before the 24H2 Energy saver rename. **A docked AC Grok desk should not sit in Battery saver.** The leaf pauses background work. Grok CLI looks hung. Task Scheduler still shows Ready. Not Minimum processor state. Not processor power throttling.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, and Minimum processor state can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Battery saver is still On. Windows 10 and Windows 11 22H2/23H2 designed that overlay for DC. It is supposed to drop when the brick is in the wall. On a docked desk it often does not, because Windows never saw AC. USB-C PD failed. The dock reports “Connected, not charging” while the percentage drops. Auto-on at 20% fires. Background processes pause. Display drops ~30%. Power throttling gets forced on as a side effect. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The leaf was on while the brick was in the wall.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still read 100 on the AC column — that column is a liar if Windows is applying DC. The Battery saver overlay is the named liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| DISPLAY / SYSTEM / AWAYMODE holder is not None | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Minimum processor state still 5% on AC, leaf gone, Windows reports Plugged in | [processor-min-state-ac](processor-min-state-ac.html) |
| Leaf gone. Windows reports Plugged in. Background apps still EcoQoS / power-throttled | Different layer. Processor power throttling. Wrong page. |
| The card is named Energy saver. Always use is On / Adaptive on a session Windows already knows is AC | Different layer. Windows 11 24H2 Energy saver overlay. Wrong page. |
| Charge sits at 80% with “Connected, not charging.” Percentage is stable. Leaf is gone | Different layer. OEM conservation / charge cap. Wrong page. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Brick in the wall. Docked. Session still awake. Named task Ready / 267009. Grok TUI looks frozen. Quick Settings shows the leaf. Settings still says Battery saver. Taskbar is On battery or percentage is dropping | **This page** |
| Battery saver already Off; leaf gone; Windows reports Plugged in; TUI still starves | Different layer. Plan CPU / cooling / USB / power throttling. Do not invent a registry paste here. |

Do not tap Battery saver Off as the first click on a new host while Windows still thinks the chassis is on battery. The leaf will come back at the automatic threshold. First truth: Plugged in, not draining.

## What to change (plugged-in Grok desk)
1. Prove Windows reports Plugged in — Settings → System → Power & battery (Windows 10: System → Battery). The header must say plugged in, not a dropping percentage. Taskbar battery flyout must not say On battery. A docked desk with the brick in the wall and a draining meter is a PD / dock lie, not a CPU-plan problem. Reseat the USB-C PD cable. Use the barrel brick if the chassis has one. Do not keep rewriting forever-loop CPU rows while Windows is still on DC.
2. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here. If Windows was on DC, the DC timeout column was the one that fired — that is still sleep, not this overlay.
3. Confirm Minimum processor state is not the remaining liar on a real AC session — if Windows already reports Plugged in, the leaf is already gone, and the AC floor is still 5%, that is [min-state](processor-min-state-ac.html), not this page. Battery saver on top of a 5% DC floor is two liars. Do not set `PROCTHROTTLEMIN` on this page.
4. Settings → System → Power & battery → **Battery saver**. Windows 10: Settings → System → Battery. If the card is named **Energy saver**, you are on 24H2. That overlay can run on AC by design. Stop; this page is the Battery saver name.
5. Turn Battery saver Off now — Quick Settings (battery / power icon) → Battery saver. The leaf over the battery means the overlay is live *this session*. Off. A docked AC desk does not sit in Battery saver “until the next charge.” If Off does not stick and the meter is still dropping, Windows is still on DC. Go back to step 1.
6. Leave the automatic DC threshold as travel insurance, not Always. 20% is the usual default. Do not set that control to Always on a machine that lives on a dock. Always is how a desk that later loses PD sits in the overlay at 80% remaining. This page’s AC pass is Off now + Windows reports Plugged in.
7. Leave **Lower screen brightness while in battery saver** alone. That checkbox only matters when Battery saver is actually on (travel DC). Unchecking it does not disable the background pause.
8. Do not touch processor power throttling on this page. EcoQoS can stay armed after the leaf is gone. That is a sibling knob. Battery saver forces it while the leaf is on. Clearing the leaf is the click here.
9. Leave the current plan in place. This is one named overlay, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not Apply all on Energy recommendations. Conservation / charge-cap 80% is OEM firmware, not this overlay.
10. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_ENERGYSAVER
powercfg /batteryreport /output %TEMP%\lexxii-battery-report.html
powercfg /a
```

`SUB_ENERGYSAVER` is the plan’s battery-saver subgroup (brightness scale `ESBRIGHTNESS`, automatic threshold `ESBATTTHRESHOLD`). That query does **not** prove the overlay is Off this session — the leaf is the live tell. `ESBATTTHRESHOLD` at 20 is travel insurance, not an AC fail. Always / 100 on that threshold is a fail on a docked desk. Open the battery report locally and read **Recent usage**: AC versus Battery while the brick was in the wall. Battery rows during docked hours are the PD lie. Do not upload that HTML. `powercfg /a` still names the standby type; this page is not sleep. If `SUB_ENERGYSAVER` is missing, this firmware or edition did not expose the old subgroup — stop; do not invent a registry hack on a public page. Hidden is not Off. There is no honest public `powercfg /battery-saver-off`. Quick Settings leaf gone + Windows reports Plugged in + Battery saver Off is the pass. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Windows reports Plugged in (not a dropping meter). Otherwise this soak is lying — you soaked DC policy.
2. Battery saver is Off. Quick Settings does not show the leaf. Screen brightness matches the operator’s set value, not a surprise 30% cut. Automatic threshold is not Always.
3. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. A session that paints but never completes a tool call because Battery saver paused background work is a fail on this page.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with the leaf on is not forever. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof Battery saver is already Off. A leaf that returns after the next PD dropout is a dock problem, not a reason to rewrite min-state.

## What this page is not
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not processor power throttling / EcoQoS. That knob can remain after the leaf is gone.
- Not the Windows 11 24H2 Energy saver overlay (Always use on AC).
- Not OEM conservation / 80% charge cap.
- Not Energy recommendations Apply all.
- Not a High-performance plan essay. One named overlay.
- Not a registry paste. If Settings and `powercfg` omit the knob, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
