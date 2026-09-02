# Allow wake timers vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/wake-timers-forever.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [Windows Task Scheduler forever](windows-task-forever.md). Those packs diagnose Modern Standby and create `LEXXII-Materialize-Forever`. This pack is the RTC layer: power-plan **Allow wake timers** plus Task Scheduler **Wake the computer to run this task** (`WakeToRun`) so a named hourly can recover if sleep still happened.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep-vs-forever already says a 5–20 minute sleep eats the loop. If sleep still happens, two knobs decide whether the hourly ever leaves S0ix:

1. Power Options **Allow wake timers** on the plugged-in plan — Disable, Enable, or **Important wake timers only**. Important only is not a LEXXII task.
2. Task Scheduler **Wake the computer to run this task**. Checking that box while the plan is Important only is a lie.

Wake timers do not replace a logon. They do not authorize a fourth TUI. Grok in-session schedulers are a different layer: they expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby on purpose | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| Named task missing / never-run 1999-11-30 | [windows-task-forever](windows-task-forever.md) |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |
| Sleep still happened. Next-run in the past. Last-run did not move. Task Enabled | **This page** |
| Machine woke, session gone, Interactive-only missed the hour | Logon mode. Sleep-vs-forever. |

Do not Enable wake timers as the first click on a new host. Stop the desk from sleeping first.

## What to change (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing.
2. Power Options → Change advanced power settings → Sleep → **Allow wake timers** → Plugged in = **Enable**. Not Important wake timers only.
3. If the row is hidden, unhide it. Do not invent a registry hack on a public page.
4. Task Scheduler → `LEXXII-Materialize-Forever` → Conditions → check **Wake the computer to run this task**. Repeat on Pages-Heal / Ship if those should recover too. Leave Interactive only.
5. Confirm.

```
powercfg /q SCHEME_CURRENT SUB_SLEEP
schtasks /Query /TN "LEXXII-Materialize-Forever" /FO LIST /V
powercfg /waketimers
```

Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep layer already honest on AC.
2. Allow wake timers on AC is Enable, not Important only.
3. `powercfg /waketimers` can list the named task when a next-run is due while sleep is allowed. Empty with Disable on the plan is a fail here.
4. A forced short sleep that ends at the next hourly moves Last Run Time without a human opening the lid.
5. No fourth Grok TUI.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not NIC-during-S0ix. That is [network-standby-connectivity](network-standby-connectivity.html).
- Not permission to keep 5-minute sleep because a timer exists.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
