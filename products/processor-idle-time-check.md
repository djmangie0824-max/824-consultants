# Processor idle time check vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-idle-time-check.html

Companion to [Processor idle disable](processor-idle-disable.html) and [idle promote / demote thresholds](processor-idle-promote-threshold.html). Disable is the allow/deny. Promote/demote are percent hysteresis. This pack is the **sample window**: **Processor power management → Processor idle time check**. Alias `IDLECHECK`. GUID `c4581c31-89ab-4597-8e2b-9c9cab440e6b`. Units are **microseconds**, not percent, not a C-state index.

## What this is
On this Yoga the measured idle-disable row is still **Enable idle** (index 0) on AC and DC. That is honest heat: Disable idle keeps the package in C0. Enable idle remains. The promote/demote pair is still Balanced **60% / 40%** until that sibling pack runs. The idle engine still has to *sample* idle residency over a window before it can promote or demote. That window is `IDLECHECK`. This host printed `0x0000c350` = **50000 µs = 50 ms** on AC and DC. Scheme `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e`.

An Interactive Grok CLI is bursty: a paint, a wait, a JSON tool, a wait. A tool call shorter than the sample window still looks idle. The engine does not demote out of C6 until the next check. `grok.exe` is alive. Task Scheduler still prints Ready and last result 267009. The first token after a quiet gap pays a C-state wake that a 50 ms window did not see in time.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## Live query on this host (2026-09-01)
| Field | This desk |
|---|---|
| Scheme | `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e` |
| Subgroup | `SUB_PROCESSOR` `54533251-82be-4824-96c1-47b60b740d00` |
| Setting GUID | `c4581c31-89ab-4597-8e2b-9c9cab440e6b` alias `IDLECHECK` |
| Units | Microseconds. Min 1. Max `0x00030d40` = 200000 µs = 200 ms. Increment 1. |
| AC / DC | `0x0000c350` = 50000 µs = 50 ms |
| Sibling `IDLEDISABLE` | AC 0 / DC 0 Enable idle — this page still applies |
| Sibling `IDLEPROMOTE` / `IDLEDEMOTE` | AC/DC 60% / 40%. Percent pair. Different pack. |
| Sibling `IDLESTATEMAX` | AC 0 / DC 0 (no depth cap). Different pack. |
| Sibling `IDLESCALING` | Disable scaling (0). Different pack. |

`powercfg /qh` printed this row on this SKU. Hidden in the GUI is not missing. Do not cargo-cult `-ATTRIB_HIDE` on a public page.

## The window is not the percent
| Layer | What it actually is |
|---|---|
| Processor idle disable | Allow/deny. `IDLEDISABLE`. 0 = Enable idle. 1 = Disable idle (stay C0). Heat. |
| Processor idle promote / demote | Percent hysteresis. `IDLEPROMOTE` / `IDLEDEMOTE`. How idle the *window* must be. |
| Processor idle time check | Window length. `IDLECHECK`. Microseconds. This page. |
| Processor idle state maximum | Depth cap. `IDLESTATEMAX`. 0 = no cap. Not this click. |
| Processor idle threshold scaling | Whether the engine rescales the pair. `IDLESCALING`. Not this click. |

A 100 / 80 promote/demote pair sampled every 50 ms still waits up to one window before a burst counts as busy. A 60 / 40 pair sampled every 10 ms still walks deep C on a quiet TUI, but it *sees* the next tool call sooner. Do both siblings.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| IDLEDISABLE already 1 on AC (Disable idle) | Window unused. [processor-idle-disable](processor-idle-disable.html) already took the heat. |
| Promote / demote still 60 / 40 and the quiet TUI sits in C6 | [processor-idle-promote-threshold](processor-idle-promote-threshold.html) |
| IDLESTATEMAX still 0 and package C6/C7 still legal | [processor-idle-state-maximum](processor-idle-state-maximum.html) |
| IDLESCALING Enabled and a 100/80 walk undoes itself | [processor-idle-threshold-scaling](processor-idle-threshold-scaling.html) |
| Timer resolution / JS timer coalescing | [multimedia-timer-resolution](multimedia-timer-resolution.html) / [javascript-timer-frequency](javascript-timer-frequency.html). Wrong page. |
| Enable idle still 0. Promote/demote already named. Session awake. Named task Ready / 267009. First token after a quiet gap hitch-pauses. `IDLECHECK` still 50000 µs | **This page.** The sample window. |

Do not set Processor idle time check as the first click on a new host. Do not write 1 µs. Do not write 200000 µs to “save watts” on a forever desk. Leave DC at 50000 if the laptop actually travels. If `/qh` omits the GUID, stop; do not invent a registry paste.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest.
2. Confirm IDLEDISABLE is still Enable idle (0). If it is already Disable idle (1), this window is unused.
3. Query `IDLECHECK` with `/qh` before you write. This host printed 50000 µs. If `/qh` omits the GUID, **stop**.
4. Set Plugged in to **10000** microseconds (10 ms). On battery stays 50000 if this laptop actually travels.
5. Do not start at 1 µs. Legal minimum is 1. That is max evaluation rate. 10 ms is the pass. 50 ms on AC is a fail once the percent pair is already honest.
6. Leave promote, demote, state maximum, and scaling as siblings. This click does not write 100/80.
7. Activate the scheme after the AC index write. Query again. AC `0x00002710` = 10000 is the pass. `0x0000c350` is still 50 ms.
8. Leave the Balanced (or current) plan in place. One processor knob. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLECHECK
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLECHECK 10000
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLECHECK
```

## Soak test
1. Timeouts already honest. Enable idle still 0 if that is the heat choice. Promote/demote already named if that pack ran. Stand in the path.
2. Idle 30 minutes, lid closed, cooling stand in place. Fire a 5-minute named task. First token after the quiet gap is not a hitch a 50 ms window would have classified as still-idle.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with IDLECHECK 50000 is not proof the window is already 10 ms.
4. IDLECHECK still 10000 on AC. Do not write 1 µs as a cargo-cult. Do not switch the whole plan to High performance.
5. No fourth Grok TUI. Isolation-empty `scheduler_list` is skip recreate. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not a Linux FULL AUTO daemon on this Windows profile. Not systemd.
- Not Processor idle disable, not promote/demote percents, not idle state maximum, not idle threshold scaling.
- Not JavaScript timer frequency and not multimedia timer resolution.
- Not `DISKIDLE` and not Modern Standby.
- Not a High-performance plan essay. One processor setting.
- Not a SKU and not a commission claim.
- Not a brokerage number. Live capital stays off Pages. NLV stays off Pages.
