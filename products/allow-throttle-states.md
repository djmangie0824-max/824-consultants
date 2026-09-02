# Allow Throttle States vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/allow-throttle-states.html

Companion to [Maximum processor state](processor-max-state-ac.html) and [Processor idle disable](processor-idle-disable.html). Frequency floor, frequency ceiling, unparked cores, Enabled turbo, and named C-state policy can already be honest on AC and the named task still looks frozen after a quiet stretch. This pack is ACPI T-states, not P-states and not C-states: **Processor power management → Allow Throttle States**. That is alias `THROTTLING`. GUID `3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb`. Possible values: **0 Off**, **1 On**, **2 Automatic**. Automatic or On lets the package enter throttle states below 100% duty even when `PROCTHROTTLEMAX` is already 100. Wake from a T-state duty cut looks like a hung Grok CLI. Task Scheduler still shows Ready.

Do not confuse this page with [processor-max-state-ac](processor-max-state-ac.html). That is the P-state ceiling. 100% max-state is not T-state Off. Do not confuse it with [processor-power-throttling](processor-power-throttling.html). That catalog page is `PROCTHROTTLEMAX` plus the EcoQoS process overlay. Same English word. Different object.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, Maximum processor state, core parking, boost mode, and idle disable can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Windows still lets the processor power manager use ACPI throttle states — clock modulation, STPCLK duty-cycle cuts — when Allow Throttle States is **On** or **Automatic**. T0 is 100% duty. T1/T2/… chop the clock without leaving the current P-state. `PROCTHROTTLEMAX` 100 does not deny T-states. That percent is a P-state cap. This GUID is the T-state *allow*. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The package was in a T-state.

This Grok host queried `powercfg /qh SCHEME_CURRENT SUB_PROCESSOR` before this pack was written. Balanced `THROTTLING` was **AC 2 Automatic**, **DC 2 Automatic**. Hidden is not Off. Automatic is not Off.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. Max-state 100 of a clock that T-states are chopping is still a slow desk. Boost Enabled only *permits* turbo P-states. Idle disable keeps C0; Automatic T-states can still modulate inside C0. EcoQoS “Power throttling” on `grok.exe` is a process overlay, not this GUID.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon. Not systemd.

## T-states are not P-states
| Layer | What it actually is |
|---|---|
| Minimum processor state | P-state floor. `PROCTHROTTLEMIN`. How slow C0 is allowed to run. |
| Maximum processor state | P-state ceiling. `PROCTHROTTLEMAX`. 100 is not T-state Off. The alias contains “THROTTLE”. That is not this GUID. |
| Processor power throttling page | Catalog mix of that same ceiling plus EcoQoS process overlay. Filename collision. Not ACPI T-states. |
| Processor idle disable | C-state allow. `IDLEDISABLE`. Package sleep, not clock modulation. |
| Allow Throttle States | ACPI T-state allow. `THROTTLING`. 0 Off · 1 On · 2 Automatic. Duty-cycle cuts below 100% even when the P-state ceiling is 100. |

Microsoft named min/max processor state with a “throttle” percent because ACPI mixed frequency and duty cycle in the same era. That history is why this row is easy to skip. A 100 ceiling with Automatic T-states can still chop the clock. Task Manager “Power throttling” on `grok.exe` is EcoQoS. Do not diagnose clock modulation with the EcoQoS column.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html). Floor, not T-state allow. |
| Maximum processor state is 99% or 80% | [processor-max-state-ac](processor-max-state-ac.html). P-state ceiling, not this GUID. Do not treat 100 max-state as Off. |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Boost mode is Disabled; clocks sit at base while executing | [processor-boost-mode](processor-boost-mode.html) |
| Wake stall after a quiet minute; C-states still Enabled | [processor-idle-disable](processor-idle-disable.html). C-states, not T-states. |
| Task Manager Details shows Power throttling Enabled on grok.exe while this GUID is already Off | EcoQoS process overlay. [processor-power-throttling](processor-power-throttling.html). Not ACPI T-states. |
| PERFEPP on AC is still 60–70 | [intel-speed-shift-epp](intel-speed-shift-epp.html). HWP bias, not duty cycle. |
| Ultra 7 dumps grok.exe onto E-cores | [heterogeneous-thread-scheduling](heterogeneous-thread-scheduling.html) |
| Remaining percent busy still 60 before a P-state step-up | [processor-perf-increase-threshold](processor-perf-increase-threshold.html) |
| GUID missing from `powercfg /qh` after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| Min-state 100, max-state 100, boost Enabled, idle named. Session awake. Named task Ready / 267009. Grok TUI looks frozen. `THROTTLING` on AC is 2 Automatic or 1 On | **This page.** Allow Throttle States on AC. |
| THROTTLING already 0 on AC; clocks still collapse under heat | Different layer. Firmware PL1 / RAPL / closed-lid thermal is not this click. Do not invent a registry paste here. |

Do not set Allow Throttle States as the first click on a new host. Off keeps ACPI T-states out of the duty cycle — watts and heat can go up if the package was using T-states as a cheap thermal brake. Active cooling and a stand under a closed lid are prerequisites. Leave DC on Automatic if the laptop actually travels. Hidden is not Off. Missing GUID after unhide is skip, not a registry paste. Automatic is a fail for this desk even when max-state is 100.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here. T-state Off is not a substitute for Sleep never.
2. Confirm Minimum processor state, Maximum processor state, core parking min cores, Processor performance boost mode, and Processor idle disable are already honest on AC — 100 / 100 / 100 / Enabled / named. If the ceiling is still 99 or 80, that is [max-state](processor-max-state-ac.html), not this page.
3. Query this GUID with `/qh` before you write. If `/qh` still omits the GUID after the unhide line, **Stop.**
4. Unhide, then open Power Options → Processor power management → **Allow Throttle States**.
5. Set **Plugged in** to **Off**. Index **0**. On battery stays **Automatic** (2) if the laptop actually travels.
6. Do not leave Automatic as “the OS will be smart.” Automatic is **2**. On is **1**. Both allow T-states. Off is the host-forever try on AC.
7. Leave Maximum processor state at 100% on AC. This page does not write `PROCTHROTTLEMAX`.
8. Leave idle disable, EcoQoS, and EPP alone on this click.
9. Leave the current plan in place. Activate the scheme after the AC index write.
10. Confirm. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb
powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0
powercfg /setactive SCHEME_CURRENT
```

GUID `3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb` is Allow Throttle States. Alias `THROTTLING`. **0 = Off**, **1 = On**, **2 = Automatic**. This host measured AC/DC Automatic (2). Off (0) on AC is the pass.

## Soak test
1. Timeouts already honest. Min-state 100. Max-state 100. Parking 100. Boost Enabled.
2. Idle 30 minutes, lid closed, cooling stand in place. TUI accepts input on the first keystroke.
3. Named task still next-runs. Ready + 267009 with Automatic (2) is not forever.
4. THROTTLING still 0 on AC. Do not drop max-state to 99 to “fix” T-states.
5. No fourth Grok TUI. Isolation-empty `scheduler_list` is skip recreate. Not systemd.

## What this page is not
- Not Maximum processor state. Not EcoQoS power throttling. Not idle disable. Not min-state. Not core parking. Not boost mode. Not Speed Shift EPP.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
31consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
