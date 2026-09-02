# System cooling policy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/system-cooling-policy.html

Companion to [processor min-state](processor-min-state-ac.html) and [core parking](processor-core-parking.html). Frequency floor and unparked cores can already be 100% on AC and the named task still looks frozen. This pack is the remaining thermal policy: **Processor power management → System cooling policy**. That is `SYSCOOLPOL`. **Passive** throttles the CPU before it spins fans. Closed-lid Grok looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, and core parking can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Balanced **System cooling policy** on AC is often Passive. That is `SYSCOOLPOL` = 0. Windows is allowed to drop frequency to keep fans quiet instead of spinning them. A cooling stand under a closed lid does not help if the policy never asks the fans to run. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The policy was Passive.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. `CPMINCORES` can still be 100. The cooling policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Gel pillow or blocked intake under a closed lid | [laptop-cooling-stand-14h](../reviews/laptop-cooling-stand-14h.html). Hardware, not this policy. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state and core parking already 100% on AC. Session awake. Named task Ready / 267009. Grok TUI looks frozen. Fans stayed quiet. Frequency dropped | **This page** |
| SYSCOOLPOL already Active on AC; package still thermal-throttles under a sealed chassis | Different layer. Firmware / chassis, not this click. Do not invent a registry paste here. |

Do not set System cooling policy to Active as the first click on a new host.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Minimum processor state and core parking min cores are already 100% on AC. If either row is still a travel default, that is [min-state](processor-min-state-ac.html) or [core parking](processor-core-parking.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **System cooling policy**.
4. Set **Plugged in** to **Active**. On battery may stay Passive if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
6. Keep the cooling stand in the path. Active policy asks the fans to run. A blocked intake still throttles. That is the [cooling-stand](../reviews/laptop-cooling-stand-14h.html) page, not a second policy click.
7. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR
powercfg /a
```

`SUB_PROCESSOR` is the processor subgroup. `SYSCOOLPOL` is System cooling policy. **1 = Active**, **0 = Passive**. Active on AC is the pass for this desk: Windows may spin fans before it throttles. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Active. If powercfg also omits the alias, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. Core parking is a sibling, not this click. Minimum processor state is a sibling, not this click. Intel Speed Shift / EPP is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Minimum processor state already 100% on AC. Core parking min cores already 100% on AC. Otherwise this soak is lying.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. Fans are allowed to run. A session that paints but never completes a tool call because Passive kept the package throttled is a fail on this page.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with Passive thermal throttle is not forever.
4. Policy still Active on AC after the soak. If someone flipped it back to Passive to "keep the office quiet", restore it. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof cooling policy is already Active.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not core parking. That is [processor-core-parking](processor-core-parking.html).
- Not a cooling-stand SKU. That is [laptop-cooling-stand-14h](../reviews/laptop-cooling-stand-14h.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
