# Low battery action vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/low-battery-action.html

Companion to [Critical battery action](critical-battery-action.html) and [Windows Hibernate Off](hibernate-off-forever.html). Critical is the ~5% verb. S4-off deletes the hiberfile. This pack is the earlier Battery subgroup verb: **Low battery action**. That is `LOWBATACTION`. Default is often Sleep at ~10%. A closed-lid docked Grok desk with a flaky gauge can still fire Sleep while the GaN brick is in the wall, before Critical ever runs.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing on AC. Sleep after can already be Never. Fast Startup can already be off. `powercfg /h off` can already have deleted S4. Critical battery action can already be Do nothing on AC and DC. The tray can still lie at ten percent, not five. Aged packs, swollen cells, OEM embedded controllers, and dock PD that reports “plugged in, not charging” will jump the reported percent to 8–12% in one sample. Windows then runs Low battery action. Balanced default is Sleep. Some plans Hibernate. Either one dumps the user context the named task needs. Task Scheduler still shows Ready. Next-run is in the future. No hourly fire happens until someone resumes and signs in. Critical never gets a vote.

The AC index is not the whole story. Low battery action is a DC-path verb. A flaky gauge that stops reporting charge current makes Windows treat a docked brick as On battery. Setting only Plugged in to Do nothing leaves the DC index armed. That is the liar this page exists for.

Do not set Low battery level to 0 as the fix. 0 is not “never.” The action is the click. Do not uncheck Low battery notification and call the action done. A toast is not a dump.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Do not invent a cluster.

## When this page applies
| What happened | Layer |
|---|---|
| Idle timeout 5–20 minutes, gauge honest, no low toast | [windows-sleep-vs-forever](windows-sleep-vs-forever.html). `STANDBYIDLE`. |
| Closing the lid was the trigger | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Start-menu Hibernate / remaining S4 after Fast Startup is honest | [hibernate-off-forever](hibernate-off-forever.html) |
| Tray shows 0–5% or a critical toast, then Hibernate / Sleep / Shut down | [critical-battery-action](critical-battery-action.html). `CRITBATACTION`. Wrong page. |
| Session stayed awake. Leaf on. CPU capped. Power mode greyed | Battery saver / Energy saver overlay on AC. Throttle, not a dump. |
| Wall flicker. Dock dropped. PD brick died. Gauge was fine | [ups-windows-operator-host](../reviews/ups-windows-operator-host.html). Wall-side, not the pack. |
| Chassis or dock power key Sleeps the session | [power-button-action-ac](power-button-action-ac.html). `PBUTTONACTION`. |
| Low battery level still 10. Action already Do nothing. Toast only | Skip. The toast is not the dump. Do not invent a registry paste to zero the percent. |
| Lid already Do nothing. Sleep already not 5–20 minutes. S4 already off or idle-to-S4 already Never. Critical already Do nothing. Tray shows ~10% or “plugged in, not charging” on a docked brick. Resume-from-sleep splash, then the hourly fires late | **This page.** `LOWBATACTION`. Low battery action still Sleep or Hibernate. |

Do not set Low battery action to Do nothing as the first click on a new host. Sleep timeouts, lid-close, the S4 decision, and Critical battery action first. Do not copy DC Do nothing onto a commute laptop that actually unplugs — that cube should keep Sleep or Hibernate on battery. This desk is closed-lid, docked, AC, and the gauge is the liar. Do not disable the Microsoft ACPI-Compliant Control Method Battery device. Do not yank the pack. Do not zero Low battery level to hide this row.

## What to change (closed-lid docked Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. Critical battery action is already Do nothing on AC and DC for this desk (or skip if that GUID is missing). If this desk still *intends* to Sleep on a measured drain, stop here. See [sleep-vs-forever](windows-sleep-vs-forever.html), [lid-close](lid-close-do-nothing.html), [hibernate-off-forever](hibernate-off-forever.html), and [critical-battery-action](critical-battery-action.html).
2. Query before you cut — `powercfg /query SCHEME_CURRENT SUB_BATTERY LOWBATACTION`. Read *both* indexes. AC 0 with DC 1 is not a pass on a flaky pack. Query `BATLEVELLOW` so you see the percent that arms the verb (often 10). Do not set that percent to 0 as the fix. 0 is not “never.” The action is the click.
3. Power Options → Change plan settings → Change advanced power settings → **Battery** → **Low battery action**. Set **Plugged in** to **Do nothing**. On this forever desk, set **On battery** to **Do nothing** as well, because the liar is the DC path. A travel cube keeps Sleep or Hibernate on battery. Do not Shut down from this row to “make it obvious.”
4. Leave Critical battery action, Low battery notification, Low battery level, and Reserve battery level as siblings. `CRITBATACTION` is not this click. The notification toast is not the dump. Reserve level is not the dump. Do not uncheck “Low battery notification” and call the action done. Do not zero `BATLEVELLOW`.
5. Leave the current plan in place. This is one Battery-subgroup verb, not a switch to High performance. Do not rename the plan. Do not invent a fleet GPO. Do not install systemd on this Windows profile.
6. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_BATTERY
powercfg /query SCHEME_CURRENT SUB_BATTERY LOWBATACTION
powercfg /query SCHEME_CURRENT SUB_BATTERY BATLEVELLOW
powercfg /setacvalueindex SCHEME_CURRENT SUB_BATTERY LOWBATACTION 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_BATTERY LOWBATACTION 0
powercfg /setactive SCHEME_CURRENT
```

`SUB_BATTERY` is the Battery subgroup. `LOWBATACTION` is Low battery action (GUID `d8742dcb-3e6a-4b3c-b3af-37c9d3177dce`). Typical values: **0 = Do nothing**, **1 = Sleep**, **2 = Hibernate**, **3 = Shut down**. 0 on AC *and* DC is the pass for this docked desk. `BATLEVELLOW` is the percent that arms the verb — leave it; do not cargo-cult 0. `CRITBATACTION` is the later ~5% sibling, not this click. `/setactive SCHEME_CURRENT` commits the indexes. `powercfg /batteryreport` can prove a lying pack (design vs full, recent “suspended” while the brick was in). Keep that report off Pages. If Sleep is still the DC index after the set, the command did not stick (needs the active scheme commit, or a policy we do not run). Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. S4 already off or idle-to-S4 already Never. Critical already Do nothing. Otherwise this soak is lying about a later verb.
2. Leave the desk docked an hour, lid closed, GaN brick in the wall. Tray may toast at ~10% on a lying pack. The session must not Sleep. Named task last-run still advances. No resume-from-sleep splash.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 after a surprise Sleep at a fake 10% is not forever.
4. LOWBATACTION still 0 on AC and DC. If someone set Sleep “so the pack does not die,” restore Do nothing on this class of operator desk. A travel cube is a different machine. Do not “fix” it by switching the whole plan to High performance.
5. Do not zero BATLEVELLOW to pass this soak. The action is the click. Missing GUID = skip, not a red soak. Do not invent the value in the registry.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the low-battery verb is already Do nothing. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not critical-battery-action. That later verb is [critical-battery-action](critical-battery-action.html).
- Not Hibernate Off. That S4 delete is [hibernate-off-forever](hibernate-off-forever.html).
- Not Low battery level. That percent arms the verb. Leave it. Do not cargo-cult 0.
- Not Low battery notification. A toast is not a dump.
- Not Battery saver / Energy saver overlay. Throttle, not a dump.
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not a UPS SKU. That review is [ups-windows-operator-host](../reviews/ups-windows-operator-host.html).
- Not a High-performance plan essay. One Battery-subgroup verb.
- Not a registry paste. If Settings and `powercfg` omit the knob, stop.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
