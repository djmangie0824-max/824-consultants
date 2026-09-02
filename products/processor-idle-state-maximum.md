# Processor idle state maximum vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-idle-state-maximum.html

Companion to [Processor idle disable](processor-idle-disable.html), [idle promote / demote thresholds](processor-idle-promote-threshold.html), and [idle time check](processor-idle-time-check.html). Disable is the allow/deny: Enable idle vs stay C0. Promote/demote are percent hysteresis. Time check is the sample window in microseconds. This pack is the **depth cap** after Enable idle is still on: **Processor power management → Processor idle state maximum**. Alias `IDLESTATEMAX`. GUID `9943e905-9a30-4ec1-9b99-44dd3b76f7a2`. Units are **State Type** (an index into the processor’s enumerated idle-state list), not percent, not microseconds.

## What this is
The idle-disable pack already exists. On this Yoga the measured row is still **Enable idle** (index 0) on AC and DC. That is honest: Disable idle keeps the package in C0, watts and heat go up, and a closed-lid desk without a stand cooks. Enable idle remains. The idle engine is still allowed to walk as deep as the hardware list goes. Microsoft’s 2021 server-tuning note is blunt: `IDLESTATEMAX` ranges from shallow (1) to a deep cap; **0 means no limit is imposed on how deep**. This host printed AC/DC `0x00000000`. No cap. Package C6/C7/C10 are legal. The quiet stretch still looks like a hung Interactive Grok CLI. `grok.exe` is alive. Task Scheduler still prints Ready and last result 267009. The package was in a deep idle state because *nothing forbade that index*.

Promote 100 / demote 80 is a residency-percent gate. It does not write a depth ceiling. A 60/40 Balanced pair with `IDLESTATEMAX` 0 still walks deep C on a quiet TUI. The depth cap is the hard ceiling: even when idle residency would promote, the index cannot pass this number.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Headless mill effort is `xhigh`. In-session grok-4.6 effort is `max`. A 400 Invalid reasoning effort is not operator cancel. Not a Linux FULL AUTO daemon.

## Live query on this host (2026-09-01)
| Field | This desk |
|---|---|
| Scheme | `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e` |
| Subgroup | `SUB_PROCESSOR` `54533251-82be-4824-96c1-47b60b740d00` |
| Setting GUID | `9943e905-9a30-4ec1-9b99-44dd3b76f7a2` alias `IDLESTATEMAX` |
| Friendly name | Processor idle state maximum |
| Units | State Type. Min 0. Max `0x00000014` = 20. Increment 1. |
| AC / DC | `0x00000000` = 0 = no depth cap |
| Sibling `IDLEDISABLE` | AC 0 / DC 0 Enable idle — this page still applies |
| Sibling `IDLEPROMOTE` / `IDLEDEMOTE` | Percent pair. Different pack. |
| Sibling `IDLECHECK` | AC/DC `0x0000c350` = 50 ms. Different pack. |
| Sibling `IDLESCALING` | Disable scaling (0). Different pack. |

Microsoft marks this row hidden in the GUI. Hidden is not missing. `powercfg /qh` printed it on this SKU. Do not cargo-cult `-ATTRIB_HIDE` on a public page. The blog example that cites a deep cap of 14 is a server-tuning illustration. This Yoga’s legal max is **20**. Do not write 14 as if it were universal. Do not write 20 to “allow deepest” — 0 already means no limit.

## A depth cap is not a C-state deny
| Layer | What it actually is |
|---|---|
| Processor idle disable | Allow/deny. `IDLEDISABLE`. 0 = Enable idle. 1 = Disable idle (stay C0). Heat. |
| Processor idle promote / demote | Percent hysteresis. `IDLEPROMOTE` / `IDLEDEMOTE`. How idle the window must be. |
| Processor idle time check | Window length. `IDLECHECK`. Microseconds. |
| Processor idle state maximum | Depth cap. `IDLESTATEMAX`. 0 = no cap. 1 = shallowest non-zero cap on the enumerated list. This page. |
| Processor idle threshold scaling | Whether the engine rescales the percent pair. `IDLESCALING`. Not this click. |

Index 1 is the shallowest *allowed idle state after C0* on the processor’s list. Forum cargo-cult treats that as ACPI C1. The list is firmware + PPM, not a promise that “1 = C1, 3 = C3, 6 = C6.” SuperUser’s working click for “limit to C1-class, do not stay C0” is `IDLESTATEMAX 1`, not `IDLEDISABLE 1`. This pack uses that click on AC. If a soak still shows package C6 after AC 1, stop. Do not invent a BIOS paste. The next honest layer is Disable idle (heat) or the percent pair, not a registry fiction.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| IDLEDISABLE already 1 on AC (Disable idle) | Depth cap unused. [processor-idle-disable](processor-idle-disable.html) already took the heat. |
| Promote / demote still 60 / 40 and the quiet TUI sits in C6 | [processor-idle-promote-threshold](processor-idle-promote-threshold.html). Can stack with this cap; do not confuse them. |
| First token after a quiet gap hitch-pauses; IDLECHECK still 50 ms | [processor-idle-time-check](processor-idle-time-check.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Enable idle still 0. IDLESTATEMAX still 0. Session awake. Named task Ready / 267009. Quiet TUI looks frozen, then snaps back from a deep C | **This page.** Cap AC at 1. Leave DC at 0 if the laptop travels. |

Do not write this index as the first click on a new host. Timeouts, lid, requests, min-state, parking, boost, and cooling first. Do not Disable idle and also slam IDLESTATEMAX 1 — pick one layer. Leave DC at 0 (no cap) if the laptop actually travels. If `powercfg` omits the alias, stop; do not invent a registry paste. Do not cargo-cult 14 as the deep cap on a SKU whose max is 20. Do not write 0 after a soak just to “save watts” on a forever desk.

## What to change (plugged-in Grok desk)
1. Confirm Enable idle is still the truth — `powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE`. AC index 0 means this page applies. AC index 1 means stop; the deny pack already ran. Do not stack both.
2. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). A depth cap is not a substitute for Sleep never.
3. Query the alias before you write — this desk printed `0x0` on AC and DC, legal max 20. If the row is missing, stop. Hidden in the GUI is not missing in `powercfg`.
4. Set Plugged in to **1** — that is `IDLESTATEMAX` `0x1`. On battery stays 0 if this laptop actually travels.
5. Activate the current scheme after the AC index write — `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. AC `0x00000001` is the pass. `0x00000000` still sitting there is a fail for this desk.
6. Leave promote, demote, time check, and scaling as siblings — this click does not write 100/80 and does not write 10 ms.
7. Leave the Balanced (or current) plan in place. One processor index. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm, then soak. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLESTATEMAX
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLESTATEMAX 1
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLESTATEMAX
```

`SUB_PROCESSOR` is the processor subgroup. Typical Balanced value: 0 (no cap). AC pass for this desk: 1 (shallowest non-zero cap). Run the `/qh` lines first. If the alias is omitted, skip the `/setacvalueindex` line — do not invent a registry hack. `IDLEDISABLE` 1 is a sibling that makes this cap unused. BIOS Package C-state / C1E is firmware, not this click.

## Soak test (what "passes" means)
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state / parking / boost already honest. IDLEDISABLE still 0. Otherwise this soak is lying about the wrong layer.
2. Leave the desk idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input on the first keystroke. A session that paints once a minute then takes a beat to “wake the CPU” after quiet is a fail on this page even if `grok.exe` never exited.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with IDLESTATEMAX 0 is not forever. A 5-minute pulse that fires late because the package was in C10 is this layer, not a missed `schtasks` trigger.
4. AC still 1. If someone restored 0 to “save watts,” write it again. Do not “fix” it by switching the whole plan to High performance. Do not slam 1 on DC as a cargo-cult. Do not write 14 because a blog used 14 on a server SKU.
5. No extra Grok TUI. Last result 267009 is still-running, not proof the cap is already honest. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. The Windows task is the host-forever pulse. Headless mill effort is `xhigh`. In-session grok-4.6 effort is `max`. A 400 is not operator cancel. Not systemd.

## How it splits from the other playbooks
- [Processor idle disable](processor-idle-disable.html) — allow/deny (`IDLEDISABLE`). Stay C0 vs walk C-states. Heat. This page keeps Enable idle and caps how deep the walk may go.
- [Processor idle promote / demote](processor-idle-promote-threshold.html) — percent hysteresis. The engine’s opinion of idle residency. Not a hard index ceiling.
- [Processor idle time check](processor-idle-time-check.html) — sample window (`IDLECHECK`). Microseconds. Not an index. That pack already promised this landing; this file is the delivery.
- [Minimum processor state](processor-min-state-ac.html) — frequency floor (`PROCTHROTTLEMIN`). How slow C0 may run. Unused in C6.
- [Core parking](processor-core-parking.html) — unparked-core floor (`CPMINCORES`). Parked is a scheduler flag. C7 is idle residency.
- This page — AC `IDLESTATEMAX` 1 so an uncapped Balanced idle list cannot stall an Interactive Grok CLI while Enable idle is still the honest heat choice.

## What this page is not
- Not a Linux FULL AUTO daemon on this Windows profile. Not systemd.
- Not a group-policy pack for a fleet we do not run.
- Not Processor idle disable, not promote/demote percents, not idle time check, not idle threshold scaling.
- Not Minimum processor state, not core parking, not Processor performance boost mode, not Intel Speed Shift / EPP.
- Not a BIOS Package C-state / C1E essay. Firmware stays firmware. Do not paste a BIOS screenshot on Pages.
- Not a guaranteed ACPI Cx map. Index 1 is the shallowest non-zero cap on this SKU’s list, not a public claim that “1 = C1” on every laptop.
- Not `DISKIDLE` and not Modern Standby.
- Not a High-performance plan essay. One processor index.
- Not a SKU and not a commission claim.
- Not a brokerage number. Live capital stays off Pages. NLV stays off Pages.
