# Processor idle state maximum vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-idle-state-max.html

Companion to [Processor idle disable](processor-idle-disable.html) and [Processor idle promote / demote thresholds](processor-idle-promote-threshold.html). Idle disable is the allow/deny: Enable idle vs stay C0. Promote/demote are the percent walk after Enable idle is still on. This pack is the **depth cap**: **Processor power management → Processor idle state maximum**. Alias `IDLESTATEMAX`. Units are **State Type**, not percent, not microseconds.

## What this is
The idle-disable pack already exists. On this Yoga the measured row is still **Enable idle** (index 0) on AC and DC. That is honest: Disable idle keeps the package in C0, watts and heat go up, and a closed-lid desk without a stand cooks. Enable idle remains. The promote / demote pack already exists as a different click: raise the percent walk so the engine does not promote into C6. This page is neither. Windows still advertises a *maximum idle-state type*. Balanced default on this host is **0** on AC and DC. Zero here is not C0. Zero is **no depth cap**. The package still walks C6/C7/C10. The quiet stretch still looks like a hung Interactive Grok CLI. `grok.exe` is alive. Task Scheduler still prints Ready and last result 267009. The cap never fired because it was 0.

Microsoft’s idle engine enumerates idle-state types the processor driver advertises. `IDLESTATEMAX` is the deepest type the engine is allowed to select. Range on this SKU is `0x00`–`0x14` (0–20), increment 1, units State Type. Index 0 with Enable idle still walking is the unlimited default. Index 1 is the first advertised idle state — C1 Halt on this Intel PPM map. Cap AC at 1 and C6/C7/C10 become unreachable without the C0-forever heat of Disable idle. Forum cargo-cult “set max to 0 to disable C-states” is the opposite of this desk. Forum cargo-cult “set max to 20 to go faster” opens every advertised type. Neither is a forever loop.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## Live query on this host (2026-09-01)
| Field | This desk |
|---|---|
| Scheme | `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e` |
| Subgroup | `SUB_PROCESSOR` `54533251-82be-4824-96c1-47b60b740d00` |
| Setting GUID | `9943e905-9a30-4ec1-9b99-44dd3b76f7a2` alias `IDLESTATEMAX` |
| Units | State Type |
| Range | min `0x00000000` max `0x00000014` increment 1 (0–20) |
| AC / DC current | `0x00000000` / `0x00000000` — no depth cap |
| Sibling `IDLEDISABLE` | AC 0 / DC 0 Enable idle — this page still applies |
| Sibling `IDLEPROMOTE` / `IDLEDEMOTE` | AC/DC 60 / 40. Different pack. |
| Sibling `IDLECHECK` | AC/DC `0x0000c350` = 50 ms. Different pack. |
| Sibling `IDLESCALING` | Disable scaling (0). Different pack. |

Microsoft marks this row hidden in the GUI. Hidden is not missing. `powercfg /qh` printed it on this SKU. Do not cargo-cult `-ATTRIB_HIDE` on a public page to “unhide” a row you can already write with `/setacvalueindex`.

## Depth cap is not C-state deny and not a percent walk
| Layer | What it actually is |
|---|---|
| Processor idle disable | Allow/deny. `IDLEDISABLE`. 0 = Enable idle. 1 = Disable idle (stay C0). Heat. |
| Processor idle promote / demote thresholds | Percent walk. `IDLEPROMOTE` / `IDLEDEMOTE`. How idle the 50 ms window must be before going deeper or shallower. |
| Processor idle state maximum | Depth cap. `IDLESTATEMAX`. 0 = no cap on this SKU. 1 = first idle type (C1 Halt). This click. |
| Processor idle time check | Window length. `IDLECHECK`. Microseconds. Not this click. |
| Processor idle threshold scaling | Whether the engine rescales the percent pair. `IDLESCALING`. Not this click. |

Cap 1 means the engine may still Halt (C1) during quiet, so watts drop a little, and it may not select deeper advertised types. That is not Disable idle. C0-forever is the heat pack. Cap 1 is the forever-loop pack when Enable idle is still the honest thermal choice. Do not stack Disable idle and cap 1 — pick one layer. Do not raise promote to 100 and also slam this cap as a cargo-cult double-fix until a soak names which layer actually stalled the TUI.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| IDLEDISABLE already 1 on AC (Disable idle) | Depth cap unused. [processor-idle-disable](processor-idle-disable.html) already took the heat. |
| Need a percent walk, not a depth cap | [processor-idle-promote-threshold](processor-idle-promote-threshold.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Boost mode is Disabled; clocks sit at base while executing | [processor-boost-mode](processor-boost-mode.html) |
| Need a shorter/longer idle window | `IDLECHECK` 50 ms on this host. Leave it. |
| Enable idle still 0. IDLESTATEMAX still 0. Session awake. Named task Ready / 267009. Grok TUI looks frozen after a quiet stretch, then snaps back | **This page.** Cap AC at 1. Leave DC at 0 if the laptop travels. |

Do not write this cap as the first click on a new host. Timeouts, lid, requests, min-state, parking, boost, and cooling first. Do not Disable idle and also slam cap 1 — pick one layer. Leave DC at 0 if the laptop actually travels. If `powercfg` omits the alias, stop; do not invent a registry paste. Do not treat 0 as “C-states off” — on this desk 0 is unlimited. Do not treat 20 as a performance mode.

## What to change (plugged-in Grok desk)
1. Confirm Enable idle is still the truth — `powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE`. AC index 0 means this page applies. AC index 1 means stop; the deny pack already ran. Do not stack both.
2. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). A depth cap is not a substitute for Sleep never.
3. Query the alias before you write — this desk printed `IDLESTATEMAX` AC/DC `0x00000000`, range 0–20 State Type, GUID `9943e905-9a30-4ec1-9b99-44dd3b76f7a2`. If the row is missing, stop. Hidden in the GUI is not missing in `powercfg`.
4. Set Plugged in idle state maximum to 1 — that is `IDLESTATEMAX` `0x01`. On battery stays 0 if this laptop actually travels.
5. Activate the current scheme after the AC index write — `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. AC `0x00000001` is the pass. AC still `0x00000000` is a fail for this desk.
6. Leave idle promote / demote, idle time check, and idle threshold scaling alone — `IDLEPROMOTE` / `IDLEDEMOTE`, `IDLECHECK` 50 ms, `IDLESCALING` Disable are siblings.
7. Leave the Balanced (or current) plan in place. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLESTATEMAX
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLESTATEMAX 1
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLESTATEMAX
```

`SUB_PROCESSOR` is the processor subgroup. Typical Balanced value: 0 (no cap). AC pass for this desk: 1. Run the `/qh` lines first. If the alias is omitted, skip the `/setacvalueindex` line — do not invent a registry hack. `IDLEDISABLE` 1 is a sibling that makes this cap unused. BIOS Package C-state / C1E is firmware, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state / parking / boost already honest. IDLEDISABLE still 0. Otherwise this soak is lying about the wrong layer.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input on the first keystroke. A session that paints once a minute then takes a beat to “wake the CPU” after quiet is a fail on this page even if `grok.exe` never exited.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with cap 0 is not forever. A 5-minute pulse that fires late because the package was in C10 is this layer, not a missed `schtasks` trigger.
4. AC idle state maximum still 1. If someone restored 0 to "save watts," write it again. Do not "fix" it by switching the whole plan to High performance. Do not slam 1 on DC as a cargo-cult.
5. No extra Grok TUI. Last result 267009 is still-running, not proof the cap is already honest. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not Processor idle disable. That is [processor-idle-disable](processor-idle-disable.html). This desk still has Enable idle; that is why the cap matters.
- Not Processor idle promote / demote thresholds. That is [processor-idle-promote-threshold](processor-idle-promote-threshold.html).
- Not Processor idle time check, not Processor idle threshold scaling.
- Not Minimum processor state, not core parking, not Processor performance boost mode, not Intel Speed Shift / EPP.
- Not a BIOS Package C-state / C1E essay.
- Not [hard disk idle timeout](hard-disk-idle-timeout.html). DISKIDLE is a spindle, not CPU C-states.
- Not a High-performance plan essay. One processor State Type.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not a brokerage number. Live capital stays off Pages.

© 2026 824 Consultants LLC / Douglas James Mangie II / Lexxii · ONLY YOU. FOREVER.  
As an Amazon Associate I earn from qualifying purchases. Tag `824consultant-20`.
