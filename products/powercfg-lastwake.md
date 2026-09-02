# powercfg /lastwake vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/powercfg-lastwake.html

Companion forensic to [Allow wake timers vs a forever loop](wake-timers-forever.md). That pack *sets* Allow wake timers = Enable on AC and WakeToRun on `LEXXII-Materialize-Forever`. This pack *reads* who yanked the session after that policy is already honest. `powercfg /lastwake` is the last sleep’s source. `powercfg /waketimers` is what is armed now. Those two dumps are not the same object.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Wake-timers-forever already says Important-only is not a LEXXII task and that WakeToRun while the plan is Important-only is a lie. After Enable + WakeToRun, the hourly can still look yanked because something else woke the box — USB HID, NIC/WoL, Windows Update RTC, a Power Button, or Unknown firmware — and the operator blamed Grok.

- **/lastwake** — history. One wake. Type + Owner or device path. Persists until the next sleep.
- **/waketimers** — present. Every RTC still armed to yank the next sleep.
- **wake_armed / wake_programmable** — which devices may wake, vs which can be armed.

A USB mouse bump is a Device, not the 5-minute pulse. A `svchost.exe` / `wuauserv` timer is not LEXXII. Do not Disable Allow wake timers because last-wake showed a HID. Name the source. Then go to the sibling that owns that name.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Allow wake timers Disable / Important only. Next-run in the past | [wake-timers-forever](wake-timers-forever.md) |
| Named task missing / never-run 1999-11-30 | [windows-task-forever](windows-task-forever.md) |
| Woke unattended, then napped in ~2 minutes | [unattended-sleep-timeout](unattended-sleep-timeout.md) |
| Timeouts honest. Session never idles | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Lid / power / Sleep key put the session down | [lid-close](lid-close-do-nothing.md) / [power button](power-button-action-ac.md) / [Sleep button](sleep-button-action.md) |
| Wake timers already Enable. WakeToRun checked. Session still yanked. Need the name | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not run last-wake as the first click on a new host. Set the RTC policy first.

## What to run (plugged-in Grok desk)
1. Confirm Allow wake timers on AC is Enable and WakeToRun is checked. Otherwise this forensic is noise.
2. Elevated Command Prompt, after the yank: `powercfg /lastwake`, then `powercfg /waketimers`, then `powercfg /devicequery wake_armed` if last-wake named a Device.
3. Classify last-wake Type: Timer, Device, Fixed Feature, or empty / Unknown. Friendly Name and Instance Path are the name.
4. Classify wake-timers owners. Extra OEM / Update / third-party RTCs are named, not ignored. Empty with Enable and a next-run still in the future can be honest. Empty after a missed hour with next-run in the past is a fail on the policy pack.
5. Act on the named source, not the plan. Uncheck Wake the computer on the *foreign* task. Do not unplug a HID bump to “heal” Grok. NIC last-wake is WoL, not Allow wake timers.

```
powercfg /lastwake
powercfg /waketimers
powercfg /devicequery wake_armed
powercfg /devicequery wake_programmable
schtasks /Query /TN "LEXXII-Materialize-Forever" /FO LIST /V
```

`/lastwake` persists until the next sleep — re-sleep once if you need a fresh sample. Power-Troubleshooter Event ID 1 is local corroboration. Do not publish the event XML. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## How to read the name
| last-wake / waketimers says | What it is | Where to go |
|---|---|---|
| Timer · `LEXXII-Materialize-Forever` (or Pages-Heal / Ship) | Named hourly did the wake. Policy passed. | If it then napped: [UNATTENDSLEEP](unattended-sleep-timeout.md). If console logged out: Interactive-only, [sleep-vs-forever](windows-sleep-vs-forever.md). |
| Timer · `svchost.exe` / `wuauserv` / Reboot / Automatic Maintenance | Windows Update or maintenance RTC. Not LEXXII. | Uncheck Wake the computer on *that* task. Do not Disable the plan. |
| Device · USB Root Hub / HID mouse / keyboard | A bump. Not a 5-minute pulse. | Expected on a docked desk. Not a Grok failure. |
| Device · Ethernet / Wi-Fi / Magic Packet | Wake on LAN. | NIC policy. Related: [Network in Standby](network-standby-connectivity.md). |
| Fixed Feature · Power Button / Sleep Button / lid | Human or a mapped key. | [Power button](power-button-action-ac.md) / [Sleep button](sleep-button-action.md) / [lid](lid-close-do-nothing.md). |
| Empty / Unknown after a real sleep | Firmware did not record, or Fast Startup hybrid path. | Re-sample after real S3/S0ix. [Fast Startup](windows-fast-startup.md) is a different liar. |

## Soak test
1. Allow wake timers Enable on AC. WakeToRun already checked. Otherwise this soak is lying.
2. A known lid-open or power-button wake prints Fixed Feature or Device HID — classify it. Not a fail. Do not Disable the plan.
3. A forced short sleep that ends at the next hourly prints Timer with the named LEXXII task. Last Run Time moved. No human lid-open.
4. `/waketimers` with sleep allowed and a next-run due can list the named task. Extra OEM / Update timers are named, then those tasks lose WakeToRun.
5. A USB mouse bump is Device. The hourly is not blamed. No fourth Grok TUI.

## What this page is not
- Not the Allow wake timers policy pack. That is [wake-timers-forever](wake-timers-forever.html).
- Not unattended re-sleep. That is [unattended-sleep-timeout](unattended-sleep-timeout.html).
- Not `/requests` holders. That is [powercfg-requests-blockers](powercfg-requests-blockers.html).
- Not permission to Disable Allow wake timers because last-wake showed USB or Windows Update.
- Not a published Event Viewer XML or energy report on Pages.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
