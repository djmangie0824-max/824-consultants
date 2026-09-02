# Processor performance decrease threshold vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-perf-decrease-threshold.html

Companion to [Processor performance increase threshold](processor-perf-increase-threshold.html) and [Processor min state](processor-min-state-ac.html). Min/max are floors and ceilings. Boost is turbo policy. Parking is core count. Idle disable is C-state. Increase threshold is the percent busy that must be crossed *upward* before Windows steps a P-state up. This pack is the remaining percent: **Processor power management → Processor performance decrease threshold**. GUID `12a0ab44-fe28-4fa9-b3bd-4b64f44960a6`. Alias `PERFDECTHRESHOLD`. Units are percent. Balanced default on this class of image is often **20% AC / 30% DC**. When utilization drops below that percent, Windows steps a P-state *down*. A 5-minute Grok pulse with a quiet gap looks like 20%. The next token waits on a ramp. Task Scheduler still shows Ready. The decrease percent is not the increase percent.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Min state on AC can already be 100. Max state can already be 100. Boost can already be Enabled. Parking can already be unparked. Increase threshold can already be lowered. A ship still hitch-pauses on the first inference after a quiet 20 seconds. `grok.exe` is still running. `schtasks` still prints Ready and last result 267009. The operator thinks the model stalled. Processor performance decrease threshold is still 20% on AC. Utilization dipped under 20% between pulses. Windows stepped the P-state down. The next prompt pays the ramp. Lowering this GUID means Windows only steps down when the desk is nearly idle. Raising it means Windows steps down while you are still working. This forever desk wants the lower number on AC.

Zero percent is a legal value (min 0, max 100). Zero means “almost never step down on utilization.” That is not a switch to High performance.

Grok in-session schedulers expire in 7 days even when durable. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom between pulses | Layer |
|---|---|
| Package parks cores; parking is not 100% min cores | [processor-core-parking](processor-core-parking.html) |
| Min state on AC is not 100; frequency floor is low | [processor-min-state-ac](processor-min-state-ac.html) |
| Boost is Disabled; turbo never engages | [processor-boost-mode](processor-boost-mode.html) |
| Ramp-up is slow; increase threshold still ~60–90% | [processor-perf-increase-threshold](processor-perf-increase-threshold.html) |
| Idle disable still lets deep C-states; first token waits on C-exit | [processor-idle-disable](processor-idle-disable.html) |
| Min/max/boost/parking/increase already honest. Utilization dips under ~20% between 5-minute fires. Next token ramps. Named task Ready / 267009 | **This page.** Decrease threshold. Not increase. Not min state. |
| GUID missing from powercfg after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |

Do not set decrease threshold as the first click. Min state, max state, boost, parking, idle disable, and increase threshold first. Hidden is not a low percent. Raising this GUID is the battery direction, not forever.

## What to change (plugged-in Grok desk)
1. Confirm the earlier layers are already done — processor min state on AC is already honest. Max state 100. Boost Enabled if the row exists. Parking not sitting at a low min-cores percent. Increase threshold already lowered if that GUID exists. See [processor-min-state-ac](processor-min-state-ac.html) and [processor-perf-increase-threshold](processor-perf-increase-threshold.html).
2. Unhide the row if it is missing. Processor performance decrease threshold is ATTRIB_HIDE on many images. Missing from Processor power management before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Processor power management** → **Processor performance decrease threshold**. Set **Plugged in** far below 20%. On this forever desk, **5%** is an honest try (only step down when nearly idle). **0%** is the legal floor if 5% still ramps. On battery may stay 30% if the laptop actually travels.
4. Leave increase threshold as a sibling. GUID `06cadf0e-64ed-448a-8927-ce7bf90eb35d` is the upward percent, not this click.
5. Leave min/max/boost/parking/idle-disable alone on this click. This is one percent. Not a High performance plan switch.
6. Leave the current plan in place. Do not claim a fleet GPO.
7. Confirm.

```
powercfg -attributes SUB_PROCESSOR 12a0ab44-fe28-4fa9-b3bd-4b64f44960a6 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_PROCESSOR 12a0ab44-fe28-4fa9-b3bd-4b64f44960a6
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 12a0ab44-fe28-4fa9-b3bd-4b64f44960a6 5
powercfg /setactive SCHEME_CURRENT
```

`SUB_PROCESSOR` / GUID `12a0ab44-fe28-4fa9-b3bd-4b64f44960a6` is Processor performance decrease threshold. Alias `PERFDECTHRESHOLD`. Units are percent. Microsoft min 0, max 100, increment 1. Balanced default is often 20% AC / 30% DC — that is not a pass for a 5-minute Interactive pulse. **5% on AC** is the honest host-forever try. 0% is the floor if 5% still ramps. If powercfg omits the GUID after unhide, this edition did not expose the knob — stop. Increase threshold is [processor-perf-increase-threshold](processor-perf-increase-threshold.html). Min state is [processor-min-state-ac](processor-min-state-ac.html). This host is Windows. Not systemd. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Min/max/boost/parking/increase already honest. Otherwise this soak is lying about the floor or the ramp-up.
2. Confirm AC index is 5 (or 0). Idle a quiet gap between 5-minute fires. First token / first write is not a P-state ramp. Named task still has a next-run.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a ramped first token is not forever if this GUID is still 20.
4. Missing GUID after unhide = skip, not a red soak. Do not invent the percent in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the decrease threshold is already 5. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not Processor performance increase threshold. That upward percent is [processor-perf-increase-threshold](processor-perf-increase-threshold.html).
- Not processor min/max state. Those floors/ceilings are [processor-min-state-ac](processor-min-state-ac.html) and [processor-max-state-ac](processor-max-state-ac.html).
- Not boost mode. That turbo policy is [processor-boost-mode](processor-boost-mode.html).
- Not core parking. That pack is [processor-core-parking](processor-core-parking.html).
- Not idle disable. That C-state pack is [processor-idle-disable](processor-idle-disable.html).
- Not a High-performance plan essay. One Processor power management percent.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
