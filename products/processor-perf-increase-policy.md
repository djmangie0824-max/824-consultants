# Processor performance increase policy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-perf-increase-policy.html

Companion to [increase threshold](processor-perf-increase-threshold.html) and [boost mode](processor-boost-mode.html). Remaining-busy percent, time-check intervals, turbo allow, frequency floor, and HWP bias can already be honest on AC and the named task still looks frozen between bursts. This pack is how the OS *steps* once that remaining-busy gate is crossed: **Processor power management → Processor performance increase policy**. That is `PERFINCPOL`. GUID `465e1f50-b610-473a-ab58-00d1077dc418`. Values are **Ideal** (0), **Single** (1), **Rocket** (2), **IdealAggressive** (3). Balanced default on this host is **Ideal on AC**. A bursty Interactive Grok CLI never looks continuously busy. Ideal walks toward a P-state. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, min-state, max-state, parking, boost mode, increase threshold, and Speed Shift EPP can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Windows still uses **Ideal** to pick the next P-state. An Interactive Grok CLI is bursty: a paint, a wait, a JSON tool, a wait. Utilization never sits in the window Ideal wants. Clocks lag the burst. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The increase policy was Ideal.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. Increase threshold 10 of a policy that still walks is still a slow desk. Boost Enabled only *permits* turbo P-states. EPP 0 is a 0–100 hardware hint, not a step algorithm. Autonomous mode (`PERFAUTONOMOUS`) can already be Enabled — that is Speed Shift picking P-states, not a skip of this click. When HWP is later Disabled, or when the package still reads the OS policy, Ideal is the liar. Do not Disable autonomous on this click.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html). Floor, not step algorithm. |
| Increase threshold still 60% remaining-busy | [processor-perf-increase-threshold](processor-perf-increase-threshold.html). Gate, not how it steps. |
| Increase time is 3–8 intervals | [processor-perf-increase-time](processor-perf-increase-time.html). How long above the gate, not Ideal vs Rocket. |
| Boost mode is Disabled; clocks sit at base | [processor-boost-mode](processor-boost-mode.html). Turbo allow, not step algorithm. |
| Boost mode Enabled; turbo still shy | [processor-perf-boost-policy](processor-perf-boost-policy.html). Percent of turbo, not Ideal vs Rocket. |
| PERFEPP on AC is still 60–70 | [intel-speed-shift-epp](intel-speed-shift-epp.html). HWP bias, not OS increase policy. |
| Autonomous mode Enabled; OS policy ignored | [processor-autonomous-mode](processor-autonomous-mode.html). This click does not Disable HWP. |
| GUID missing from `powercfg /qh` after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| Floor, ceiling, turbo, threshold, and time already honest on AC. Session awake. Named task Ready / 267009. Grok TUI lags between bursts. `PERFINCPOL` on AC is still Ideal | **This page.** How the OS steps up a P-state. |

Do not set Processor performance increase policy as the first click on a new host. Timeouts, requests, min-state, max-state, parking, boost mode, increase threshold, and Speed Shift EPP first. Hidden is not IdealAggressive. Missing GUID after unhide is skip, not a registry paste. Do not start at Rocket on a sealed chassis. Do not cargo-cult Class 1 (`PERFINCPOL1`) on this click.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm the sibling processor knobs are already honest on AC — Minimum processor state 100. Maximum processor state 100. Core parking min cores 100. Processor performance boost mode Enabled. Increase threshold named if that pack already ran. If any of those is still a travel default, that is the matching sibling, not this page.
3. Query this GUID with `/qh` before you write. `powercfg /query` omits ATTRIB_HIDE rows. If `/qh` still omits the GUID after the unhide line, this edition did not expose the knob. **Stop.** Do not invent a registry paste. Do not guess a GUID from a forum.
4. Unhide, then open Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor performance increase policy**. Set **Plugged in** to **IdealAggressive**. On battery may stay Ideal if this laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Do not start at Rocket. Rocket jumps P-states as fast as the governor allows. That is a soak upgrade on a stand with Active cooling, not the opening move on a sealed Ultra 7. IdealAggressive on AC is the pass for this desk. Ideal on AC is a fail.
6. Leave Class 1, increase time, and decrease policy as siblings. `PERFINCPOL1` is Processor Power Efficiency Class 1. `PERFINCTIME` is intervals above the threshold. Decrease policy is `PERFDECPOL`. Those are not this click. Do not cargo-cult them to Rocket.
7. Leave autonomous mode and EPP alone on this click. `PERFAUTONOMOUS` Enabled is Speed Shift picking P-states. That sibling is [processor-autonomous-mode](processor-autonomous-mode.html) / [intel-speed-shift-epp](intel-speed-shift-epp.html). This page does not Disable autonomous to “make the OS policy matter.” This page does not write EPP 0.
8. Leave the Balanced (or current) plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO. Activate the scheme after the AC index write — `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`.
9. Confirm.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 465e1f50-b610-473a-ab58-00d1077dc418
powercfg -attributes SUB_PROCESSOR 465e1f50-b610-473a-ab58-00d1077dc418 -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 465e1f50-b610-473a-ab58-00d1077dc418 3
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 465e1f50-b610-473a-ab58-00d1077dc418
```

`SUB_PROCESSOR` is the processor subgroup. GUID `465e1f50-b610-473a-ab58-00d1077dc418` is Processor performance increase policy. Alias `PERFINCPOL`. Values: 0 Ideal, 1 Single, 2 Rocket, 3 IdealAggressive. This Grok host queried `powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 465e1f50-b610-473a-ab58-00d1077dc418` before this pack was written: the row exists, AC is `0x00000000` (Ideal), DC is `0x00000000` (Ideal). **IdealAggressive on AC** is the honest host-forever try — faster than Ideal without jumping to Rocket on a sealed chassis. If `/qh` omits the GUID after unhide, this edition did not expose the knob — stop. Class 1 is a sibling, not this click. Increase time is a sibling, not this click. EPP is [intel-speed-shift-epp](intel-speed-shift-epp.html), not this click. Do not paste a Linux `cpufreq` governor on this Windows profile. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Max-state 100. Parking 100. Boost Enabled. Increase threshold already named. Otherwise this soak is lying about the floor, the ceiling, or the gate.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. Start a Grok turn. Task Manager Performance steps up without waiting for Ideal to walk. The TUI still accepts input between bursts.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with PERFINCPOL Ideal is not forever.
4. Increase policy still IdealAggressive on AC. If someone set Ideal to “save watts,” restore 3. Do not “fix” it by switching the whole plan to High performance. Missing GUID after unhide = skip, not a red soak. Do not invent the enum in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the step algorithm is already IdealAggressive. Isolation-empty `scheduler_list` is skip recreate, not missing forever. Host-forever is that named Windows task. Not systemd.

## What this page is not
- Not Processor performance increase threshold. That remaining-busy gate is [processor-perf-increase-threshold](processor-perf-increase-threshold.html).
- Not Processor performance increase time. Those intervals are [processor-perf-increase-time](processor-perf-increase-time.html).
- Not Processor performance decrease policy. That step-down is [processor-perf-decrease-policy](processor-perf-decrease-policy.html).
- Not Processor performance boost mode. That turbo allow is [processor-boost-mode](processor-boost-mode.html).
- Not Processor performance boost policy. That turbo percent is [processor-perf-boost-policy](processor-perf-boost-policy.html).
- Not Intel Speed Shift / EPP. That HWP bias is [intel-speed-shift-epp](intel-speed-shift-epp.html).
- Not autonomous mode. That on/off is [processor-autonomous-mode](processor-autonomous-mode.html).
- Not Class 1 increase policy (`PERFINCPOL1`).
- Not a Linux `cpufreq` paste. This host is Windows. Not systemd.
- Not a High-performance plan essay. One processor setting.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
