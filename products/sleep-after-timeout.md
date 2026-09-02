# Sleep after vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/sleep-after-timeout.html

Companion attended minutes knob to [Windows sleep vs a forever loop](windows-sleep-vs-forever.html). That pack is the diagnosis: Modern Standby, Interactive-only logon, result 267009 still-running. It told you 5–20 minute sleep eats the loop. This pack *is* that timeout: Power Options → Sleep → **Sleep after**. That is `STANDBYIDLE` (GUID `29f6c1ee-7b59-4e01-8a3d-97d2b4a0a8e0`). Distinct from [System unattended sleep timeout](unattended-sleep-timeout.html) (`UNATTENDSLEEP` re-nap after a wake) and from [Hibernate after idle](hibernate-after-idle.html) (`HIBERNATEIDLE` to S4). Sibling playbooks already link here; a missing file 404s as the custom deny wall — not a vault.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing on AC. Sleep button and power button can already be Do nothing. Hibernate can already be off, or Hibernate after can already be Never. Allow wake timers can already be Enable. Balanced **Sleep after** on AC is still often 10, 15, or 20 minutes. Windows counts `STANDBYIDLE` in seconds. 600 is ten minutes. 1200 is twenty. The signed-in session goes to S3, or to S0ix on a Modern Standby SKU. Task Scheduler still shows Ready. Next-run sits in the future. No 5-minute fire happens until someone wakes the box and the Interactive session is actually there.

This is not the diagnosis essay. This is not `UNATTENDSLEEP`. This is not `HIBERNATEIDLE`. `powercfg /change standby-timeout-ac` speaks **minutes**. `/setacvalueindex … STANDBYIDLE` speaks **seconds**. 0 is Never in both. Mixing the units is a common operator lie.

Host-forever is Windows task `LEXXII-Materialize-Forever`. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not a fake cluster. Not Vercel. NLV stays off Pages.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Host “looks on,” user tasks frozen, RAM still powered — S0ix diagnosis, 267009 as the tell, Sleep after already Never | [windows-sleep-vs-forever](windows-sleep-vs-forever.html). This minutes knob is already honest. |
| Closing the lid was the trigger | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Fn+moon, keyboard Sleep, or chassis Sleep button | [sleep-button-action](sleep-button-action.html) |
| Chassis power button | [power-button-action-ac](power-button-action-ac.html) |
| Sleep writes a hiberfile then S3 (Allow hybrid sleep) | [hybrid-sleep-ac](hybrid-sleep-ac.html). `HYBRIDSLEEP`, not STANDBYIDLE. |
| Idle hours later: resume-from-hibernate splash. Hibernate after is not Never | [hibernate-after-idle](hibernate-after-idle.html). `HIBERNATEIDLE` to S4. |
| You want S4 gone. Start-menu Hibernate gone. `hiberfil.sys` gone | [hibernate-off-forever](hibernate-off-forever.html). `powercfg /h off`. |
| Sleep after already Never. Box wakes for the named task, then sleeps again in about two minutes with nobody at the keyboard | [unattended-sleep-timeout](unattended-sleep-timeout.html). `UNATTENDSLEEP`. That pack said this click first. |
| Panels black, dock re-enumerates, session still awake | [turn-off-display-after](turn-off-display-after.html). VIDEOIDLE. |
| Attended idle 10–20 minutes. No lid. No Sleep key. No power button. Session gone to S3 or S0ix. Sleep after is not Never | **This page.** `STANDBYIDLE` on AC. Attended idle timeout. |
| STANDBYIDLE already 0 on AC | This minutes knob is already honest. Stop. Remaining silence is another layer. Do not invent a Sleep after registry value. |

Do not set Sleep after to Never as a substitute for lid-close Do nothing. A closed lid is still a Sleep key until that sibling is honest. Do not mix `/change standby-timeout-ac` (minutes) with `/setacvalueindex … STANDBYIDLE` (seconds). Query after you write.

## What to change (plugged-in Grok desk)
1. Confirm the hardware Sleep keys are not this click — lid close on AC is Do nothing if this soak will close the lid ([lid-close](lid-close-do-nothing.html)). Sleep button on AC is Do nothing if a Fn+moon or keyboard Sleep key exists ([sleep-button](sleep-button-action.html)). Power button on AC is Do nothing if a chassis press is in the well ([power-button](power-button-action-ac.html)). If a key still Sleeps, this minutes row is not the liar yet.
2. Power Options → Change plan settings → Change advanced power settings → **Sleep** → **Sleep after**.
3. Set **Plugged in** to **Never** (0 minutes). On battery may stay 10–20 minutes if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
4. Leave System unattended sleep timeout alone on this click. That is `UNATTENDSLEEP`. After this page is Never, the [unattended pack](unattended-sleep-timeout.html) is the next hidden row.
5. Leave Hibernate after and `/h off` alone on this click. `HIBERNATEIDLE` is idle-to-S4. `powercfg /h off` deletes S4. Sleep after Never still loses the session if Hibernate after is 180 minutes.
6. Leave Allow hybrid sleep and Allow wake timers alone on this click. Hybrid sleep is a hiberfile then S3. Wake timers recover a logged-on session that slept. This page tries not to sleep on attended idle.
7. Leave the current plan in place. This is one Sleep-after knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Do not install systemd on this Windows profile.
8. Confirm.

```
powercfg /a
powercfg /query SCHEME_CURRENT SUB_SLEEP STANDBYIDLE
powercfg /query SCHEME_CURRENT 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1ee-7b59-4e01-8a3d-97d2b4a0a8e0
powercfg /setacvalueindex SCHEME_CURRENT SUB_SLEEP STANDBYIDLE 0
powercfg /setactive SCHEME_CURRENT
powercfg /query SCHEME_CURRENT SUB_SLEEP STANDBYIDLE
```

`SUB_SLEEP` is the Sleep subgroup. `STANDBYIDLE` is Sleep after. The setting GUID is `29f6c1ee-7b59-4e01-8a3d-97d2b4a0a8e0`. The AC index is **seconds** on `/query` and `/setacvalueindex`. **0** is Never. 600 is 10 minutes. 900 is 15. 1200 is 20 — usual OEM lies on a laptop Balanced plan. `powercfg /change standby-timeout-ac` is the minutes helper: 0 is Never, 20 is twenty minutes, not twenty seconds. Apply with `/setactive` or the GUI change does not take. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Never. Sleep after is almost never ATTRIB_HIDE; if it is missing, this edition did not expose it. Stop; do not invent a registry hack on a public page. `UNATTENDSLEEP` is System unattended sleep timeout, not this click. `HIBERNATEIDLE` is Hibernate after, not this click. `HYBRIDSLEEP` is Allow hybrid sleep, not this click. VIDEOIDLE is Turn off display after, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`. NLV stays off Pages.

## Soak test
1. Lid already Do nothing on AC if this soak closes the lid. Sleep button and power button already Do nothing if those keys exist. Otherwise this soak is lying about a key vs a timeout.
2. Query STANDBYIDLE before the change. If it was 600 / 900 / 1200, a 3-minute idle only proves nothing fired yet. Honest prove: set AC to 120 (two minutes via `/setacvalueindex`, not via `/change 120` — that would be two hours), idle three minutes with the session attended and the lid open, confirm sleep. Then set 0. Repeat three minutes idle — session stays signed in. Then leave Never. Do not leave a two-minute prove value on a forever desk.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Last-run must advance across the soak. Ready with a frozen last-run across the previous minutes value failed this layer. A sleep after Never is a fail — STANDBYIDLE still fired on attended idle, or a sibling key/lid/unattended row is the liar.
4. STANDBYIDLE still 0 on AC. If someone set 20 minutes to "save the battery" on a desk that never unplugs, restore Never. Do not "fix" it by switching the whole plan to High performance. Do not "fix" it with `/h off`.
5. Host that never sleeps on attended idle with STANDBYIDLE already 0 = skip, not a red soak. Remaining S0ix freeze with this row already Never is [windows-sleep-vs-forever](windows-sleep-vs-forever.html), not a second paste of 0.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the minutes knob stayed Never. Grok schedulers expiring in 7 days is a different list.

## What this page is not
- Not [windows-sleep-vs-forever.html](windows-sleep-vs-forever.html). Modern Standby / Interactive-only / 267009 diagnosis. This pack is the minutes knob that diagnosis pointed at.
- Not [unattended-sleep-timeout.html](unattended-sleep-timeout.html). `UNATTENDSLEEP` after a wake. It already links here as the first click.
- Not [hibernate-after-idle.html](hibernate-after-idle.html). `HIBERNATEIDLE`.
- Not [hibernate-off-forever.html](hibernate-off-forever.html). `powercfg /h off`.
- Not [hybrid-sleep-ac.html](hybrid-sleep-ac.html). `HYBRIDSLEEP`.
- Not [lid-close-do-nothing.html](lid-close-do-nothing.html). Lid action.
- Not [sleep-button-action.html](sleep-button-action.html). Sleep key.
- Not [power-button-action-ac.html](power-button-action-ac.html). Chassis power button.
- Not [connected-standby-csenabled.html](connected-standby-csenabled.html). Modern Standby registry bit.
- Not [wake-timers-forever.html](wake-timers-forever.html). RTC recovery if sleep still happened.
- Not [turn-off-display-after.html](turn-off-display-after.html). VIDEOIDLE.
- Not a Linux systemd unit. Host-forever is Windows task `LEXXII-Materialize-Forever`.
- Not a Grok in-session scheduler. Those expire in 7 days even when durable.
- Not a fake cluster. Not Vercel.
- Not a High-performance plan essay. One Sleep-after setting.
- Not a claim every laptop should Never-sleep on battery. Travel cubes on DC may keep 10–20 minutes. This desk is closed-lid, docked, AC.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
