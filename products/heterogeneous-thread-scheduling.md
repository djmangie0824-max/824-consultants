# Heterogeneous thread scheduling vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/heterogeneous-thread-scheduling.html

Companion to [processor core parking](processor-core-parking.html) and [processor min-state](processor-min-state-ac.html). Frequency floor and unparked cores can already be honest on AC and the named task still looks frozen. This pack is the remaining hybrid class pick on an Intel Core Ultra 7 P/E package: **Processor power management → Heterogeneous thread scheduling policy** and **Heterogeneous short running thread scheduling policy**. Those are `SCHEDPOLICY` and `SHORTSCHEDPOLICY`. Balanced **Automatic** (5) lets Windows dump an Interactive Grok CLI onto E-cores. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Fast Startup, USB, wake timers, Minimum processor state, core parking, and boost mode can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. An Ultra 7 is not twelve equal cores. It is P-cores and E-cores. Windows hybrid scheduling still picks a class. Typical Balanced AC leaves both rows at Automatic. That is index 5. Automatic is QoS-aware. A Grok TUI that paints once a minute, plus short JSON tool bursts, looks like short work. Short work lands on E-cores. P-cores sit idle. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The class pick was Automatic.

This is not sleep. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. `PROCTHROTTLEMIN` can still be 100. `CPMINCORES` can still be 100. The hybrid scheduler is the liar.

This is not Processor power throttling. EcoQoS / Efficiency Mode (green leaf in Task Manager) is a process tag. `SCHEDPOLICY` is the plan-level P/E class pick. Different lever.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Not systemd.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Minimum processor state still 5% on AC | [processor-min-state-ac](processor-min-state-ac.html) |
| Task Manager shows most cores Parked | [processor-core-parking](processor-core-parking.html) |
| Fans stay quiet, frequency drops, closed lid | [system-cooling-policy](system-cooling-policy.html) |
| Boost mode is Disabled; clocks sit at base | [processor-boost-mode](processor-boost-mode.html) |
| Task Manager shows a green leaf / Efficiency Mode on `grok.exe` | Different layer. Processor power throttling / EcoQoS is not this page. Do not invent a registry paste here. |
| USB NIC / dock / radio dropped | USB / PCIe / Wi-Fi playbooks. Wrong page. |
| Min-state 100, parking 100, boost Enabled. Session awake. Named task Ready / 267009. Grok TUI looks frozen. P-cores idle. E-cores take the process. SCHEDPOLICY / SHORTSCHEDPOLICY on AC is Automatic (5), Prefer efficient (4), or Efficient (3) | **This page** |
| Both policies already Prefer performant (2) on AC; package still starves | Different layer. Firmware / Thread Director / EcoQoS is not this click. Do not invent a registry paste here. |

Do not set heterogeneous scheduling as the first click on a new host. Prefer performant processors (2) on AC is the pass. Performant processors only (1) is a soak upgrade, not the opening move. If a GUID row is missing from powercfg, stop; do not invent a registry hack on a public page.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. Fast Startup is already honest. See [sleep-vs-forever](windows-sleep-vs-forever.html) and [lid-close](lid-close-do-nothing.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm Minimum processor state and core parking min cores are already 100% on AC. If either row is still a travel default, that is [min-state](processor-min-state-ac.html) or [core parking](processor-core-parking.html), not this page. Parking unparks a core. This page decides P versus E after the core is allowed to run.
3. Query both aliases before you write. `SCHEDPOLICY` is Heterogeneous thread scheduling policy (long-running threads). `SHORTSCHEDPOLICY` is Heterogeneous short running thread scheduling policy. Both are hidden by default. If a row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Prefer performant. If powercfg also omits the alias, this firmware or edition did not expose the knob. **Stop.** Do not invent a registry paste. Do not guess a GUID from a forum. Do not unhide a missing alias.
4. Power Options → Change plan settings → Change advanced power settings → **Processor power management → Heterogeneous thread scheduling policy**. Set **Plugged in** to **Prefer performant processors**. Repeat for **Heterogeneous short running thread scheduling policy**.
5. On battery may stay Automatic or Prefer efficient if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
6. Do not start at Performant processors (1). That is a hard constraint to P-cores only. Prefer performant (2) is the pass: P-cores first, overflow allowed. If a 30-minute soak still shows `grok.exe` as E-core-only with parking already 100, then 1. Do not open with Efficient processors (3).
7. Leave All processors (0) alone as the opening move. 0 is no class preference. On an Ultra 7 that is not the same as Prefer performant. Automatic (5) is the Balanced liar. Do not “fix” Automatic by renaming the plan to High performance.
8. Activate the current scheme after the AC index write. `/setacvalueindex` does not apply until `/setactive SCHEME_CURRENT`. Query again. AC Current AC Power Setting Index `0x00000002` is the pass for both rows that exist.
9. Leave the current plan in place. This is two processor knobs, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
10. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PROCESSOR SCHEDPOLICY
powercfg /query SCHEME_CURRENT SUB_PROCESSOR SHORTSCHEDPOLICY
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR SCHEDPOLICY 2
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR SHORTSCHEDPOLICY 2
powercfg /setactive SCHEME_CURRENT
```

`SUB_PROCESSOR` is the processor subgroup. `SCHEDPOLICY` is Heterogeneous thread scheduling policy. `SHORTSCHEDPOLICY` is Heterogeneous short running thread scheduling policy. Microsoft indexes: **0 = All processors**, **1 = Performant processors**, **2 = Prefer performant processors**, **3 = Efficient processors**, **4 = Prefer efficient processors**, **5 = Automatic**. Prefer performant (2) on AC is the pass for this desk. Run the two `/query` lines first. If either alias is omitted, skip that `/setacvalueindex` line — do not invent a registry hack. Optional GUI unhide after the query proves the alias exists: `powercfg -attributes SUB_PROCESSOR SCHEDPOLICY -ATTRIB_HIDE` and the same for `SHORTSCHEDPOLICY`. Unhide is not a substitute for the index write. Core parking is a sibling, not this click. Minimum processor state is a sibling, not this click. Processor power throttling / EcoQoS is a sibling, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. Lid already Do nothing on AC. `powercfg /requests` already None. Min-state 100. Parking 100. Otherwise this soak is lying.
2. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. The Grok TUI still accepts input. Task Manager Performance does not show P-cores idle while `grok.exe` is the foreground session sitting on the E-core class.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with Automatic (5) on a hybrid package is not forever.
4. Both aliases that exist still read 2 on AC. If someone set Automatic or Prefer efficient to "save watts," restore 2. Do not "fix" it by switching the whole plan to High performance.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the class pick is already Prefer performant. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not Minimum processor state. That is [processor-min-state-ac](processor-min-state-ac.html).
- Not core parking. That is [processor-core-parking](processor-core-parking.html).
- Not Processor performance boost mode. That is [processor-boost-mode](processor-boost-mode.html).
- Not system cooling policy. That is [system-cooling-policy](system-cooling-policy.html).
- Not Processor power throttling / EcoQoS / Efficiency Mode. Different lever. Do not paste `PowerThrottlingOff` here.
- Not `HETEROPOLICY`, not Short thread runtime threshold, not a BIOS Thread Director essay.
- Not a High-performance plan essay. Two processor settings.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
