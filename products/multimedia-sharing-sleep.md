# When sharing media vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/multimedia-sharing-sleep.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [powercfg /requests](powercfg-requests-blockers.md). Those packs set timeouts and read live holders. This pack is the Power Options policy that can create a SYSTEM / AWAYMODE holder with no player on screen: **Multimedia settings → When sharing media**.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep-vs-forever already says a 5–20 minute sleep eats the loop. After timeouts are honest, **When sharing media** can still pin the session:

1. **Allow the computer to sleep** — the plugged-in Grok desk.
2. **Prevent the computer from sleeping** — silent SYSTEM pin while Windows thinks media is shared (WMP sharing, nearby leftovers, Cast / DLNA, some OEM Smart Share).
3. **Allow the computer to enter Away Mode** — fake-sleep. Fans, NIC, and session stay up. Not host-forever. Not a lid policy.

**When playing video** is display quality while a video is actually playing. It is not permission to leave sharing on Prevent.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| 5–20 minute sleep still on AC | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Named PROCESS/DRIVER holds DISPLAY or SYSTEM | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Sleep still happened, next-run in the past | [wake-timers-forever](wake-timers-forever.md) |
| Timeouts honest. Nothing playing. Sharing media is Prevent or Away Mode | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not set Prevent to “keep the forever loop alive.” That pins sleep; it does not run the hourly.

## What to change (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing.
2. Power Options → Change advanced power settings → Multimedia settings → **When sharing media** → Plugged in = **Allow the computer to sleep**. Not Prevent. Not Away Mode.
3. Leave **When playing video** as a quality choice. It should not hold SYSTEM with no video.
4. If the subgroup is hidden, unhide it. Do not invent a registry hack on a public page.
5. Confirm with `powercfg /requests`.

```
powercfg /q SCHEME_CURRENT SUB_MULTIMEDIA
powercfg /requests
```

Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep timeouts already honest on AC.
2. When sharing media on AC is Allow the computer to sleep.
3. Idle session, no player, no Cast. `/requests` prints None under SYSTEM and AWAYMODE.
4. A real share may hold SYSTEM; stopping the share clears it. A holder that survives stop-share is a vendor helper — go back to requests.
5. No fourth Grok TUI.

## What this page is not
- Not the timeout playbook. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not the runtime diagnostic. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not wake timers. That is [wake-timers-forever](wake-timers-forever.html).
- Not lid-close. Away Mode is not a lid policy.
- Not Away Mode as host-forever.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
