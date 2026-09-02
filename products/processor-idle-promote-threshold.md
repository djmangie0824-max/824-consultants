# Processor idle promote / demote thresholds vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-idle-promote-threshold.html

Companion to [Processor idle disable](processor-idle-disable.html). Idle disable is the allow/deny: Enable idle vs stay C0. This pack is the **walk** after Enable idle is still on: **Processor power management → Processor idle promote threshold** and **Processor idle demote threshold**. Aliases `IDLEPROMOTE` and `IDLEDEMOTE`. They are a hysteresis pair. One click without the other is a lie.

## What this is
The idle-disable pack already exists. On this Yoga the measured row is still **Enable idle** (index 0) on AC and DC. That is honest: Disable idle keeps the package in C0, watts and heat go up, and a closed-lid desk without a stand cooks. Enable idle remains. Windows still walks ACPI C-states. The quiet stretch still looks like a hung Interactive Grok CLI. `grok.exe` is alive. Task Scheduler still prints Ready and last result 267009. The package was in C6/C7 because the *thresholds* said it was idle enough.

Microsoft’s idle engine uses idle-residency percent over the idle time-check window. Idle percent **above** `IDLEPROMOTE` promotes to a deeper (higher-index, lower-performance) C-state. Idle percent **below** `IDLEDEMOTE` demotes to a shallower (higher-performance) C-state. Balanced default on this host is promote **60%** / demote **40%**. That 20-point gap is the hysteresis. Forum cargo-cult “set both to 0” always walks deeper. Forum cargo-cult “set demote above promote” oscillates. Neither is a forever loop.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## Live query on this host (2026-09-01)
| Field | This desk |
|---|---|
| Scheme | `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e` |
| Subgroup | `SUB_PROCESSOR` `54533251-82be-4824-96c1-47b60b740d00` |
| Promote GUID | `7b224883-b3cc-4d79-819f-8374152cbe7c` alias `IDLEPROMOTE` |
| Demote GUID | `4b92d758-5a24-4851-a470-815d78aee119` alias `IDLEDEMOTE` |
| Units | Percent 0–100 |
| AC / DC promote | `0x0000003c` = 60% |
| AC / DC demote | `0x00000028` = 40% |
| Sibling `IDLEDISABLE` | AC 0 / DC 0 Enable idle — this page still applies |
| Sibling `IDLESTATEMAX` | AC 0 / DC 0 (no depth cap). Different pack. |
| Sibling `IDLECHECK` | AC/DC `0x0000c350` = 50 ms. Different pack. |
| Sibling `IDLESCALING` | Disable scaling (0). Different pack. |

Microsoft marks both threshold rows hidden in the GUI. Hidden is not missing. `powercfg /qh` printed them on this SKU. Do not cargo-cult `-ATTRIB_HIDE` on a public page to “unhide” a row you can already write with `/setacvalueindex`.

## C-state walk is not C-state deny
| Layer | What it actually is |
|---|---|
| Processor idle disable | Allow/deny. `IDLEDISABLE`. 0 = Enable idle. 1 = Disable idle (stay C0). Heat. |
| Processor idle promote threshold | How idle the window must be before walking *deeper*. `IDLEPROMOTE`. |
| Processor idle demote threshold | How busy the window must be before walking *shallower*. `IDLEDEMOTE`. |
| Processor idle state maximum | Depth cap. `IDLESTATEMAX`. 0 = no cap. Not this click. |
| Processor idle time check | Window length. `IDLECHECK`. Microseconds. Not this click. |
| Processor idle threshold scaling | Whether the engine rescales the pair. `IDLESCALING`. Not this click. |

Promote 100% means idle residency must exceed 100% to go deeper — it never does — so the engine does not promote. Demote 80% means any window under 80% idle walks shallower. That pair keeps hysteresis (promote still greater than demote) and keeps the package out of C6 without the C0-forever heat of Disable idle. Forum 100/100 is a documented clamp that forbids C6 on unparked cores; it is not Disable idle; C1 can still exist. This pack’s primary AC click is 100 / 80, not a 100/100 cargo.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| IDLEDISABLE already 1 on AC (Disable idle) | Thresholds unused. [processor-idle-disable](processor-idle-disable.html) already took the heat. |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Boost mode is Disabled; clocks sit at base while executing | [processor-boost-mode](processor-boost-mode.html) |
| Need a depth cap, not a percent walk | `IDLESTATEMAX`. Do not invent a BIOS paste here. |
| Need a shorter/longer idle window | `IDLECHECK` 50 ms on this host. Leave it. |
| Enable idle still 0. Promote 60 / demote 40. Session awake. Named task Ready / 267009. Grok TUI looks frozen after a quiet stretch, then snaps back | **This page.** Raise AC promote. Keep demote below it. |

Do not write these percents as the first click on a new host. Timeouts, lid, requests, min-state, parking, boost, and cooling first. Do not Disable idle and also slam 100/80 — pick one layer. Leave DC at Balanced 60/40 if the laptop actually travels. If `powercfg` omits both aliases, stop; do not invent a registry paste. Do not set demote greater than or equal to promote except the documented 100/100 clamp, which is not this pack’s primary click.

## What to change (plugged-in Grok desk)
1. Confirm Enable idle is still the truth — `powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE`. AC index 0 means this page applies. AC index 1 means stop; the deny pack already ran. Do not stack both.
2. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). C-state walk is not a substitute for Sleep never.
3. Query both aliases before you write — this desk printed promote `0x3c` (60) and demote `0x28` (40) on AC and DC. If a row is missing, stop. Hidden in the GUI is not missing in `powercfg`.
4. Set Plugged in promote to 100 and demote to 80 — that is `IDLEPROMOTE` `0x64` and `IDLEDEMOTE` `0x50`. On battery stays 60 / 40 if this laptop actually travels.
5. Activate the current scheme after the AC index writes — `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. AC promote `0x00000064` and AC demote `0x00000050` is the pass. 60 / 40 still sitting there is a fail for this desk.
6. Leave idle state maximum, idle time check, and idle threshold scaling alone — `IDLESTATEMAX` 0, `IDLECHECK` 50 ms, `IDLESCALING` Disable are siblings.
7. Leave the Balanced (or current) plan in place. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEPROMOTE
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDEMOTE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEPROMOTE 100
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEDEMOTE 80
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEPROMOTE
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDEMOTE
```

`SUB_PROCESSOR` is the processor subgroup. Typical Balanced values: promote 60, demote 40. AC pass for this desk: promote 100, demote 80. Run the `/qh` lines first. If an alias is omitted, skip the matching `/setacvalueindex` line — do not invent a registry hack. `IDLEDISABLE` 1 is a sibling that makes this pair unused. BIOS Package C-state / C1E is firmware, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state / parking / boost already honest. IDLEDISABLE still 0. Otherwise this soak is lying about the wrong layer.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input on the first keystroke. A session that paints once a minute then takes a beat to “wake the CPU” after quiet is a fail on this page even if `grok.exe` never exited.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with promote 60 is not forever. A 5-minute pulse that fires late because the package was in C10 is this layer, not a missed `schtasks` trigger.
4. AC promote still 100 and demote still 80. If someone restored 60/40 to "save watts," write them again. Do not "fix" it by switching the whole plan to High performance. Do not slam 100/80 on DC as a cargo-cult.
5. No extra Grok TUI. Last result 267009 is still-running, not proof the walk is already honest. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not Processor idle disable. That is [processor-idle-disable](processor-idle-disable.html). This desk still has Enable idle; that is why the walk matters.
- Not Processor idle state maximum, not Processor idle time check, not Processor idle threshold scaling.
- Not Minimum processor state, not core parking, not Processor performance boost mode, not Intel Speed Shift / EPP.
- Not a BIOS Package C-state / C1E essay.
- Not [hard disk idle timeout](hard-disk-idle-timeout.html). DISKIDLE is a spindle, not CPU C-states.
- Not a High-performance plan essay. Two processor percents.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not a brokerage number. Live capital stays off Pages.

© 2026 824 Consultants LLC / Douglas James Mangie II / Lexxii · ONLY YOU. FOREVER.  
As an Amazon Associate I earn from qualifying purchases. Tag `824consultant-20`.
