# Intel Speed Shift / energy performance preference vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/intel-speed-shift-epp.html

Companion to [processor boost mode](processor-boost-mode.html), [processor min-state](processor-min-state-ac.html), [core parking](processor-core-parking.html), and [system cooling policy](system-cooling-policy.html). Frequency floor, unparked cores, Enabled turbo, and Active fans can already be honest on AC and the named task still looks frozen between Grok bursts. This pack is the remaining Intel Speed Shift bias: **Processor power management → Processor energy performance preference**. That is `PERFEPP` (and `PERFEPP1` for Processor 1 on hybrid packages). The scale is 0–100. It is not a percent of clocks. **0 = performance. 100 = efficiency.** Typical Balanced AC is 60–70. An Ultra 7 still prefers watts. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, core parking, Processor performance boost mode (`PERFBOOSTMODE`), and cooling policy can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Intel Speed Shift (hardware-controlled P-states / HWP) still reads an Energy Performance Preference. Windows does not request each P-state on that path. Windows hands the silicon a 0–100 hint. Balanced typically leaves that row at 60–70 on AC. An Interactive Grok CLI is bursty: a paint, a wait, a paint. HWP treats the wait as idle. Hardware still holds the package in an efficiency bias. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died and opens a fourth TUI. EPP was 60.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. `CPMINCORES` can still be 100. `PERFBOOSTMODE` can still be Enabled — that only *permits* turbo. Speed Shift still decides whether the package *takes* it. `SYSCOOLPOL` can still be Active. The Speed Shift hint is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not systemd.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html). Floor, not HWP bias. |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html). Unparked cores, not EPP. |
| Fans stay quiet, frequency drops, closed lid | [system-cooling-policy](system-cooling-policy.html). Thermal, not Speed Shift. |
| Boost mode is Disabled; clocks sit at base | [processor-boost-mode](processor-boost-mode.html). Turbo allow, not EPP. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state 100, parking 100, boost Enabled, cooling Active. Session awake. Named task Ready / 267009. Grok TUI looks frozen between bursts. Task Manager clocks sit mid-range. PERFEPP on AC is 60–70 | **This page** |
| PERFEPP already 0 on AC; package still will not hold performance | Different layer. Firmware Speed Shift disabled, or heterogeneous scheduling. Not this click. Do not invent a registry paste here. |

Do not set EPP as the first click on a new host. 0 on AC is the pass for this desk. Leave DC alone if the laptop actually travels. If a GUID row is missing from powercfg, stop; do not invent a registry hack on a public page. Do not guess a BIOS walkthrough from a forum.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm the four sibling processor knobs are already honest on AC — Minimum processor state 100, core parking min cores 100, Processor performance boost mode Enabled, System cooling policy Active. If any of those is still a travel default, that is [min-state](processor-min-state-ac.html), [core parking](processor-core-parking.html), [boost mode](processor-boost-mode.html), or [cooling policy](system-cooling-policy.html), not this page.
3. Query both Speed Shift aliases before you write. `PERFEPP` is Processor energy performance preference (typical P-core / package hint). `PERFEPP1` is Processor energy performance preference for Processor 1 (typical hybrid / E-core class). If a row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as 0. If powercfg also omits the alias, this firmware or edition did not expose HWP to Windows. **Stop.** Do not invent a registry paste. Do not guess a GUID from a forum. Do not write a BIOS Speed Shift essay on this public page.
4. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor energy performance preference**.
5. Set **Plugged in** to **0**. Repeat for Processor 1 if that row exists. On battery may stay 60–70 if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
6. Do not confuse 0 with Aggressive boost. EPP 0 is a 0–100 HWP bias. Aggressive is a `PERFBOOSTMODE` value on the [boost mode](processor-boost-mode.html) page. Zero EPP does not replace Enabled turbo. Enabled turbo does not replace zero EPP.
7. Activate the current scheme after the AC index write. `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. AC Current AC Power Setting Index `0x00000000` is the pass for every alias that exists.
8. Leave the current plan in place. This is two processor knobs, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
9. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR PERFEPP
powercfg /query SCHEME_CURRENT SUB_PROCESSOR PERFEPP1
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFEPP 0
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFEPP1 0
powercfg /setactive SCHEME_CURRENT
```

`SUB_PROCESSOR` is the processor subgroup. `PERFEPP` is Processor energy performance preference. `PERFEPP1` is Processor energy performance preference for Processor 1. Intel Speed Shift EPP is a 0–100 HWP hint: **0 = performance**, **100 = efficiency**. Typical Balanced AC is 60–70. 0 on AC is the pass for this desk. Run the two `/query` lines first. If either alias is omitted, skip that `/setacvalueindex` line — do not invent a registry hack. Writing only `PERFEPP` and leaving `PERFEPP1` at 60 on a hybrid Ultra 7 is a half-fix. Heterogeneous thread scheduling is a sibling, not this click. `PERFBOOSTMODE` is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Parking 100. Boost Enabled. Cooling Active. Otherwise this soak is lying about Speed Shift.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input *between* bursts. Task Manager Performance does not sit in an efficiency-biased mid-range the entire soak while `grok.exe` is the foreground session.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with PERFEPP 60 is not forever.
4. EPP still 0 on AC for every alias that exists. If someone set 50 to "save watts," restore 0. If only `PERFEPP` is 0 and `PERFEPP1` is still 60, that is not a pass on a hybrid package. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof Speed Shift is already performance-biased. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not core parking. That is [processor-core-parking](processor-core-parking.html).
- Not Processor performance boost mode. That is [processor-boost-mode](processor-boost-mode.html).
- Not system cooling policy. That is [system-cooling-policy](system-cooling-policy.html).
- Not heterogeneous scheduling and not a BIOS Speed Shift essay.
- Not a High-performance plan essay. Two processor settings.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. Brokerage numbers stay off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
