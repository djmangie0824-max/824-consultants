# System unattended sleep timeout vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/unattended-sleep-timeout.html

Companion hidden Sleep-subgroup timer to [Sleep after](sleep-after-timeout.html) and [wake timers](wake-timers-forever.html). Those packs set `STANDBYIDLE` to Never and Enable RTC recovery. This pack is Power Options → Sleep → **System unattended sleep timeout**. That is `UNATTENDSLEEP` (GUID `7bc4a2f9-d8fc-4469-b07b-33eb785aaca0`). After a wake-timer or Wake on LAN, Windows uses this value *instead of* Sleep after. OEM default is often 120 seconds. Interactive-only `LEXXII-Materialize-Forever` wakes, then naps. Task Scheduler still shows Ready.

Distinct from [windows-sleep-vs-forever](windows-sleep-vs-forever.html) (`STANDBYIDLE` diagnosis), [hibernate-off-forever](hibernate-off-forever.html) (`powercfg /h off`), and Hibernate after idle (`HIBERNATEIDLE`).

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep after can already be Never. Lid can already be Do nothing. Hibernate can already be off. Allow wake timers can already be Enable. `WakeToRun` can already be checked. Windows still woke unattended — timed event, Task Scheduler wake, WoL, automatic maintenance. No keyboard. No mouse. The power manager does not count `STANDBYIDLE` on that wake. It counts `UNATTENDSLEEP`. Two minutes later the session is back in S3 or S0ix. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks Sleep after lied. A second timer, hidden by default, put the box back down.

Host-forever is that Windows task on a 5-minute pulse. Two minutes of unattended awake is shorter than the pulse. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not a fake cluster. Not Vercel. NLV stays off Pages.

## When this page applies
| Symptom after idle / wake | Layer |
|---|---|
| Host “looks on,” user tasks frozen, RAM still powered — S0ix diagnosis, 267009 as the tell | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| Session slept after 10–20 minutes of attended idle. Sleep after is not Never | [sleep-after-timeout](sleep-after-timeout.html). `STANDBYIDLE`, not this hidden row. |
| Closing the lid was the trigger | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Machine actually off. RAM written to hiberfil.sys. S4 | [hibernate-off-forever](hibernate-off-forever.html). `powercfg /h off`. Not a timeout. |
| Idle-to-S4 minutes while Hibernate is still available. `HIBERNATEIDLE` | Different layer. Hibernate after idle. Setting that row to Never still leaves S4, Start-menu Hibernate, and this unattended sleep timer. |
| Sleep still happened; next-run in the past; task Enabled. Need RTC recovery | [wake-timers-forever](wake-timers-forever.html). That pack wakes the box. This pack stops the unattended re-sleep after the wake. |
| Sleep after already Never. Hibernate after already Never or S4 already gone. Wake timers Enable. WakeToRun checked. Box wakes for the named task, then sleeps again in about two minutes with nobody at the keyboard. Named task Ready / 267009 | **This page.** `UNATTENDSLEEP` on AC. |
| `UNATTENDSLEEP` already 0 on AC, or GUID missing after unhide | This minutes knob is already honest, or this edition did not expose it. Stop. Not a fail. Not a registry hack. |

Do not set System unattended sleep timeout to Never as the first click on a new host. Sleep after (`STANDBYIDLE`) first. Hidden is not Never. Do not use `/h off` to hide this knob.

## What to change (plugged-in Grok desk)
1. Confirm attended idle is already honest — plugged-in Sleep after is Never. See [sleep-after-timeout](sleep-after-timeout.html) and [windows-sleep-vs-forever](windows-sleep-vs-forever.html). If `STANDBYIDLE` is still 10–20 minutes, this hidden row is not the liar yet.
2. Confirm the sibling Sleep rows are not this click — Hibernate after idle is `HIBERNATEIDLE`, a different timeout. Deleting S4 is [hibernate-off-forever](hibernate-off-forever.html) (`powercfg /h off`). Allow hybrid sleep is [hybrid-sleep-ac](hybrid-sleep-ac.html). Allow wake timers is [wake-timers-forever](wake-timers-forever.html) — leave that Enable on AC so a named task can still recover if sleep happens. This page is the re-sleep after an unattended wake, not the wake itself.
3. Unhide the row. System unattended sleep timeout is ATTRIB_HIDE on most consumer images. Missing from the GUI before this step is expected, not a skip.
4. Power Options → Change plan settings → Change advanced power settings → **Sleep** → **System unattended sleep timeout**.
5. Set **Plugged in** to **0** (Never). On battery may stay 2 minutes if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
6. Leave Sleep after alone on this click. `STANDBYIDLE` is attended idle. `UNATTENDSLEEP` is unattended idle after a wake.
7. Leave Hibernate after idle and `/h off` alone on this click. Those are S4. This row is still a sleep timeout.
8. Leave the current plan in place. This is one hidden Sleep knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
9. Confirm.

```
powercfg -attributes SUB_SLEEP 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_SLEEP UNATTENDSLEEP
powercfg /setacvalueindex SCHEME_CURRENT SUB_SLEEP UNATTENDSLEEP 0
powercfg /setactive SCHEME_CURRENT
powercfg /waketimers
```

`SUB_SLEEP` is the Sleep subgroup. `UNATTENDSLEEP` is System unattended sleep timeout. Microsoft Learn also names the same GUID `UnattendTimeout` — query by GUID `7bc4a2f9-d8fc-4469-b07b-33eb785aaca0` if the alias is missing. The AC index is **seconds**. **0** is Never. 120 is 2 minutes — the usual hidden OEM default. Apply with `/setactive` or the GUI change does not take. Unhide is `powercfg -attributes … -ATTRIB_HIDE`, not a registry paste. If powercfg still omits the GUID after that, this edition did not expose the knob — stop; do not invent an unattended-sleep hack on a public page. `STANDBYIDLE` is Sleep after, not this click. `HIBERNATEIDLE` is Hibernate after idle, not this click. `powercfg /h off` deletes S4, not this click. Wake timers are RTC recovery, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`. NLV stays off Pages.

## Soak test
1. Sleep after already Never on AC. Lid already Do nothing on AC if this soak closes the lid. Hibernate after idle already Never, or S4 already gone if that was the measured cut. Wake timers Enable on AC. `WakeToRun` checked on `LEXXII-Materialize-Forever`. Otherwise this soak is lying about which timer killed the wake.
2. Let the box sleep once (or wait for the next named fire). Do not touch keyboard or mouse. The wake-timer must bring the session back. Stay unattended five minutes — longer than the usual 120-second default, equal to the host-forever pulse. The session does not re-enter S3 or S0ix on the unattended timer. One silent nap at minute two is a fail if `UNATTENDSLEEP` was not 0. Named task still next-runs.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a re-slept session after a successful wake is not forever. Last-run must advance across that five minutes.
4. `UNATTENDSLEEP` still 0 on AC. If someone set 2 minutes to "let maintenance finish then sleep," restore Never on this class of Interactive-only desk. Do not "fix" it by switching the whole plan to High performance.
5. Host that already has 0 on AC, or GUID missing after unhide = skip, not a red soak. Do not invent an unattended-sleep registry value to make this page apply.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the unattended timer stayed Never. Grok schedulers expiring in 7 days is a different list.

## What this page is not
- Not [windows-sleep-vs-forever.html](windows-sleep-vs-forever.html). Modern Standby / Interactive-only / 267009 diagnosis.
- Not [sleep-after-timeout.html](sleep-after-timeout.html). `STANDBYIDLE` — attended Sleep after.
- Not [hibernate-off-forever.html](hibernate-off-forever.html). S4 / `powercfg /h off`.
- Not Hibernate after idle. That timeout is `HIBERNATEIDLE`. Distinct Sleep-subgroup row. Do not set it here.
- Not [wake-timers-forever.html](wake-timers-forever.html). That pack arms the wake. This pack keeps the wake from napping again.
- Not [lid-close-do-nothing.html](lid-close-do-nothing.html). Lid action.
- Not [hybrid-sleep-ac.html](hybrid-sleep-ac.html). `HYBRIDSLEEP`.
- Not a Linux systemd unit. Host-forever is Windows task `LEXXII-Materialize-Forever`.
- Not a Grok in-session scheduler. Those expire in 7 days even when durable.
- Not a fake cluster. Not Vercel.
- Not a High-performance plan essay. One hidden Sleep setting.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
