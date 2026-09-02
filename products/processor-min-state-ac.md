# Processor minimum state vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-min-state-ac.html

Companion to [powercfg /requests](powercfg-requests-blockers.html) and [sleep vs forever](windows-sleep-vs-forever.html). Timeouts can already be honest and the named task still looks frozen. This pack is the remaining CPU floor: **Processor power management → Minimum processor state**. Balanced AC defaults that row to 5%. Windows parks performance. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, and wake timers can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Balanced **Minimum processor state** on AC is 5 percent. That is `PROCTHROTTLEMIN`. Windows is allowed to drop frequency and park work so an idle-looking Grok CLI starves while `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The floor was 5 percent.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. The CPU policy is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.md) |
| DISPLAY / SYSTEM / AWAYMODE holder is not None | [powercfg-requests-blockers](powercfg-requests-blockers.html) |
| Multimedia sharing Prevent / Away Mode | [multimedia-sharing-sleep](multimedia-sharing-sleep.html) |
| Task Enabled, next-run in the past, machine slept | [wake-timers-forever](wake-timers-forever.html) |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Session still awake. Named task Ready / 267009. Grok TUI or `grok.exe` looks frozen, CPU near idle | **This page** |
| Minimum processor state already 100% on AC; cores still park to zero | Different layer. Core parking is not this page. Do not invent a registry paste here. |

Do not set Minimum processor state to 100% as the first click on a new host.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm `powercfg /requests` is not a named holder. If DISPLAY, SYSTEM, or AWAYMODE is not None, that is [powercfg /requests](powercfg-requests-blockers.html), not this page.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Minimum processor state**.
4. Set **Plugged in** to **100%**. On battery may stay 5% if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
5. Leave **Maximum processor state** at **100%** on AC. This page does not cap the ceiling. Do not drop Maximum to "save the Ultra 7".
6. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR
powercfg /a
```

`SUB_PROCESSOR` is the processor subgroup. `PROCTHROTTLEMIN` is Minimum processor state. 100 on AC is the pass for this desk. If the row is missing, this firmware or edition did not expose the knob — stop; do not invent a registry hack on a public page. Hidden is not the same as 100. Core parking (`CPMINCORES`) is a sibling, not this click. System cooling policy is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Otherwise this soak is lying.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. A session that paints but never completes a tool call because the floor is 5% is a fail on this page.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a 5% floor is not forever.
4. Maximum processor state still 100% on AC. If someone dropped the ceiling, that is a different mistake — restore it. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the floor is already 100.

## What this page is not
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not powercfg /requests. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not When sharing media. That is [multimedia-sharing-sleep](multimedia-sharing-sleep.html).
- Not core parking and not Intel Speed Shift. Those are different processor rows.
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
