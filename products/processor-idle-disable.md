# Processor idle disable vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-idle-disable.html

Companion to [processor boost mode](processor-boost-mode.html) and [processor min-state](processor-min-state-ac.html). Frequency floor, unparked cores, Enabled turbo, and Active fans can already be honest on AC and the named task still looks frozen after a quiet stretch. This pack is C-states, not P-states: **Processor power management → Processor idle disable**. That is `IDLEDISABLE`. **Enable idle** (0) lets the package drop into C1/C6/C7/C10. Wake from a deep C-state looks like a hung Grok CLI. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, core parking, boost mode, and cooling policy can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. Windows still lets the package enter ACPI C-states when there is no runnable work. That is `IDLEDISABLE` = 0, the default: **Enable idle**. C0 is executing. C1 is Halt. C6/C7/C10 are package sleep. Coming back from a package C-state is not Modern Standby. It is a wake stall. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The package was in C7.

This is not a P-state lie. `PROCTHROTTLEMIN` 100% of C0 does nothing if the core is not in C0. `PERFBOOSTMODE` Enabled does nothing in C6. Intel Speed Shift / EPP is a hardware P-state hint, not a C-state deny. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. The idle-allow is the liar.

This is also not [hard disk idle timeout](hard-disk-idle-timeout.html). That is `DISKIDLE`, a spindle timeout. The words “idle disable” are not that row.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not systemd.

## C-states are not P-states
| Layer | What it actually is |
|---|---|
| Minimum processor state | P-state floor. `PROCTHROTTLEMIN`. How slow C0 is allowed to run. |
| Core parking | Logical-processor count. `CPMINCORES`. Parked is not C7. |
| Processor performance boost mode | Turbo P-state allow. `PERFBOOSTMODE`. Only applies while executing. |
| Intel Speed Shift / EPP | HWP energy-performance hint. `PERFEPP`. Still a P-state bias. |
| Processor idle disable | C-state allow. `IDLEDISABLE`. 0 = Enable idle. 1 = Disable idle (stay C0). |

A parked core is a scheduling decision. A C-state is an idle residency. Task Manager “Parked” is the parking page. Do not diagnose C7 with the parking column.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Fans stay quiet, frequency drops, closed lid | [system-cooling-policy](system-cooling-policy.html) |
| Boost mode is Disabled; clocks sit at base while executing | [processor-boost-mode](processor-boost-mode.html) |
| SATA / USB disk spun down after AHCI LPM is already Active | [hard-disk-idle-timeout](hard-disk-idle-timeout.html). DISKIDLE is not IDLEDISABLE. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state 100, parking 100, boost Enabled, cooling Active. Session awake. Named task Ready / 267009. Grok TUI looks frozen after a quiet stretch, then snaps back. IDLEDISABLE on AC is 0 (Enable idle) | **This page** |
| IDLEDISABLE already 1 on AC; package still drops C-states | Different layer. Firmware Package C-state / C1E is not this click. Do not invent a registry paste here. |

Do not set Processor idle disable as the first click on a new host. Disable idle keeps the package in C0 — watts and heat go up. Active cooling and a stand under a closed lid are prerequisites. Leave DC on Enable idle if the laptop actually travels. If the alias is missing from powercfg, stop; do not invent a registry hack on a public page.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here. C-state deny is not a substitute for Sleep never.
2. Confirm Minimum processor state, core parking min cores, Processor performance boost mode, and System cooling policy are already honest on AC — 100 / 100 / Enabled / Active. If any of those is still a travel default, that is [min-state](processor-min-state-ac.html), [core parking](processor-core-parking.html), [boost mode](processor-boost-mode.html), or [cooling policy](system-cooling-policy.html), not this page. Disable idle on a 5% floor is just a hot slow desk.
3. Query `IDLEDISABLE` before you write. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not Disable idle. The GUI often hides this row on Balanced. If powercfg also omits the alias, this firmware or edition did not expose the knob. **Stop.** Do not invent a registry paste. Do not guess GUID `5d76a2ca-e8c0-402f-a133-2158492d58ad` from a forum and unhide it as a fleet trick. Do not cargo-cult `-ATTRIB_HIDE` on a public page.
4. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor idle disable**.
5. Set **Plugged in** to **Disable idle**. That is index **1**. On battery stays **Enable idle** (0) if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
6. Activate the current scheme after the AC index write. `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. AC Current AC Power Setting Index `0x00000001` is the pass. `0x00000000` is still Enable idle — a fail for this desk.
7. Leave Processor idle promote / demote thresholds alone. `IDLEPROMOTE` and `IDLEDEMOTE` are siblings that change how fast Windows walks C-state depth. This page is the allow/deny, not a threshold tweak. Processor idle state maximum is also a sibling: a depth cap, not Disable idle.
8. Leave the current plan in place. This is one processor knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
9. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 1
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

`SUB_PROCESSOR` is the processor subgroup. `IDLEDISABLE` is Processor idle disable. Typical values: **0 = Enable idle** (C-states allowed), **1 = Disable idle** (stay C0). 1 on AC is the pass for this desk. Run the `/query` line first. If the alias is omitted, skip the `/setacvalueindex` line — do not invent a registry hack. Intel Speed Shift / EPP is a sibling, not this click. Promote/demote thresholds are siblings, not this click. BIOS Package C-state / C1E is firmware, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Parking 100. Boost Enabled. Cooling Active. Stand in the path. Otherwise this soak is lying — and Disable idle will only add heat.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input on the first keystroke. A session that paints once a minute then takes a beat to “wake the CPU” after quiet is a fail on this page even if `grok.exe` never exited.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with Enable idle (0) is not forever. A 5-minute pulse that fires late because the package was in C10 is this layer, not a missed `schtasks` trigger.
4. IDLEDISABLE still 1 on AC. If someone set Enable idle to "save watts," restore Disable idle on AC. Do not "fix" it by switching the whole plan to High performance. Do not Disable idle on DC as a cargo-cult.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof C-states are already denied. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not core parking. That is [processor-core-parking](processor-core-parking.html).
- Not Processor performance boost mode. That is [processor-boost-mode](processor-boost-mode.html).
- Not Intel Speed Shift / EPP and not heterogeneous scheduling.
- Not Processor idle promote / demote thresholds and not Processor idle state maximum.
- Not a BIOS Package C-state / C1E essay.
- Not [hard disk idle timeout](hard-disk-idle-timeout.html). DISKIDLE is a spindle, not CPU C-states.
- Not system cooling policy. That is [system-cooling-policy](system-cooling-policy.html). Prerequisite, not this click.
- Not a High-performance plan essay. One processor setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
31consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
