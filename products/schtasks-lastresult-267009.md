# schtasks last result 267009 vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/schtasks-lastresult-267009.html

Companion decoder to [Windows Task Scheduler forever](windows-task-forever.md), [Grok scheduler 7d](grok-scheduler-7d.md), and [isolation skip](scheduler-isolation-skip.md). Those packs create the named task, disclose the 7-day Grok cap, or refuse to mint forever IDs in an empty isolation. This pack *reads* Last Result. Decimal **267009** is HRESULT `0x41301`, `SCHED_S_TASK_RUNNING`. It is not a Win32 fail.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. A 5-minute pulse overlaps its own `schtasks /Query`. Status prints Running. Last Result prints 267009. The operator treats the column as `exit 1`, opens another `grok.exe`, and writes that the pulse is dead. The previous instance has not returned. That is the pulse working.

- **267009 / 0x41301 / SCHED_S_TASK_RUNNING** — still in flight. Success-class scheduler status.
- **0** — last completed action returned success. Status should be Ready.
- **1** — last completed action returned 1. Real fail. Read the lane log.
- **267011 / 0x41303 / SCHED_S_TASK_HAS_NOT_RUN** — never fired (often last-run 1999-11-30). Different pack: [windows-task-forever](windows-task-forever.md).

Do not paste a live `schtasks` dump with hostnames or capital figures onto GitHub Pages.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing in a session that can see them. If `scheduler_list` is empty in this isolation, skip recreate — that is [scheduler-isolation-skip](scheduler-isolation-skip.md), not 267009. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Named task missing / daily 07:15 / last-run 1999-11-30 / Last Result 267011 | [windows-task-forever](windows-task-forever.md) |
| Need the 7-day Grok cap disclosed | [grok-scheduler-7d](grok-scheduler-7d.md) |
| This isolation’s `scheduler_list` is empty. Tempted to mint new forever IDs | [scheduler-isolation-skip](scheduler-isolation-skip.md). Keep the IDs. Do not recreate. |
| Last Result 1. Status Ready. Next-run advanced | Real fail of the last cmd. Lane log. Not this decoder. |
| Status Running. Last Result 267009. Next-run still in the future. Operator wants another grok.exe | **This page**. Still-running. Do not spawn a TUI. |
| Need who yanked sleep | [lastwake](powercfg-lastwake.md) |

Do not spawn another Grok TUI because Last Result is 267009. Extra windows split the same quota.

## What to run (plugged-in Grok desk)
1. Confirm the named task exists. If Query says it does not, this decoder has nothing to decode.
2. Query, do not start: `schtasks /Query /TN "\LEXXII-Wormhole" /FO LIST /V`. Read Status, Last Result, Last Run Time, Next Run Time, Repeat: Every.
3. Classify. 267009 + Running = still in flight. 0 + Ready = last success. 1 + Ready = last action failed. 267011 = never run.
4. Count `grok.exe`, then stop. Do not open a fifth TUI. Do not install systemd. Do not `git push` from this host to heal a Last Result. Do not paste `auth.json`.

```
schtasks /Query /TN "\LEXXII-Wormhole" /FO LIST /V
schtasks /Query /TN "\LEXXII-Materialize-Forever" /FO LIST /V
:: 267009 = 0x41301 SCHED_S_TASK_RUNNING
:: 267008 = 0x41300 SCHED_S_TASK_READY
:: 267011 = 0x41303 SCHED_S_TASK_HAS_NOT_RUN
:: 0 = last completed action succeeded
:: 1 = last completed action returned 1
```

The `0x000413xx` band is Task Scheduler success status, not Win32. Convert unknown decimals before calling them fails.

## How to read the column
| Last Result | HRESULT / name | What to do |
|---|---|---|
| 267009 | `0x41301` SCHED_S_TASK_RUNNING | Still in flight. Pass. Do not spawn a TUI. Do not `/Run` a second instance if overlap is Ignore new. |
| 267008 | `0x41300` SCHED_S_TASK_READY | Armed, not executing. Wait for next-run. |
| 267011 | `0x41303` SCHED_S_TASK_HAS_NOT_RUN | Never fired. [windows-task-forever](windows-task-forever.md). |
| 267010 | `0x41302` SCHED_S_TASK_DISABLED | Enable the task. Not a Grok recreate. |
| 0 | Last action succeeded | Last completed run returned 0. Pulse is alive. |
| 1 | Last action returned 1 | Real fail. Read `logs\lane-*.log`. Do not relabel 267009. |
| 267014 | `0x41306` SCHED_S_TASK_TERMINATED | Someone stopped it. Do not stack a TUI to replace it. |

## Soak test
1. Named task exists. Repeat 5 minutes (heal/ship/compound/wormhole) or 15 minutes (UMI/BI). Batteries allowed.
2. During a fire: Status=Running and Last Result=267009. Next Run still in the future. Pass. Do not `/Run`. Do not open another TUI.
3. After a fire returns 0: Status=Ready and Last Result=0. Last Run Time moved. Pass.
4. Last Result=1 is a fail of the action, not of this decoder.
5. Last Result=267011 with last-run 1999-11-30 is a fail of the trigger pack.
6. No extra Grok TUI. Isolation-empty still skip recreate. Forever IDs kept. Keep the dump off Pages.

## What this page is not
- Not [windows-task-forever](windows-task-forever.html). That pack creates the task.
- Not [grok-scheduler-7d](grok-scheduler-7d.html). That pack discloses the 7-day cap.
- Not [scheduler-isolation-skip](scheduler-isolation-skip.html). Empty list ≠ 267009.
- Not permission to spawn a fifth `grok.exe` because Status is Running.
- Not permission to recreate Grok lanes because Last Result is 267009.
- Not a Linux systemd unit. This host is Windows.
- Not a published live `schtasks` dump on GitHub Pages.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
