# Multimedia timer resolution vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/multimedia-timer-resolution.html

Companion to [When sharing media](multimedia-sharing-sleep.md) and [Windows task forever](windows-task-forever.md). Sharing media is a Power Options sleep / Away Mode pin. When playing video is display quality while a file is actually playing. This pack is the kernel interrupt period: **`timeBeginPeriod` / `NtSetTimerResolution`**. A leftover 1.0 ms request starves C-states. A JS `setInterval` pretending to be the 5m pulse goes to sleep. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep-vs-forever and When sharing media can already be honest. The process is still alive. Two remaining lies:

1. **Starving** — Chrome, Edge, Discord, Spotify, OBS, a game launcher, or a Node / Electron helper called WinMM `timeBeginPeriod(1)` (or ntdll `NtSetTimerResolution`) and never released it. Default Windows period is **15.625 ms**. Current **1.000 ms** or **0.500 ms** keeps the package out of deep C-states. Fans rise. The TUI looks hung. `schtasks` still prints Ready and last result 267009 (still-running).
2. **Sleeping** — the 5m pulse was implemented as JS `setTimeout` / `setInterval` inside the TUI. Chromium background timer throttling (1 s, then ~1 min) plus coarse resolution plus coalescing. The JS loop naps. Host-forever is Task Scheduler, not a JavaScript interval.

Do not call `timeBeginPeriod(1)` to “keep the forever loop alive.” That pins C-states. It does not run the pulse.

Windows 10 2004+ made many requests process-local. Hidden Chromium GPU / utility processes, WASAPI exclusive, and some `NtSetTimerResolution` callers still move ClockRes Current. Measure. Do not cargo-cult TimerTool.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| 5–20 minute sleep still on AC | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Nothing playing. Sharing media is Prevent or Away Mode | [multimedia-sharing-sleep](multimedia-sharing-sleep.md) |
| A video is actually playing and the panel stays awake | Power Options **When playing video** — display quality, not timer period |
| Named PROCESS holds DISPLAY or SYSTEM | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Timeouts honest. Requests None. ClockRes Current is 1.000 or 0.500 ms with no player. TUI looks hung or a JS interval missed the 5m fire | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

## What to change (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. When sharing media on AC is Allow the computer to sleep.
2. Measure with Sysinternals ClockRes. Idle Current should sit near **15.625000 ms**. Current **1.000000 ms** or **0.500000 ms** with nothing playing is a requester.
3. Name it: elevated `powercfg /energy /duration 60`, then `energy-report.html` → Platform Timer Resolution / Outstanding Timer Request. Requested Period **10000** (100-ns units) is 1.000 ms. Typical leftovers: Chrome / Edge after a closed tab, Discord, Spotify, OBS, a Node helper that never `timeEndPeriod`.
4. Close the leftover. Do not install TimerTool. Do not `bcdedit /set disabledynamictick`. Do not paste a registry timer tweak. HPET in firmware is a different clock.
5. Keep the 5m pulse on Task Scheduler (`LEXXII-Materialize-Forever` / Pages-Heal / Ship / Compound). An idle Grok TUI should not hold 1.0 ms. A streaming reply may hold 1.0 ms while tokens paint; that should drop when the turn ends.
6. Confirm. ClockRes Current returns toward 15.625 ms with no player and no live grok turn.

```
clockres
powercfg /energy /duration 60
powercfg /requests
```

`/energy` writes `energy-report.html` in the working directory — local, not a Pages artifact. Empty `/requests` with Current still at 1.000 ms is this page, not a sleep holder. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep timeouts already honest on AC. When sharing media is Allow.
2. Idle session, no player, no live grok turn. ClockRes Current near 15.625 ms, not 1.000 or 0.500.
3. `/energy` does not list a leftover Outstanding Timer Request from an app that should have exited.
4. A real stream or grok turn may move Current to 1.0 ms; ending it returns Current. A Current that survives quit-the-app is a leftover process.
5. The 5m fire is still a named Windows task, not a JS interval. No fourth Grok TUI.

## What this page is not
- Not When sharing media. That is [multimedia-sharing-sleep](multimedia-sharing-sleep.html).
- Not When playing video. That is a Power Options display-quality row, not `timeBeginPeriod`.
- Not the runtime DISPLAY / SYSTEM diagnostic. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not the host pulse. That is [windows-task-forever](windows-task-forever.html).
- Not TimerTool, 0.5 ms global hacks, or `bcdedit` dynamic-tick cargo-cult.
- Not HPET vs TSC firmware trivia.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
31consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
