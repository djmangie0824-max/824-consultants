# Critical battery action vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/critical-battery-action.html

Companion to [Windows Hibernate Off](hibernate-off-forever.html), the Battery saver / Energy saver overlay on an AC desk, and [UPS for a Windows operator host](../reviews/ups-windows-operator-host.html). Those packs delete ACPI S4, throttle an awake session, or size wall-side runtime. This pack is the Battery subgroup verb: **Critical battery action**. That is `CRITBATACTION`. Default is often Hibernate at ~5%. A closed-lid docked Grok desk with a flaky gauge can still fire Hibernate or Sleep while the GaN brick is in the wall.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing on AC. Sleep after can already be Never. Fast Startup can already be off. `powercfg /h off` can already have deleted S4. The tray can still lie. Aged packs, swollen cells, OEM embedded controllers, and dock PD that reports “plugged in, not charging” will jump the reported percent to 0–5% in one sample. Windows then runs Critical battery action. Balanced default is Hibernate. Some plans Sleep. Either one dumps the user context the named task needs. Task Scheduler still shows Ready. Next-run is in the future. No hourly fire happens until someone resumes and signs in.

The AC index is not the whole story. Critical battery action is a DC-path verb. A flaky gauge that stops reporting charge current makes Windows treat a docked brick as On battery. Setting only Plugged in to Do nothing leaves the DC index armed. That is the liar this page exists for.

If S4 is already gone and the action is still Hibernate, Windows often falls through to Shut down. That is worse, not safer. Do not use `/h off` to hide this row.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Do not invent a cluster.

## When this page applies
| What happened | Layer |
|---|---|
| Idle timeout 5–20 minutes, gauge honest, no critical toast | [windows-sleep-vs-forever](windows-sleep-vs-forever.html). `STANDBYIDLE`. |
| Closing the lid was the trigger | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Start-menu Hibernate / remaining S4 after Fast Startup is honest | [hibernate-off-forever](hibernate-off-forever.html). `powercfg /h off` deletes the state. This page is the Battery verb that still calls it. |
| Session stayed awake. Leaf on. CPU capped. Power mode greyed | Battery saver / Energy saver overlay on AC. Throttle, not a dump. Wrong page. See [energy-saver-ac](energy-saver-ac.html) if that pack is live. |
| Wall flicker. Dock dropped. PD brick died. Gauge was fine | [ups-windows-operator-host](../reviews/ups-windows-operator-host.html). Wall-side, not the pack. |
| Chassis or dock power key Sleeps the session | [power-button-action-ac](power-button-action-ac.html). `PBUTTONACTION`. |
| Low battery action (not Critical) Sleeps at ~10% | Sibling. `LOWBATACTION`. Not this click. Do not invent a registry paste here. |
| Lid already Do nothing. Sleep already not 5–20 minutes. S4 already off or idle-to-S4 already Never. Tray shows 0–5% or “plugged in, not charging” on a docked brick. Resume-from-hibernate splash, or a shutdown, then the hourly fires late | **This page.** `CRITBATACTION`. Critical battery action still Hibernate or Sleep. |

Do not set Critical battery action to Do nothing as the first click on a new host. Sleep timeouts, lid-close, and the S4 decision first. Do not copy DC Do nothing onto a commute laptop that actually unplugs — that cube should keep Hibernate on battery. This desk is closed-lid, docked, AC, and the gauge is the liar. Do not disable the Microsoft ACPI-Compliant Control Method Battery device. Do not yank the pack. Do not `powercfg /h off` to hide this row.

## What to change (closed-lid docked Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. If this desk still *intends* to Hibernate on a measured drain, stop here and keep S4. See [sleep-vs-forever](windows-sleep-vs-forever.html), [lid-close](lid-close-do-nothing.html), and [hibernate-off-forever](hibernate-off-forever.html).
2. Query before you cut — `powercfg /query SCHEME_CURRENT SUB_BATTERY CRITBATACTION`. Read *both* indexes. AC 0 with DC 2 is not a pass on a flaky pack. Query `BATLEVELCRIT` so you see the percent that arms the verb (often 5). Do not set that percent to 0 as the fix. 0 is not “never.” The action is the click.
3. Power Options → Change plan settings → Change advanced power settings → **Battery** → **Critical battery action**. Set **Plugged in** to **Do nothing**. On this forever desk, set **On battery** to **Do nothing** as well, because the liar is the DC path. A travel cube keeps Hibernate on battery. Do not Shut down from this row to “make it obvious.”
4. Leave Low battery action, Critical battery notification, and Reserve battery level as siblings. `LOWBATACTION` is not this click. The notification toast is not the dump. Reserve level is not the dump. Do not uncheck “Critical battery notification” and call the action done.
5. Leave the current plan in place. This is one Battery-subgroup verb, not a switch to High performance. Do not rename the plan. Do not invent a fleet GPO. Do not install systemd on this Windows profile.
6. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_BATTERY
powercfg /query SCHEME_CURRENT SUB_BATTERY CRITBATACTION
powercfg /query SCHEME_CURRENT SUB_BATTERY BATLEVELCRIT
powercfg /setacvalueindex SCHEME_CURRENT SUB_BATTERY CRITBATACTION 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_BATTERY CRITBATACTION 0
powercfg /setactive SCHEME_CURRENT
```

`SUB_BATTERY` is the Battery subgroup. `CRITBATACTION` is Critical battery action. Typical values: **0 = Do nothing**, **1 = Sleep**, **2 = Hibernate**, **3 = Shut down**. 0 on AC *and* DC is the pass for this docked desk. `BATLEVELCRIT` is the percent that arms the verb — leave it; do not cargo-cult 0. `/setactive SCHEME_CURRENT` commits the indexes. `powercfg /batteryreport` can prove a lying pack (design vs full, recent “suspended” while the brick was in). Keep that report off Pages. If Hibernate is still the DC index after the set, the command did not stick (needs the active scheme commit, or a policy we do not run). Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep timeouts already honest. Lid already Do nothing on AC. S4 decision already made on purpose. Otherwise this soak is lying about which state killed the hour.
2. `CRITBATACTION` AC index 0 and DC index 0. GUI matches. `LOWBATACTION` was not the click you just made.
3. Plugged in. Lid closed on the dock for sixty minutes. If the tray already shows 0–5% or “plugged in, not charging,” the session must stay Interactive across that hour. `LEXXII-Materialize-Forever` last-run must advance. A resume-from-hibernate splash, a shutdown, or a Sleep wake is a fail — the Battery verb still fired.
4. Do not discharge the forever-desk pack on purpose to “prove” 5%. Query is the proof on this host. A travel cube can keep Hibernate on DC and is not this soak.
5. Do not spawn a fourth Grok TUI because last result is `267009`. That code is still-running, not proof the Battery verb is already Do nothing.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not [hibernate-off-forever](hibernate-off-forever.html). That pack deletes S4. This pack is the Battery verb.
- Not battery-saver-ac-desk. Saver overlay on AC. Leaf. Always-use. Session stays awake. See [energy-saver-ac](energy-saver-ac.html) if that pack is live.
- Not a UPS SKU. Brown-out hardware is [ups-windows-operator-host](../reviews/ups-windows-operator-host.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Power button action. That is [power-button-action-ac](power-button-action-ac.html).
- Not Low battery action, not Critical battery notification, not Reserve battery level.
- Not a claim every laptop should lose critical Hibernate. Travel cubes on battery may keep it. This desk is closed-lid, docked, AC.
- Not a Device Manager disable of the ACPI battery. Not a pack-pull. Not a registry paste.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
