# Allow Away Mode vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/away-mode-policy.html

Companion to [When sharing media](multimedia-sharing-sleep.md) and [powercfg /requests](powercfg-requests-blockers.md). Sharing is the Multimedia row that can *ask* for fake-sleep. Requests names who is holding the AWAYMODE bucket *right now*. This pack is the Sleep permission: **Sleep → Allow Away Mode**. That is `AWAYMODE` under `SUB_SLEEP`. On lets a Sleep verb become media-center fake-sleep. Interactive-only Grok tasks look dead. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep timeouts, lid, hybrid sleep, and sharing-media can already be honest. The process is still alive. Balanced and OEM “entertainment” plans still ship **Allow Away Mode** On. Windows then treats Away Mode as an available sleep state. Display goes dark. Fans, NIC, and the user session stay up. `powercfg /a` lists Away Mode. The operator hunts wake timers for a sleep that never happened. `schtasks` still prints Ready and last result 267009 (still-running). Fake-sleep is not host-forever.

This is not the sharing-media value. Sharing has three answers (Allow sleep / Prevent / enter Away Mode). That row is [multimedia-sharing-sleep](multimedia-sharing-sleep.md). This page is whether the Sleep subgroup *allows* the fake-sleep state at all. A share request cannot enter Away Mode if this policy is Off.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| 5–20 minute sleep still on AC | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| When sharing media is Prevent or “enter Away Mode” | [multimedia-sharing-sleep](multimedia-sharing-sleep.md) |
| Named PROCESS/DRIVER holds DISPLAY, SYSTEM, or AWAYMODE | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Sleep still writes hiberfil then S3 | [hybrid-sleep-ac](hybrid-sleep-ac.md) |
| Sleep still happened, next-run in the past | [wake-timers-forever](wake-timers-forever.md) |
| Sharing already Allow sleep. Timeouts honest. `AWAYMODE` AC index is On. `/a` lists Away Mode. Panel dark, fans up, session still running, hourly looks dead | **This page** |
| Row missing from GUI and from `powercfg /query` | This firmware or Modern Standby edition did not expose Allow Away Mode. Stop. Not a fail. |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not set Allow Away Mode On to “keep the forever loop alive.” That is fake-sleep. It does not run the hourly. Do not use Away Mode as a lid-close substitute.

## What to change (plugged-in Grok desk)
1. Confirm plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html).
2. Confirm When sharing media on AC is already Allow the computer to sleep, not Prevent, not enter Away Mode. If that row is still the liar, that is [multimedia-sharing-sleep](multimedia-sharing-sleep.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Sleep** → **Allow Away Mode**.
4. Set **Plugged in** to **Off**. On battery may stay On if this chassis is actually a media PC that travels. A Grok desk that never unplugs should not pretend it is a living-room recorder.
5. Leave Sleep after, hybrid sleep, and Hibernate as their own pages. This click is one Sleep permission, not `/hibernate off`.
6. Leave the current plan in place. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_SLEEP AWAYMODE
powercfg /a
powercfg /requests
```

`SUB_SLEEP` is the Sleep subgroup. `AWAYMODE` is Allow Away Mode. **0 = Off**, **1 = On**. Off on AC is the pass for this desk: Away Mode is not an available sleep state. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Off. If powercfg also omits the alias, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. `/requests` AWAYMODE = None while idle is expected after Off; a leftover named holder is [requests](powercfg-requests-blockers.md), not this row. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. Sharing media already Allow sleep. Otherwise this soak is lying about which layer faked sleep.
2. `AWAYMODE` AC index is 0. `powercfg /a` does not list Away Mode as available (policy, not firmware, is the tell when the alias exists).
3. Idle session, no player, no Cast. `/requests` prints None under AWAYMODE.
4. Display-off from [turn-off-display-after](turn-off-display-after.html) is VIDEOIDLE. Fans and session stay up *and* `/a` still lists Away Mode = this page is not done.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 after fake-sleep is not forever.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof Allow Away Mode is already Off.

## What this page is not
- Not When sharing media. That is [multimedia-sharing-sleep](multimedia-sharing-sleep.html).
- Not the runtime diagnostic. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not hybrid sleep. That is [hybrid-sleep-ac](hybrid-sleep-ac.html).
- Not lid-close. Away Mode is not a lid policy.
- Not Away Mode as host-forever.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
