# Windows Hibernate Off vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/hibernate-off-forever.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.html), [Lid close Do nothing](lid-close-do-nothing.html), and [Windows Fast Startup](windows-fast-startup.html). Those packs diagnose Modern Standby (S0ix), the lid action, and hybrid shutdown (Hiberboot). This pack is ACPI **S4 Hibernate**: RAM written to `hiberfil.sys`, machine actually off. On a closed-lid docked Grok desk the next hourly looks dead. The cut is `powercfg /h off`.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing on AC. Sleep after can already be Never. Fast Startup can already be off. Hibernate still sits under those layers. `HIBERNATEIDLE` is a separate Sleep-subgroup timeout from `STANDBYIDLE`. Start-menu Hibernate is a separate verb from Shut down. Either one writes the session to disk and kills the user context the named task needs. Task Scheduler still shows Ready. Next-run is in the future. No hourly fire happens until someone resumes from S4 and signs in.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Do not invent a cluster.

## S4 vs the layers this page is not
| What happened | Layer |
|---|---|
| Host “looks on,” user tasks frozen, RAM still powered | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) — S0 / Modern Standby |
| Closing the lid was the trigger | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Start-menu Shut down restored a kernel without a real boot | [windows-fast-startup](windows-fast-startup.html) — Hiberboot |
| A platter or USB disk spun down; session still live | Disk idle timeout. Sibling pack. Not this click. |
| Sleep writes a hiberfile then S3 (Allow hybrid sleep) | [hybrid-sleep-ac](hybrid-sleep-ac.html). Hybrid *sleep*, not S4. Do not use `/h off` to hide that knob. |
| Lid already Do nothing. Sleep already not 5–20 minutes. Fast Startup already off. Hibernate still listed. Closed-lid docked hour missed. Resume splash, then a logon, then the hourly fires late | **This page.** ACPI S4. `powercfg /h off`. |

Do not `powercfg /h off` as the first click on a new host. That also kills Fast Startup, because Hiberboot needs the same hiberfile. Uncheck Fast Startup first. Confirm `HiberbootEnabled` is `0`. Then this page deletes S4. A UPS that was supposed to Hibernate on remaining minutes cannot after this cut — size runtime on the [UPS review](../reviews/ups-windows-operator-host.html) instead of keeping S4 for an Interactive-only loop.

## What to change (closed-lid docked Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is off. See [sleep-vs-forever](windows-sleep-vs-forever.html), [lid-close](lid-close-do-nothing.html), and [Fast Startup](windows-fast-startup.html). If the desk still *intends* to Hibernate on idle or on a UPS drain you actually measured, stop here.
2. Query before you cut — `powercfg /a` must still list Hibernate. If it does not, S4 is already gone; remaining silence is another layer. Query `HIBERNATEIDLE` so you see the independent timeout, then ignore it as the fix. Setting Hibernate after to Never still leaves S4, Start-menu Hibernate, and the hiberfile.
3. Elevated Command Prompt or PowerShell — `powercfg /h off`. Long form `powercfg /hibernate off` is the same cut. This deletes `C:\\hiberfil.sys` and removes S4. It is not a Sleep timeout. It is not a lid action.
4. Leave the current plan in place. This is one firmware sleep state, not a switch to High performance. Do not rename the plan. Do not invent a fleet GPO. Do not install systemd on this Windows profile.
5. Confirm.

```
powercfg /a
powercfg /query SCHEME_CURRENT SUB_SLEEP HIBERNATEIDLE
powercfg /h
powercfg /h off
dir C:\\hiberfil.sys
```

`powercfg /a` lists sleep states this firmware actually offers. Hibernate present after lid and Fast Startup are honest is this page. `HIBERNATEIDLE` in seconds is the independent idle-to-S4 timeout — 0 is Never, not the same as S4 gone. `powercfg /h` with no argument reports Hibernate file size / status. After `/h off`, `dir C:\\hiberfil.sys` should fail. If Hibernate is still named in `/a`, the command did not stick (needs elevation, or a policy we do not run). Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Fast Startup already off. Lid already Do nothing on AC. Sleep after already not 5–20 minutes. Otherwise this soak is lying about which state killed the hour.
2. `powercfg /a` does not list Hibernate. Start menu has no Hibernate. `C:\\hiberfil.sys` is gone.
3. Plugged in. Lid closed on the dock for sixty minutes. `LEXXII-Materialize-Forever` last-run must advance. A Ready task whose last-run is frozen across that hour failed this layer. A resume-from-hibernate splash on lid-open is a fail — S4 still fired.
4. Do not spawn a fourth Grok TUI because last result is `267009`. That code is still-running, not proof S4 stayed off.
5. If this host later needs Hibernate for a measured UPS drain policy, `powercfg /h on` restores the file. That is a conscious rollback, not a default. Do not leave S4 “just in case” on this class of Interactive-only desk.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Fast Startup / Hiberboot. That is [windows-fast-startup](windows-fast-startup.html).
- Not disk idle timeout. DISKIDLE is a sibling pack this page does not ship.
- Not Allow hybrid sleep. That is [hybrid-sleep-ac](hybrid-sleep-ac.html). Hybrid sleep is S3 plus a hiberfile write. This page deletes S4.
- Not a claim every laptop should lose Hibernate. Travel cubes on battery may keep S4. This desk is closed-lid, docked, AC.
- Not a UPS SKU. Brown-out hardware is [ups-windows-operator-host](../reviews/ups-windows-operator-host.html).
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
