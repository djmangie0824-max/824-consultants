# Processor performance increase threshold vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-perf-increase-threshold.html

Companion to [boost mode](processor-boost-mode.html) and [Intel Speed Shift / EPP](intel-speed-shift-epp.html). Floor, ceiling, turbo allow, unparked cores, C-states, EcoQoS / `PROCTHROTTLEMAX`, HWP bias, and P/E class pick can already be honest on AC and the named task still looks frozen between bursts. This pack is the remaining OS utilization gate: **Processor power management → Processor performance increase threshold**. That is `PERFINCTHRESHOLD`. GUID `06cadf0e-64ed-448a-8927-ce7bf90eb35d`. Units are percent busy. Balanced default on this host is **60% on AC**. A bursty Interactive Grok CLI never sits at 60. The package does not step up a P-state. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, min-state, max-state, parking, boost, idle disable, EPP, and heterogeneous scheduling can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Windows still waits for a remaining percent busy before it will *increase* a P-state. Typical Balanced AC is 60. Typical Balanced DC is 90. An Interactive Grok CLI is bursty: a paint, a wait, a JSON tool, a wait. Utilization between bursts is 5–30, not 60. The OS governor does not step up. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The increase threshold was 60.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. Min-state 100 of a P-state the governor will not *enter* is still a slow desk. Boost Enabled only *permits* turbo P-states. EPP 0 is a 0–100 hardware hint, not a percent-busy gate. Autonomous mode (`PERFAUTONOMOUS`) can already be Enabled — that is Speed Shift picking P-states, not a skip of this click. When HWP is later Disabled, or when the package still reads the OS threshold, 60% is the liar.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html). Floor, not remaining-busy. |
| Maximum processor state is 99% or 80% | [processor-max-state-ac](processor-max-state-ac.html) / [processor-power-throttling](processor-power-throttling.html). Ceiling, not the step-up gate. |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html). Unparked cores, not percent busy. |
| Boost mode is Disabled; clocks sit at base | [processor-boost-mode](processor-boost-mode.html). Turbo allow, not remaining-busy. |
| Wake stall after a quiet minute; C-states still Enabled | [processor-idle-disable](processor-idle-disable.html). C-states, not P-state step-up. |
| PERFEPP on AC is still 60–70 | [intel-speed-shift-epp](intel-speed-shift-epp.html). HWP bias 0–100, not a utilization percent. |
| Ultra 7 dumps grok.exe onto E-cores | [heterogeneous-thread-scheduling](heterogeneous-thread-scheduling.html). Class pick, not remaining-busy. |
| GUID missing from `powercfg /qh` after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| Floor, ceiling, turbo, parking, idle, EPP, and class pick already honest on AC. Session awake. Named task Ready / 267009. Grok TUI looks frozen between bursts. `PERFINCTHRESHOLD` on AC is still 60 | **This page.** Remaining percent busy before a P-state increase. |

Do not set Processor performance increase threshold as the first click on a new host. Timeouts, requests, min-state, max-state, parking, boost, idle disable, and Speed Shift EPP first. Hidden is not 10%. Missing GUID after unhide is skip, not a registry paste. Do not start at 0% on a sealed chassis. Do not cargo-cult Class 1 (`PERFINCTHRESHOLD1`) or increase time (`PERFINCTIME`) on this click.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm the sibling processor knobs are already honest on AC — Minimum processor state 100. Maximum processor state 100. Core parking min cores 100. Processor performance boost mode Enabled. Processor idle disable named if that pack already ran. Intel Speed Shift EPP 0 if that pack already ran. Heterogeneous policy Prefer performant if that pack already ran. If any of those is still a travel default, that is the matching sibling, not this page.
3. Query this GUID with `/qh` before you write. `powercfg /query` omits ATTRIB_HIDE rows. This host’s Balanced scheme hid `06cadf0e-64ed-448a-8927-ce7bf90eb35d`. Hidden is not 10%. If `/qh` still omits the GUID after the unhide line, this edition did not expose the knob. **Stop.** Do not invent a registry paste. Do not guess a GUID from a forum.
4. Unhide, then open Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor performance increase threshold**. Set **Plugged in** to **10%**. On battery may stay 90 if this laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Do not start at 0%. 0 means any remaining busy wants a step-up. That is a soak upgrade on a stand with Active cooling, not the opening move on a sealed Ultra 7. 10% on AC is the pass for this desk. 60% on AC is a fail.
6. Leave Class 1 and increase time as siblings. `PERFINCTHRESHOLD1` (`06cadf0e-64ed-448a-8927-ce7bf90eb35e`) is Processor Power Efficiency Class 1 remaining-busy. `PERFINCTIME` is how many time-check intervals utilization must stay above the threshold. Decrease threshold is `PERFDECTHRESHOLD`. Those are not this click. Do not cargo-cult them to 0.
7. Leave autonomous mode and EPP alone on this click. `PERFAUTONOMOUS` Enabled is Speed Shift picking P-states. That sibling is [intel-speed-shift-epp](intel-speed-shift-epp.html). This page does not Disable autonomous to “make the percent matter.” This page does not write EPP 0.
8. Leave the Balanced (or current) plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Activate the scheme after the AC index write — `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`.
9. Confirm.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 06cadf0e-64ed-448a-8927-ce7bf90eb35d
powercfg -attributes SUB_PROCESSOR 06cadf0e-64ed-448a-8927-ce7bf90eb35d -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 06cadf0e-64ed-448a-8927-ce7bf90eb35d 10
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 06cadf0e-64ed-448a-8927-ce7bf90eb35d
```

`SUB_PROCESSOR` is the processor subgroup. GUID `06cadf0e-64ed-448a-8927-ce7bf90eb35d` is Processor performance increase threshold. Alias `PERFINCTHRESHOLD`. Units are percent remaining busy, 0–100. This Grok host queried `powercfg /qh SCHEME_CURRENT SUB_PROCESSOR` before this pack was written: the row exists, ATTRIB_HIDE is set, AC is `0x0000003c` (60), DC is `0x0000005a` (90). **10% on AC** is the honest host-forever try — low enough that a bursty Interactive CLI steps up without sitting at 60. If `/qh` omits the GUID after unhide, this edition did not expose the knob — stop. Class 1 is a sibling, not this click. Increase time is a sibling, not this click. EPP is [intel-speed-shift-epp](intel-speed-shift-epp.html), not this click. Do not paste a Linux `cpufreq` governor on this Windows profile. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Max-state 100. Parking 100. Boost Enabled. Otherwise this soak is lying about the floor, the ceiling, or the turbo allow.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. Start a Grok turn. Task Manager Performance steps up without waiting for a 60% busy plateau. The TUI still accepts input between bursts.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with PERFINCTHRESHOLD 60 is not forever.
4. Increase threshold still 10 on AC. If someone set 60 to “save watts,” restore 10. Do not “fix” it by switching the whole plan to High performance. Missing GUID after unhide = skip, not a red soak. Do not invent the percent in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the remaining-busy gate is already 10. Isolation-empty `scheduler_list` is skip recreate, not missing forever. Host-forever is that named Windows task. Not systemd.

## What this page is not
- Not Minimum processor state. That floor is [processor-min-state-ac](processor-min-state-ac.html).
- Not Maximum processor state. That ceiling is [processor-max-state-ac](processor-max-state-ac.html).
- Not Processor performance boost mode. That turbo allow is [processor-boost-mode](processor-boost-mode.html).
- Not core parking. That unparked-core floor is [processor-core-parking](processor-core-parking.html).
- Not Processor idle disable. Those C-states are [processor-idle-disable](processor-idle-disable.html).
- Not processor power throttling / EcoQoS. That overlay is [processor-power-throttling](processor-power-throttling.html).
- Not Intel Speed Shift / EPP. That HWP bias is [intel-speed-shift-epp](intel-speed-shift-epp.html).
- Not heterogeneous thread scheduling. That class pick is [heterogeneous-thread-scheduling](heterogeneous-thread-scheduling.html).
- Not Class 1 remaining-busy (`PERFINCTHRESHOLD1`) and not increase time (`PERFINCTIME`).
- Not a Linux `cpufreq` paste. This host is Windows. Not systemd.
- Not a High-performance plan essay. One processor setting.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
