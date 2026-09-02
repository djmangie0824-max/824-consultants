# Allow hybrid sleep vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/hybrid-sleep-ac.html

Companion to [sleep vs forever](windows-sleep-vs-forever.html) and [Fast Startup](windows-fast-startup.html). Timeouts and hybrid shutdown can already be honest and a Sleep still lies. This pack is the remaining Sleep row: **Sleep → Allow hybrid sleep**. That is `HYBRIDSLEEP`. On writes a hiberfile then S3. Wake looks like a kernel restore. Interactive-only Grok tasks miss fires. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep timeouts, lid, and Fast Startup can already be honest. The process is still alive. Balanced **Allow hybrid sleep** on AC is often On. Windows writes `hiberfil.sys` then S3. Power loss resumes from the hiberfile. A clean wake still looks like Fast Startup: user session restored without a full logon path the hourly task expected. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks sleep-vs-forever failed. Hybrid sleep mixed two states.

This is not Fast Startup. Fast Startup is hybrid *shutdown* (session closed, kernel hibernated). This is hybrid *sleep* (session stays, hiberfile plus S3).

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle / wake | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby on a 5–20 minute timeout | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Start-menu Shut down restored a kernel without a real boot | [windows-fast-startup](windows-fast-startup.html) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Sleep timeouts already Never. Fast Startup already off. A Sleep still writes hiberfil then S3. Wake looks like a hybrid restore. Hourly task missed | **This page** |
| HYBRIDSLEEP already Off; explicit Hibernate is what you clicked | Different layer. Explicit Hibernate is not this row. Do not invent a registry paste here. |
| Row missing from GUI and from `powercfg /query` | This firmware or Modern Standby edition did not expose hybrid sleep. Stop. Not a fail. |

Do not set Allow hybrid sleep Off as the first click on a new host. Do not `powercfg /hibernate off` to hide this knob.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Fast Startup is already honest. If Start-menu Shut down still hybrid-boots, that is [Fast Startup](windows-fast-startup.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Sleep** → **Allow hybrid sleep**.
4. Set **Plugged in** to **Off**. On battery may stay On if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave Hibernate available unless measured. This page does not delete `hiberfil.sys`. Do not `powercfg /hibernate off` as a shortcut. A UPS-backed Grok desk may still want explicit Hibernate.
6. Leave the current plan in place. This is one Sleep knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_SLEEP
powercfg /a
powercfg /hibernate query
```

`SUB_SLEEP` is the Sleep subgroup. `HYBRIDSLEEP` is Allow hybrid sleep. **0 = Off**, **1 = On**. Off on AC is the pass for this desk: a Sleep is S3 (or S0ix) without a mandatory hiberfile write. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Off. If powercfg also omits the alias, this firmware or Modern Standby edition did not expose the knob — stop; do not invent a registry hack on a public page. Fast Startup is hybrid shutdown, not this click. Sleep after is a timeout, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. Fast Startup already off. Otherwise this soak is lying about shutdown vs sleep.
2. `HYBRIDSLEEP` AC index is 0. Event Viewer Sleep traces do not show a hiberfile write as part of a normal Sleep. A Sleep that still dumps `hiberfil.sys` then S3 is a fail.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 after a hybrid restore is not forever.
4. Hibernate file still present if this desk wants explicit Hibernate. Missing hiberfile after this click means someone ran `/hibernate off` — restore it. Do not "fix" hybrid sleep by deleting Hibernate.
5. Missing row on a Modern Standby host = skip, not a red soak. Do not invent HYBRIDSLEEP in the registry.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof hybrid sleep is already Off.

## What this page is not
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not wake timers. That is [wake-timers-forever](wake-timers-forever.html).
- Not `powercfg /hibernate off`. That is a different, broader cut.
- Not a High-performance plan essay. One Sleep setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
