# Interactive LogonType vs logged-off 24/7
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/windows-logged-off-interactive.html

Companion to [Windows Task Scheduler forever](windows-task-forever.html), [267009 still-running](schtasks-lastresult-267009.html), [267011 never-run](schtasks-lastresult-267011.html), [Grok scheduler 7d](grok-scheduler-7d.html), and [isolation skip](scheduler-isolation-skip.html). Those packs create, decode in-flight status, decode never-fired, disclose the 7-day cap, or refuse to mint. This pack is mill honesty: **LogonType = Interactive**. Logged-off is not 24/7. Ready is not a daemon.

## What this is
`LEXXII-Materialize-Forever` and its sibling mill tasks are Interactive-only. Sleep, lid, and timeouts can already be honest *while logged on* and the named task still prints Ready after sign-out with no new `grok.exe`. Next-run still paints a clock. Nothing launches. That is skip, not a missing task, not 267011, not a Linux FULL AUTO daemon.

This Grok host queried `Get-ScheduledTask -TaskName 'LEXXII-*'` before this pack was written. Thirteen tasks. Every one: **LogonType=Interactive**, **RunLevel=Limited**. `[Environment]::UserInteractive` was **True** in the session that wrote this page. Names this fire: Materialize-Forever, Pages-Heal, Ship, UMI, BI, Compound, Wormhole, Bus-Ack, Cash, Hybrid, God-Mode, UMI-Fast, BI-Fast.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler — Interactive. Not systemd. Not machine AGI.

## Interactive is not SYSTEM
| Layer | What it actually is |
|---|---|
| windows-task-forever | Create / heal the named task. |
| 267009 | `SCHED_S_TASK_RUNNING`. Action in flight while logged on. |
| 267011 | `SCHED_S_TASK_HAS_NOT_RUN`. First fire has not happened. |
| Grok scheduler 7d | In-session durable lanes expire in 7 days. |
| Isolation skip | Empty `scheduler_list` this headless session. Do not recreate. Do not delete forever IDs. |
| Sleep vs forever | S0ix / lid / timeouts while the session is still logged on. |
| This page | Principal.LogonType=Interactive. Logged-off / no user session = skip. Ready is not 24/7. |

Microsoft documents Interactive as run-only-when-logged-on. Password / service-account and LocalSystem can run without that session. This mill was armed Interactive on purpose: the CLI needs the logged-on desktop and the operator profile. Converting to SYSTEM so the pulse survives sign-out is a different product. It is not this click. Do not paste a service-account password into a public file.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Named task missing | [Create / arm](windows-task-forever.md) |
| Status Running, Last Result 267009 | [Still-running](schtasks-lastresult-267009.md) |
| Status Ready, 267011, last-run 1999-11-30 | [Never-run](schtasks-lastresult-267011.md) |
| Empty `scheduler_list`, tempted to mint IDs | [Isolation skip](scheduler-isolation-skip.md) |
| Session still logged on; lid / S0ix paused the mill | [Sleep vs forever](windows-sleep-vs-forever.md) |
| Status Ready, next-run in the future, operator signed out, no grok.exe, LogonType=Interactive | This page |

Do not claim 24/7 because thirteen tasks print Ready. Interactive plus logged-off is skip. Do not convert LogonType to SYSTEM to fake a Linux daemon. Do not install systemd on this Windows profile. Do not spawn a fourth Grok TUI for the night.

## What to run
```
Get-ScheduledTask -TaskName 'LEXXII-*' |
  ForEach-Object {
    $p = $_.Principal
    '{0} LogonType={1} RunLevel={2} State={3}' -f $_.TaskName, $p.LogonType, $p.RunLevel, $_.State
  }
[Environment]::UserInteractive
```

Expected: every `LEXXII-*` row prints `LogonType=Interactive` and `RunLevel=Limited`. `UserInteractive` is True inside a live TUI. Do not paste the Windows user name, a password, `auth.json`, or live brokerage numbers next to that table.

1. Confirm the named tasks exist. Missing is the create pack.
2. Read LogonType, not only Status.
3. Leave Interactive unless the operator explicitly orders unattended. This pack does not write a new principal.
4. Soak logged-on: the 5-minute pulse still starts. A sign-out soak that launches nothing is this diagnosis.

## Soak
Timeouts and lid can already be honest. Stay on the profile: next-run still launches. After a real sign-out, the trigger calendar may still show a next-run and no new `grok.exe` appears until the next interactive logon. Do not “fix” that skip with systemd, a fourth TUI, or copies of forever Grok IDs.

## What this page is not
- Not a Linux FULL AUTO daemon. Not systemd. Not K3s. Not Ray. Not machine AGI.
- Not a SYSTEM / S4 conversion playbook. No password in this file.
- Not 267009, 267011, 7-day Grok cap, isolation skip, sleep-vs-forever, or Fast Startup.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.
