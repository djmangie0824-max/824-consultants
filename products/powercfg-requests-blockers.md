# powercfg /requests vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/powercfg-requests-blockers.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md). That pack sets timeouts. This pack is the runtime diagnostic: **DISPLAY**, **SYSTEM**, and **AWAYMODE** holders from `powercfg /requests`. If those buckets are not `None`, the plan is not the liar.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep-vs-forever already says a 5–20 minute sleep eats the loop. After timeouts are honest, a PowerRequest can still pin the session so the hourly looks dead while Task Scheduler shows Ready.

- **DISPLAY** — panel stays on (video, overlay).
- **SYSTEM** — machine will not sleep (audio stream, “execution required”, conferencing, some drivers).
- **AWAYMODE** — fake-sleep with the session still running.
- **EXECUTION** — legacy bucket via `powercfg /requests /n`.

An idle Grok TUI should not hold SYSTEM. A live video holding DISPLAY is expected. Do not start with `powercfg -requestsoverride`. Name the holder. Close it.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| 5–20 minute sleep still on AC | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| Sleep still happened, next-run in the past | [wake-timers-forever](wake-timers-forever.md) |
| When sharing media is Prevent / Away Mode | [multimedia-sharing-sleep](multimedia-sharing-sleep.md) |
| Timeouts honest. Session never idles. Last-run stale. Task Ready | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

## What to run (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing.
2. Elevated Command Prompt: `powercfg /requests` then `powercfg /requests /n`.
3. Classify PROCESS / DRIVER / SERVICE against DISPLAY vs SYSTEM vs AWAYMODE.
4. Close or reconfigure the named holder. If AWAYMODE / SYSTEM is media sharing, that is the [multimedia-sharing](multimedia-sharing-sleep.md) policy, not an override.
5. Re-run until DISPLAY and SYSTEM print None with the session idle.

```
powercfg /requests
powercfg /requests /n
powercfg /energy /duration 60
```

`/energy` is a local 60-second trace for intermittent holders. Do not publish the HTML report. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep timeouts already honest on AC.
2. Grok TUI open and idle. `powercfg /requests` prints None under DISPLAY and SYSTEM.
3. A known browser video produces a holder that clears when the tab closes.
4. No `requestsoverride` on the dock NIC, USB hub, or audio device.
5. No fourth Grok TUI.

## What this page is not
- Not the timeout playbook. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not wake timers. That is [wake-timers-forever](wake-timers-forever.html).
- Not the sharing-media policy. That is [multimedia-sharing-sleep](multimedia-sharing-sleep.html).
- Not USB / ASPM / EEE. Those are hardware power while awake.
- Not `powercfg -requestsoverride` as the first click.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
