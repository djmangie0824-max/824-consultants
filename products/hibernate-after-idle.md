# Hibernate after idle vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/hibernate-after-idle.html

Companion minutes knob to [Hibernate Off vs a forever loop](hibernate-off-forever.html). That pack deletes ACPI S4 with `powercfg /h off`. It told you to query `HIBERNATEIDLE` and ignore it as the cut. This pack *is* that timeout: Power Options → Sleep → **Hibernate after**. Idle minutes to S4. The hiberfile stays. Start-menu Hibernate stays. Distinct from [Allow hybrid sleep](hybrid-sleep-ac.html) (`HYBRIDSLEEP`) and from [sleep vs forever](windows-sleep-vs-forever.html) (`STANDBYIDLE` / Modern Standby diagnosis).

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing on AC. Sleep after can already be Never. Hybrid sleep can already be Off. Fast Startup can already be off. Hibernate is still listed in `powercfg /a` because this desk still wants the S4 verb — UPS remaining-minutes, Start-menu Hibernate, a travel cube that actually unplugs. Balanced **Hibernate after** on AC is often 180 minutes. Windows counts `HIBERNATEIDLE` in seconds. 10800 is three hours. The session writes RAM to `hiberfil.sys` and the machine is actually off. Task Scheduler still shows Ready. Next-run sits in the future. No 5-minute fire happens until someone resumes from S4 and signs in.

This is not `powercfg /h off`. Never (0 seconds) leaves S4. This is not `HYBRIDSLEEP`. This is not `STANDBYIDLE`. `powercfg /a` still reports Hibernate after this click. The Hibernate after value is the liar.

Host-forever is Windows task `LEXXII-Materialize-Forever`. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not a fake cluster. Not Vercel. NLV stays off Pages.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Host “looks on,” user tasks frozen, RAM still powered — S0ix diagnosis, 267009 as the tell | [windows-sleep-vs-forever](windows-sleep-vs-forever.html). `STANDBYIDLE`, not this minutes row. |
| Closing the lid was the trigger | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Sleep writes a hiberfile then S3 (Allow hybrid sleep) | [hybrid-sleep-ac](hybrid-sleep-ac.html). `HYBRIDSLEEP`, not HIBERNATEIDLE. |
| You want S4 gone. Start-menu Hibernate gone. `hiberfil.sys` gone | [hibernate-off-forever](hibernate-off-forever.html). `powercfg /h off`. That pack told you to query this timeout and ignore it as the cut. |
| Start-menu Shut down restored a kernel without a real boot | [windows-fast-startup](windows-fast-startup.html) — Hiberboot |
| Panels black, dock re-enumerates, session still awake | [turn-off-display-after](turn-off-display-after.html). VIDEOIDLE. |
| A platter spun down; session still live | [hard-disk-idle-timeout](hard-disk-idle-timeout.html). DISKIDLE. |
| Lid already Do nothing. Sleep after already Never. Hybrid sleep Off. Fast Startup off. Hibernate still listed. Idle hours later: resume-from-hibernate splash, then a logon, then the 5-minute task fires late. Hibernate after is not Never | **This page.** `HIBERNATEIDLE` on AC. Timeout to S4. Not the hiberfile cut. |
| HIBERNATEIDLE already 0 on AC, or Hibernate is not listed in `powercfg /a` | This minutes knob is already honest, or S4 is already gone. Stop. Setting Never on a missing S4 is a no-op. Do not run `/h off` from this page. |

Do not `powercfg /h off` from this page. That is [hibernate-off-forever](hibernate-off-forever.html). This click leaves S4. A UPS that still Hibernate on remaining minutes needs the file. Do not set Hibernate after to Never as the first click on a new host — lid, Sleep after, and hybrid sleep are sibling rows.

## What to change (plugged-in Grok desk that still wants S4)
1. Confirm S4 is still supposed to exist — `powercfg /a` must still list Hibernate. If it does not, S4 is already gone; remaining silence is another layer. If this desk no longer wants Start-menu Hibernate or UPS S4, stop and use [hibernate-off-forever](hibernate-off-forever.html) instead. This page is the timeout, not the cut.
2. Confirm the sibling Sleep rows are already honest — lid close on AC is Do nothing if this soak will close the lid ([lid-close](lid-close-do-nothing.html)). Sleep after on AC is Never — that is `STANDBYIDLE` ([sleep-vs-forever](windows-sleep-vs-forever.html)). Allow hybrid sleep is Off on AC if that row exists ([hybrid-sleep-ac](hybrid-sleep-ac.html)). Fast Startup is off ([Fast Startup](windows-fast-startup.html)). If Sleep after is still 10–20 minutes, this Hibernate after row is not the liar yet.
3. Power Options → Change plan settings → Change advanced power settings → **Sleep** → **Hibernate after**.
4. Set **Plugged in** to **Never** (0 minutes). On battery may stay 180 minutes if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave Hibernate available. Do not run `powercfg /h off`. Do not delete `C:\hiberfil.sys`. Start-menu Hibernate must still exist after this click. Critical-battery Hibernate is a battery-subgroup action, not this timeout — leave it if a measured UPS policy uses it.
6. Leave Sleep after and Allow wake timers alone on this click. STANDBYIDLE is session sleep. Wake timers recover a logged-on session that slept. This page is idle-to-S4 so the session does not hibernate on the timer.
7. Leave the current plan in place. This is one Hibernate-after knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not install systemd on this Windows profile.
8. Confirm.

```
powercfg /a
powercfg /query SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE
powercfg /query SCHEME_CURRENT SUB_SLEEP STANDBYIDLE
powercfg /setacvalueindex SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE 0
powercfg /setactive SCHEME_CURRENT
dir C:\hiberfil.sys
```

`SUB_SLEEP` is the Sleep subgroup. `HIBERNATEIDLE` is Hibernate after. The AC index is **seconds**. **0** is Never. 10800 is 180 minutes — the usual OEM lie on a laptop Balanced plan. 3600 is 60 minutes. Apply with `/setactive` or the GUI change does not take. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Never. If powercfg also omits HIBERNATEIDLE, this firmware did not expose the knob (or S4 is already gone) — stop; do not invent a registry hack on a public page. `STANDBYIDLE` is Sleep after, not this click. `HYBRIDSLEEP` is Allow hybrid sleep, not this click. `powercfg /h off` deletes S4, not this click. VIDEOIDLE is Turn off display after, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`. NLV stays off Pages.

## Soak test
1. Lid already Do nothing on AC if this soak closes the lid. Sleep after already Never on AC. Hybrid sleep Off if the row exists. Fast Startup already off. Otherwise this soak is lying about S3 vs S4 vs Hiberboot.
2. Query HIBERNATEIDLE before the change. If it was 10800 (180 minutes), a 30-minute idle only proves Sleep after did not fire. Honest prove: set AC to 300 (five minutes), idle six minutes lid closed on the dock, confirm a resume-from-hibernate splash — that is this timer. Then set 0. Repeat six minutes idle — no S4 splash. Then leave Never. Do not leave a five-minute prove value on a forever desk.
3. `powercfg /a` still lists Hibernate. Start menu still offers Hibernate. `C:\hiberfil.sys` is still there. Missing file after this click means someone ran `/h off` — restore it with `powercfg /h on` if this desk still wants S4, then set HIBERNATEIDLE 0 again. Do not "fix" Hibernate after by deleting S4.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Last-run must advance across the soak. Ready with a frozen last-run across the previous minutes value failed this layer. A resume-from-hibernate splash after Never is a fail — S4 still fired on idle.
5. HIBERNATEIDLE still 0 on AC. If someone set 180 minutes to "save the battery" on a desk that never unplugs, restore Never. Do not "fix" it by switching the whole plan to High performance. Do not "fix" it with `/h off` unless the desk no longer wants S4.
6. Host that never hibernates on idle with HIBERNATEIDLE already 0, or with Hibernate already absent from `/a` = skip, not a red soak. Do not invent a Hibernate after registry value to make this page apply.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the minutes knob stayed Never. Grok schedulers expiring in 7 days is a different list.

## What this page is not
- Not [hibernate-off-forever.html](hibernate-off-forever.html). That pack deletes S4 with `powercfg /h off`. This pack sets the idle timeout to Never and leaves the hiberfile.
- Not [hybrid-sleep-ac.html](hybrid-sleep-ac.html). `HYBRIDSLEEP`.
- Not [windows-sleep-vs-forever.html](windows-sleep-vs-forever.html). Modern Standby / Interactive-only / 267009 diagnosis. Sleep after minutes liar is `STANDBYIDLE`.
- Not [lid-close-do-nothing.html](lid-close-do-nothing.html). Lid action.
- Not [windows-fast-startup.html](windows-fast-startup.html). Hybrid shutdown.
- Not [wake-timers-forever.html](wake-timers-forever.html). RTC recovery if sleep still happened.
- Not [turn-off-display-after.html](turn-off-display-after.html). VIDEOIDLE.
- Not a Linux systemd unit. Host-forever is Windows task `LEXXII-Materialize-Forever`.
- Not a Grok in-session scheduler. Those expire in 7 days even when durable.
- Not a fake cluster. Not Vercel.
- Not a High-performance plan essay. One Hibernate-after setting.
- Not a claim every laptop should lose Hibernate. This page keeps S4. Travel cubes on battery may keep a Hibernate after value. This desk is closed-lid, docked, AC.
- Not a UPS SKU. Brown-out hardware is [ups-windows-operator-host](../reviews/ups-windows-operator-host.html).
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
