# Processor performance boost mode vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-boost-mode.html

Companion to [system cooling policy](system-cooling-policy.html) and [processor min-state](processor-min-state-ac.html). Frequency floor, unparked cores, and Active fans can already be honest on AC and the named task still looks frozen. This pack is the remaining turbo allow: **Processor power management → Processor performance boost mode**. That is `PERFBOOSTMODE`. **Disabled** leaves an Ultra 7 on base clocks. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, core parking, and cooling policy can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Some OEM “quiet” Balanced plans set **Processor performance boost mode** to Disabled. That is `PERFBOOSTMODE` = 0. Windows may not enter turbo P-states. Minimum processor state 100% of a non-turbo ceiling is still a slow ceiling. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. Turbo was off.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. `CPMINCORES` can still be 100. `SYSCOOLPOL` can still be Active. The boost policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Fans stay quiet, frequency drops, closed lid | [system-cooling-policy](system-cooling-policy.html) |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state, parking, and Active cooling already honest on AC. Session awake. Named task Ready / 267009. Grok TUI looks frozen. Task Manager clocks stay at base. Boost mode is Disabled | **This page** |
| PERFBOOSTMODE already Enabled; package still will not turbo | Different layer. Firmware / Intel Speed Shift / EPP is not this click. Do not invent a registry paste here. |

Do not set boost mode as the first click on a new host. Enabled on AC is the pass. Aggressive is a soak upgrade, not the opening move on a sealed Ultra 7.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Minimum processor state, core parking min cores, and System cooling policy are already honest on AC — 100 / 100 / Active. If any of those is still a travel default, that is [min-state](processor-min-state-ac.html), [core parking](processor-core-parking.html), or [cooling policy](system-cooling-policy.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor performance boost mode**.
4. Set **Plugged in** to **Enabled**. On battery may stay Efficient Enabled or Disabled if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Do not start at Aggressive. Enabled is the pass. If a 30-minute soak still shows base clocks with cooling already Active and a stand in the path, then Aggressive. Aggressive on a Passive cooling policy is just a louder thermal lie.
6. Leave Efficient Enabled / Efficient Aggressive alone on AC. Those modes bias energy over turbo. They are not the AC pass for this desk.
7. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR
powercfg /a
```

`SUB_PROCESSOR` is the processor subgroup. `PERFBOOSTMODE` is Processor performance boost mode. Typical values: **0 = Disabled**, **1 = Enabled**, **2 = Aggressive**, **3 = Efficient Enabled**, **4 = Efficient Aggressive**. Enabled on AC is the pass for this desk. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Enabled. If powercfg also omits the alias, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. Intel Speed Shift / EPP is a sibling, not this click. Heterogeneous thread scheduling is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Parking 100. Cooling Active. Otherwise this soak is lying.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. Task Manager Performance does not sit on base clocks the entire soak while `grok.exe` is the foreground session.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with turbo Disabled is not forever.
4. Boost mode still Enabled (or Aggressive after a named soak) on AC. If someone set Efficient to "save watts," restore Enabled. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof turbo is already allowed.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not core parking. That is [processor-core-parking](processor-core-parking.html).
- Not system cooling policy. That is [system-cooling-policy](system-cooling-policy.html).
- Not Intel Speed Shift / EPP and not heterogeneous scheduling.
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
