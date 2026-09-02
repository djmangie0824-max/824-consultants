# Processor power throttling vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-power-throttling.html

Companion to [processor min-state](processor-min-state-ac.html) and [processor boost mode](processor-boost-mode.html). Frequency floor, unparked cores, Enabled turbo, and Active fans can already be honest on AC and the named task still looks frozen. This pack is the remaining software ceiling: **Processor power management → Maximum processor state**. That is `PROCTHROTTLEMAX`. OEM “quiet” Balanced plans leave it at **99%** or **80%**. Grok CLI looks hung. Task Scheduler still shows Ready.

This is not Processor idle disable. Not Intel Speed Shift EPP. Not [system cooling policy](system-cooling-policy.html). Not systemd.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, core parking, boost mode, and cooling policy can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. **Maximum processor state** is a different row in the same processor subgroup. It is a hard percent cap on P-states, not a hint. OEM “Cool” / “Quiet” / “Battery” Balanced plans drop it to 50–80. Forum folklore drops it to 99 to kill turbo without touching `PERFBOOSTMODE`. Enabled boost under a 99% ceiling is still a capped desk. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The ceiling was 99.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. `PERFBOOSTMODE` can still be Enabled. `SYSCOOLPOL` can still be Active. Processor idle disable can still be the default. Intel Speed Shift EPP can still be 0. The throttle ceiling is the liar.

Do not confuse this PPM row with Windows EcoQoS “Power throttling” of background apps. That is a process overlay (Task Manager Details column), not `PROCTHROTTLEMAX`.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Fans stay quiet, frequency drops, closed lid | [system-cooling-policy](system-cooling-policy.html) |
| Boost mode is Disabled; clocks sit at base | [processor-boost-mode](processor-boost-mode.html) |
| C-state residency / Processor idle disable is the remaining starve | Different layer. Idle disable is not this click. Do not invent a registry paste here. |
| PERFEPP / Intel Speed Shift still biases watts after the ceiling is 100 | Different layer. Speed Shift EPP is a hint, not a percent cap. Not this click. |
| Task Manager Details shows Power throttling Enabled on grok.exe while PROCTHROTTLEMAX is already 100 | Different layer. EcoQoS process overlay. Not this PPM row. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state 100, parking 100, boost Enabled, cooling Active. Session awake. Named task Ready / 267009. Grok TUI looks frozen. Task Manager clocks never leave a mid-range cap. Maximum processor state is 99 or 80 | **This page** |
| PROCTHROTTLEMAX already 100 on AC; package still will not hold clocks | Different layer. Firmware / PL1 / closed-lid thermal is not this click. Do not invent a registry paste here. |

Do not set Maximum processor state as the first click on a new host. 100 on AC is the pass. 99 is not “almost 100” — it is the turbo-cap trick.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Minimum processor state, core parking min cores, Processor performance boost mode, and System cooling policy are already honest on AC — 100 / 100 / Enabled / Active. If any of those is still a travel default, that is [min-state](processor-min-state-ac.html), [core parking](processor-core-parking.html), [boost mode](processor-boost-mode.html), or [cooling policy](system-cooling-policy.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Maximum processor state**.
4. Set **Plugged in** to **100%**. On battery may stay 50–80 if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Do not leave 99%. 99 is the folklore turbo kill. It is a fail on this page even when boost mode reads Enabled. Do not “save the Ultra 7” with 99. Thermal policy is [cooling policy](system-cooling-policy.html) plus a [cooling stand](../reviews/laptop-cooling-stand-14h.html), not a software cap.
6. Leave Minimum processor state at 100% on AC. This page is the ceiling, not the floor. Raising max while min is still 5% is a lie.
7. Leave Processor idle disable and Intel Speed Shift EPP alone on this click. C-state residency and HWP hints are siblings. Do not paste those GUIDs here. Do not claim this row is EcoQoS Power throttling.
8. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
9. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

`SUB_PROCESSOR` is the processor subgroup. `PROCTHROTTLEMAX` is Maximum processor state. Units are percent. **100 on AC is the pass** for this desk. `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. Current AC Power Setting Index `0x00000064` is 100. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as 100. If powercfg also omits the alias, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. Processor idle disable is a sibling, not this click. Intel Speed Shift EPP is a sibling, not this click. EcoQoS process throttling is a sibling overlay, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Parking 100. Boost Enabled. Cooling Active. Otherwise this soak is lying.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. Task Manager Performance does not sit under a 99% or 80% cap the entire soak while `grok.exe` is the foreground session.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a 99% ceiling is not forever.
4. Maximum processor state still 100% on AC. If someone set 99 to "disable turbo quietly," restore 100. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the ceiling is already 100. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not Processor idle disable. C-state residency is a sibling, not this click.
- Not Intel Speed Shift / EPP. A 0–100 HWP hint is not a hard percent cap.
- Not system cooling policy. That is [system-cooling-policy](system-cooling-policy.html).
- Not Processor performance boost mode. Enabled turbo under a 99% cap is still this page's fail. See [processor-boost-mode](processor-boost-mode.html).
- Not Windows EcoQoS Power throttling of background apps. That column in Task Manager is a process overlay.
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
