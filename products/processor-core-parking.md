# Processor core parking vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-core-parking.html

Companion to [processor min-state](processor-min-state-ac.html). Frequency floor can already be 100% on AC and the named task still looks frozen. This pack is the remaining unparked-core floor: **Processor power management → Processor performance core parking min cores**. That is `CPMINCORES`. Balanced AC can leave that row at 10% or 0%. Windows parks cores. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, and Minimum processor state can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. **Processor performance core parking min cores** on AC can still be 10 percent or 0. That is `CPMINCORES`. Windows is allowed to park most logical processors so a 12-core Ultra 7 is running on a sliver while `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. Cores were parked.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. The parking policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| DISPLAY / SYSTEM / AWAYMODE holder is not None | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Fans stay quiet, frequency drops, closed lid | Different layer. System cooling policy is not this page. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state already 100% on AC. Session awake. Named task Ready / 267009. Grok TUI looks frozen. Task Manager shows most cores Parked | **This page** |
| CPMINCORES already 100% on AC; hybrid P/E scheduling still starves the TUI | Different layer. Heterogeneous thread scheduling is not this page. Do not invent a registry paste here. |

Do not set core parking min cores to 100% as the first click on a new host.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Minimum processor state is already 100% on AC. If that row is still 5%, that is [processor min-state](processor-min-state-ac.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor performance core parking min cores**.
4. Set **Plugged in** to **100%**. On battery may stay lower if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave **Processor performance core parking max cores** at **100%** on AC. This page does not cap the ceiling. Do not drop Maximum cores to "save the Ultra 7".
6. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR
powercfg /a
```

`SUB_PROCESSOR` is the processor subgroup. `CPMINCORES` is Processor performance core parking min cores. 100 on AC is the pass for this desk: Windows may not park below 100% of cores. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as 100. If powercfg also omits the alias, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. Heterogeneous thread scheduling is a sibling, not this click. System cooling policy is a sibling, not this click. Intel Speed Shift / EPP is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Minimum processor state already 100% on AC. Otherwise this soak is lying.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. Task Manager Performance does not show most cores Parked while `grok.exe` is the foreground session.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with cores parked is not forever.
4. Core parking max cores still 100% on AC. If someone dropped the ceiling, that is a different mistake — restore it. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof cores are already unparked.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not powercfg /requests. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not system cooling policy, not heterogeneous scheduling, not Intel Speed Shift.
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
