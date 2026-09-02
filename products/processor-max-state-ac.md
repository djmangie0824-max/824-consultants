# Processor maximum state vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-max-state-ac.html

Companion to [processor min-state](processor-min-state-ac.html) and [processor boost mode](processor-boost-mode.html). Frequency floor, unparked cores, Enabled turbo, and Speed Shift EPP 0 can already be honest on AC and the named task still looks frozen. The min-state pack already says leave Maximum processor state at 100% and then walks away. This pack is that click: **Processor power management → Maximum processor state**. That is `PROCTHROTTLEMAX`. OEM “quiet” Balanced plans leave it at **99%** or **80%**. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, core parking, Processor performance boost mode, and Intel Speed Shift EPP can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. **Maximum processor state** is a hard percent cap on P-states. That is `PROCTHROTTLEMAX`. Forum folklore drops it to 99 to kill turbo without touching `PERFBOOSTMODE`. OEM “Cool” / “Quiet” / “Battery” Balanced plans drop it to 50–80 and stay selected after the laptop is docked. Enabled boost under a 99% ceiling is still a capped desk. EPP 0 under an 80% ceiling is still a capped desk. Floor 100 under a 99 ceiling is still a cap. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The ceiling was 99.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. `CPMINCORES` can still be 100. `PERFBOOSTMODE` can still be Enabled. `PERFEPP` can still be 0. The throttle ceiling is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html). Floor, not ceiling. |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html). Unparked cores, not a P-state cap. |
| Boost mode is Disabled; clocks sit at base | [processor-boost-mode](processor-boost-mode.html). Turbo allow, not the percent ceiling. |
| Boost Enabled; clocks sit mid-range; PERFEPP is 60–70 | [intel-speed-shift-epp](intel-speed-shift-epp.html). Hardware hint, not a hard cap. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state 100, parking 100, boost Enabled, EPP 0. Session awake. Named task Ready / 267009. Grok TUI looks frozen. Task Manager clocks never take the top bin. Maximum processor state on AC is 99 or 80 | **This page** |
| PROCTHROTTLEMAX already 100 on AC; package still will not hold clocks | Different layer. Firmware / PL1 / closed-lid thermal is not this click. Do not invent a registry paste here. |

Do not set Maximum processor state as the first click on a new host. 100 on AC is the pass. 99 is not “almost 100.” 99 is a quiet-turbo trick that leaves boost Enabled.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm the four sibling processor knobs are already honest on AC — Minimum processor state 100, core parking min cores 100, Processor performance boost mode Enabled, Intel Speed Shift EPP 0 for every alias that exists. If any of those is still a travel default, that is [min-state](processor-min-state-ac.html), [core parking](processor-core-parking.html), [boost mode](processor-boost-mode.html), or [Speed Shift EPP](intel-speed-shift-epp.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Maximum processor state**.
4. Set **Plugged in** to **100%**. On battery may stay 80 or 99 if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Do not leave 99% as a quiet-turbo trick. 99 under Enabled boost is still a cap. If the intent is to deny turbo, that is [boost mode](processor-boost-mode.html) Disabled, not a 99 ceiling on a forever desk.
6. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm. `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg /setactive SCHEME_CURRENT
```

`SUB_PROCESSOR` is the processor subgroup. `PROCTHROTTLEMAX` is Maximum processor state. Units are percent. **100 on AC is the pass** for this desk. Query again. Current AC Power Setting Index `0x00000064` is 100. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as 100. If powercfg also omits the alias, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. `PROCTHROTTLEMIN` is a sibling, not this click. `PERFBOOSTMODE` is a sibling, not this click. `PERFEPP` is a sibling, not this click. `CPMINCORES` is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Parking 100. Boost Enabled. EPP 0. Otherwise this soak is lying about the ceiling.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. Task Manager Performance does not sit under a 99/80 software cap the entire soak while `grok.exe` is the foreground session.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with PROCTHROTTLEMAX 99 is not forever.
4. Maximum processor state still 100 on AC. If someone set 99 to “kill turbo quietly,” restore 100. If the intent is no turbo, that is boost mode, not this row. Do not “fix” it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the ceiling is already 100.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html). Floor, not ceiling.
- Not core parking. That is [processor-core-parking](processor-core-parking.html).
- Not Processor performance boost mode. That is [processor-boost-mode](processor-boost-mode.html).
- Not Intel Speed Shift / EPP. That is [intel-speed-shift-epp](intel-speed-shift-epp.html).
- Not the Task Manager Details “Power throttling” column. Process overlay, not `PROCTHROTTLEMAX`.
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
31consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
