# When playing video vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/when-playing-video.html

Companion to [When sharing media](multimedia-sharing-sleep.md) and [powercfg /requests](powercfg-requests-blockers.md). Sharing can pin SYSTEM / AWAYMODE with no player on screen. This pack is the other Multimedia row: **When playing video** (`VIDEOQUALITY`). A looping tab is cargo-cult keep-awake. It is not the named hourly.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep-vs-forever already says a 5–20 minute sleep eats the loop. Sharing-media already says Prevent / Away Mode can pin the session with nothing playing. After those rows are honest, **When playing video** is still a quality bias, not host-forever:

1. **Optimize video quality** (index 0) — decoder may hold DISPLAY while frames actually move. Expected during a real preview. Cargo-cult if you leave a 10-hour rain video looping so the desk “never sleeps.”
2. **Balanced** (index 1) — the plugged-in Grok desk.
3. **Optimize power savings** (index 2) — playback may yield to the display idle timer. Not a substitute for Sleep after Never.

Do not use a looping YouTube / PiP / minimized VLC playlist as caffeine. Close the decoder. Host-forever is the Windows task, not a player.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle / playback | Layer |
|---|---|
| 5–20 minute sleep still on AC | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Nothing playing. Sharing media is Prevent or Away Mode | [multimedia-sharing-sleep](multimedia-sharing-sleep.md) |
| No decoder. Panels black after 5–10 minutes. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.md) |
| Named PROCESS holds DISPLAY after the player is closed | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Timeouts honest. Sharing already Allow. Looping tab is the keep-awake. When playing video is Optimize video quality | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not set Optimize video quality to “keep the forever loop alive.” That holds DISPLAY while a decoder runs; it does not run the hourly.

## What to change (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing.
2. Confirm **When sharing media** is already Allow the computer to sleep. If it is still Prevent or Away Mode, stop — that is [multimedia-sharing-sleep](multimedia-sharing-sleep.md), not this page.
3. Power Options → Change advanced power settings → Multimedia settings → **When playing video** → Plugged in = **Balanced**. Not Optimize video quality as a keep-awake.
4. Stop any looping keep-awake video. A real short preview may hold DISPLAY while it plays; stop must clear it.
5. Confirm with `powercfg /requests`.

```
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEOQUALITY
powercfg /q SCHEME_CURRENT SUB_MULTIMEDIA
powercfg /requests
```

`VIDEOQUALITY` GUID is `34C7B99F-9A6D-4B3C-8DC7-B47F6AC43933`. AC index **1** is Balanced. **0** is Optimize video quality. **2** is Optimize power savings. If the alias is missing, the GUI path still applies. If powercfg omits the setting, stop — do not invent a registry hack. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep timeouts already honest on AC. Sharing media already Allow.
2. When playing video on AC is Balanced.
3. Idle session, no decoder, no looping tab. `/requests` prints None under DISPLAY.
4. A real preview may hold DISPLAY; stopping it clears it. A holder that survives stop is a leftover process — go back to requests.
5. No fourth Grok TUI.

## What this page is not
- Not [When sharing media](multimedia-sharing-sleep.html). Do not restamp that playbook as this one.
- Not the timeout playbook. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not unlocked display idle. That is [turn-off-display-after](turn-off-display-after.html).
- Not the runtime diagnostic. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not wake timers. That is [wake-timers-forever](wake-timers-forever.html).
- Not Optimize video quality as host-forever.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
