# Windows sleep vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/windows-sleep-vs-forever.html

Companion to [Windows Task Scheduler forever loop](windows-task-forever.md). That pack creates the named hourly task. This pack is why a correctly named task still looks dead.

## What this is
Host-forever on this class of machine is Windows Task Scheduler, not Linux systemd. Creating `LEXXII-Materialize-Forever` is necessary and not sufficient. Sleep, Modern Standby, Interactive-only logon, battery saver, and a 2-hour stop limit will make an hourly task look like it never existed.

Grok in-session schedulers are a different layer: they expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## Failure modes that fake a dead loop
| Symptom | What it actually is |
|---|---|
| Last run `1999-11-30` | Windows never-run sentinel. Task has not fired since create. |
| Last result `267009` | Task is **still running**. Overlap policy should ignore a new instance, not stack a 4th TUI. |
| Last result `267011` | Ready / last-run recorded, not a mysterious cluster error. |
| Status Ready, never hourly | Trigger is daily with **no** 60-minute repeat. |
| Status Ready, plugged-in only | `DisallowStartIfOnBatteries` still true. Laptops that leave the desk die. |
| Status Ready, lid closed | Modern Standby (S0) paused user tasks. The host “looks on.” It is not looping. |
| Missed hourly while logged out | Logon mode **Interactive only**. Task will not run at the lock screen / other user. |
| Hourly start then silence | `StopIfGoingOnBatteries` or “Stop task if runs longer than 2 hours” killed the Grok process. |

## Heal order (Windows, not systemd)
1. Query the three named tasks: `LEXXII-Materialize-Forever`, `LEXXII-Pages-Heal`, `LEXXII-Ship`.
2. Confirm **Enabled**, hourly or PT30M / PT2H repeat, batteries **allowed**, start-when-available **on**, new-instance **ignore**.
3. Settings → System → Power: sleep / hibernate after long idle must not be 5–20 minutes on an operator desk. Connected standby that freezes Task Scheduler is a host bug, not a Grok bug.
4. Do not spawn another TUI because last result is `267009`. That code means the current run is still alive.
5. Recreate the Grok durable hourly scheduler if it vanished. Honest label: it will need another recreate after 7 days.

Query (operator, local):

```
powercfg /a
schtasks /Query /TN "LEXXII-Materialize-Forever" /FO LIST /V
```

`powercfg /a` tells you whether S0 connected standby is the sleep that is eating the loop. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## What this page is not
- Not a UPS review. Wall-side brown-outs are [UPS for a Windows operator host](../reviews/ups-windows-operator-host.html).
- Not a create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
