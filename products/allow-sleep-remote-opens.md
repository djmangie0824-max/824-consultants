# Allow sleep with remote opens vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/allow-sleep-remote-opens.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md). Distinct from [Network connectivity in Standby](network-standby-connectivity.md) and [Allow wake timers](wake-timers-forever.md). Those packs set idle timeouts, keep the NIC during S0ix, and arm an RTC if sleep still happened. This pack is the remaining Sleep-subgroup leaf: Power Options → Sleep → **Allow sleep with remote opens**. A mapped NAS or an open SMB handle is not a forever loop.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep-vs-forever already says a 5–20 minute sleep eats the loop. After timeouts are honest, this leaf still lies in two directions:

1. **On** — Windows may sleep even if remote files are open. Balanced often ships On. A mapped NAS, Git-on-SMB, or a phone browsing `\\host` does not block S0ix. Task Scheduler still shows Ready.
2. **Off** — an open remote file can prevent sleep. That is a silent SYSTEM pin while SMB thinks a handle exists, and a lie the moment the handle drops (idle-disconnect, phone lock, NAS sleep, mapped-drive reconnect).

Do not set Off to “keep the forever loop alive.” That pins sleep; it does not run the hourly. This desk is not a file server. A mapped drive is storage.

This leaf is not [When sharing media](multimedia-sharing-sleep.html). That row is Cast / DLNA / WMP under `SUB_MULTIMEDIA`. This row is SMB / CIFS remote-file opens under `SUB_SLEEP`.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not systemd.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| 5–20 minute sleep still on AC | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Sleep happened, hourly never recovered | [wake-timers-forever](wake-timers-forever.md) |
| NIC dies only after S0ix | [network-standby-connectivity](network-standby-connectivity.md) |
| Nothing playing; sharing media is Prevent or Away Mode | [multimedia-sharing-sleep](multimedia-sharing-sleep.md) |
| Named PROCESS/DRIVER holds SYSTEM | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Timeouts honest. Mapped NAS / Git-on-SMB / `\\host` used as stay-awake. Remote-opens is Off — or On and they thought the handle would block sleep | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not set Off as a heartbeat. Do not copy Off onto battery to paper over an unplugged desk.

## What to change (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. If the desk still *intends* to sleep every idle, stop here.
2. Power Options → Change advanced power settings → Sleep → **Allow sleep with remote opens** → Plugged in = **On**. Not Off. Battery can stay Off; this desk is AC + UPS.
3. If the row is hidden, unhide it. Do not invent a registry hack on a public page.
4. Stop using the share as a heartbeat. A mapped NAS for artifacts is fine. A leftover `\\host` session from a phone is not host-forever.
5. Confirm.

```
powercfg /q SCHEME_CURRENT SUB_SLEEP
powercfg /requests
net session
```

`SUB_SLEEP` lists Allow sleep with remote opens. On for AC is the pass. `/requests` should not show a SYSTEM pin that only exists because Off is holding an SMB handle. `net session` lists who still has a share open. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep timeouts already honest on AC.
2. Allow sleep with remote opens on AC is On, not Off.
3. `net session` is empty, or remaining sessions are real work, not a phone left on `\\host` as a heartbeat.
4. Idle Grok TUI. `/requests` does not show a SYSTEM holder that vanishes when this row is On. A holder that survives On is a PROCESS/DRIVER — go back to [requests](powercfg-requests-blockers.html).
5. No fourth Grok TUI.

## What this page is not
- Not the timeout playbook. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not NIC-during-S0ix. That is [network-standby-connectivity](network-standby-connectivity.html).
- Not wake timers. That is [wake-timers-forever](wake-timers-forever.html).
- Not When sharing media. That is [multimedia-sharing-sleep](multimedia-sharing-sleep.html).
- Not the runtime diagnostic. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not permission to keep 5-minute sleep because a share is open.
- Not a NAS or SMB product review.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
