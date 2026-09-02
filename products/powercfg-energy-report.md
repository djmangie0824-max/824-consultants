# powercfg /energy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/powercfg-energy-report.html

Companion forensic to [powercfg /sleepstudy](powercfg-sleepstudy.md), [powercfg /requests](powercfg-requests-blockers.md), and [multimedia timer resolution](multimedia-timer-resolution.md). Sleep study is Connected Standby session history. /requests names DISPLAY and SYSTEM holders *while the session is already awake*. Timer-resolution is the leftover 1 ms `timeBeginPeriod` / ClockRes layer. This pack is the remaining **60-second energy-efficiency HTML**: `powercfg /energy`. It is a live trace, not a CS table. The report stays on disk. It does not go on GitHub Pages.

**The 60-second trace is not a CS session list. The HTML is not public property.**

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep after can already be Never. Lid close on AC can already be Do nothing. Wake timers can already be Enable. Task Scheduler still prints Ready. Last result 267009 is still-running. The operator still thinks Grok died. Sleep study may already show *no* CS session in the missed hour. /requests may already be empty. The remaining liar is often an **energy-efficiency error that only a 60-second elevated trace names**: an Outstanding Timer Request, a USB device that will not enter selective suspend, PCI Express ASPM left on Maximum power savings, a Power Policy row that still has a 5-minute sleep idle while Settings looks honest.

`powercfg /energy` is that trace. Default duration is **60 seconds**. It must run elevated. It writes `energy-report.html` (override with `/output`). Errors, Warnings, and Information are three different buckets. An Error is a named leftover. A Warning is often the Balanced default, not a fail. Information is context. Device instance paths in that HTML are local forensics.

This is not Sleep. This is not `/sleepstudy`. This is not `/lastwake`. This is not `/requests`. This is not `/batteryreport`. This is not `/systemsleepdiagnostics`. Timer-resolution already *uses* `/energy` as one measurement. This page owns the report as a whole: how to run it, how to classify Errors vs Warnings, which sibling owns each named leftover, and the rule that the HTML never lands on Pages.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| `powercfg /a` lists Standby (S0 Low Power Idle). Closed-lid hour missed. Need CS sessions | [powercfg /sleepstudy](powercfg-sleepstudy.md). Wrong page. |
| Need the name of who yanked the last sleep | [powercfg /lastwake](powercfg-lastwake.md) |
| Fan stays up. Session never idled. DISPLAY / SYSTEM held *now* | [powercfg /requests](powercfg-requests-blockers.md) |
| ClockRes Current is 1.0 ms. Need the leftover requester *and* the timer policy | [multimedia timer resolution](multimedia-timer-resolution.md). That pack already names `/energy` as the measurer. This page is the report, not the 1 ms policy. |
| USB device vanishes while awake. Need the Power Options click | [USB selective suspend](usb-selective-suspend.html) |
| Need battery design vs full, recent suspends while the brick was in | `powercfg /batteryreport` locally. Different report. Keep it off Pages. |
| Classic S3 only. Need S3 sleep diagnostics | `powercfg /systemsleepdiagnostics` locally. Not this pack. |
| Timeouts honest. Sleep study empty for the miss. /requests empty. Need named energy-efficiency Errors from a 60-second *awake* trace | **This page.** Run `/energy`. Keep the HTML local. |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not run `/energy` as the first click on a new host. Sleep, lid, and `/a` first. Do not publish `energy-report.html` on Pages.

## What to run (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in Sleep after is not 5–20 minutes. Lid close on AC is Do nothing if that is the desk policy. Otherwise the 60-second window is a mix of intended idle and a missed hourly. See [sleep-vs-forever](windows-sleep-vs-forever.html).
2. Confirm this is not a CS-history question. If the missed hour was a closed-lid Modern Standby freeze, run [sleep study](powercfg-sleepstudy.md) first. `/energy` does not list CS sessions.
3. Confirm this is not a *now* holder. If the fan is up and the session never idles, run [/requests](powercfg-requests-blockers.md) first. `/energy` is a 60-second sample, not a live pin list.
4. Generate locally — elevated Command Prompt, desk idle but **awake**, dual ultrawide listed, dedicated NIC up: `powercfg /energy /duration 60 /output %USERPROFILE%\energy-report.html`. Wait the full sixty seconds. Open the HTML on this host. Do not commit it. Do not drag it onto Pages.
5. Classify Errors vs Warnings vs Information. Act on named Errors through the sibling that owns that name. Do not Apply all on Settings → Energy recommendations. Do not paste `auth.json` next to that HTML.

```
powercfg /a
powercfg /energy /duration 60 /output %USERPROFILE%\energy-report.html
schtasks /Query /TN "LEXXII-Materialize-Forever" /FO LIST /V
```

`/duration 60` is the default. Do not cargo-cult 300 to “see more” — a five-minute elevated trace is still a snapshot, not CS history, and it still does not belong on Pages. `/xml` exists; do not publish that either. `/trace` writes an ETL; keep it local. `/energy` is not `/sleepstudy`. Device paths stay in the local HTML.

## How to read the report
| Energy report says | What it is | Where to go |
|---|---|---|
| Access denied / must be elevated | Not a fail of the desk. Rerun from an elevated prompt | This page. Not a fourth TUI. |
| Errors: Platform Timer Resolution / Outstanding Timer Request. Requested Period 10000 (100-ns units) = 1.000 ms | A process called `timeBeginPeriod` / `NtSetTimerResolution` and did not end it | [multimedia timer resolution](multimedia-timer-resolution.md). Name the path. Close it. Do not call `timeBeginPeriod` to keep Grok alive. |
| Errors / Warnings: USB Selective Suspend. Device does not support or is not entering | A hub, HID, NIC, or NVMe bridge will not nap | [USB selective suspend](usb-selective-suspend.html) / [USB root hub](usb-root-hub-power.md) / [USB 3 LPM](usb3-link-power-management.md) |
| PCI Express Active-State Power Management is Maximum power savings | ASPM on a USB4 / Thunderbolt / NVMe path | [PCI Express link state](pcie-link-state-power.md) |
| Power Policy: Sleep idle timeout is 5–20 minutes on AC | The plan still naps. Settings may be lying | [sleep after timeout](sleep-after-timeout.md) / [sleep-vs-forever](windows-sleep-vs-forever.md) |
| Power Policy: Display timeout / Dim timeout | VIDEOIDLE / VIDEODIM leftovers | [turn off display after](turn-off-display-after.md) / [dim display after](dim-display-after.md) |
| Processor idle disable / minimum processor state 100% | The CPU will not enter C-states | [processor idle disable](processor-idle-disable.md) / [processor min state](processor-min-state-ac.md) |
| Wireless adapter / Bluetooth power saving | Radio leftover | [Wi-Fi](wifi-adapter-power-saving.md) / [Bluetooth](bluetooth-adapter-power-saving.md) |
| Warnings only. No Errors. Named task last-run still advancing | Balanced defaults, not a fail | Skip. Do not Apply all. Do not switch the plan to High performance to clear Warnings. |
| Information: CPU utilization, disk idle, that this is a 60-second sample | Context. Not a CS session | Do not treat Information as a red soak. |

## Soak test
1. Sleep, lid, and `/a` already honest. Otherwise this soak is lying about which state ran.
2. Plugged in. Session **awake**. Dual ultrawide listed. Dedicated NIC up. Elevated `/energy /duration 60` to a path you own.
3. Errors that name a timer requester, USB device, ASPM, or a 5-minute sleep idle are this layer. Act on the sibling. Re-run the 60-second trace. Those Errors gone is the pass.
4. Warnings-only on a desk whose named task last-run still advanced is a skip, not a red fail. Do not Apply all. Do not spawn a fourth Grok TUI because a Warning listed USB selective suspend on a HID that must stay awake.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 is still-running, not proof `/energy` was clean.
6. `energy-report.html` is still local. If it appeared on GitHub Pages, that is a fail of this pack — delete it from origin. Device paths are not public property.
7. Missing elevation is a rerun, not a skip of the layer. A 60-second trace is not sleep study. Do not invent `CsEnabled=0` because `/energy` printed USB warnings.

## What this page is not
- Not [powercfg /sleepstudy](powercfg-sleepstudy.md). That is CS sessions and DRIPS. This is a 60-second awake trace.
- Not [powercfg /lastwake](powercfg-lastwake.md) or `/waketimers`.
- Not [powercfg /requests](powercfg-requests-blockers.md) while awake.
- Not [multimedia timer resolution](multimedia-timer-resolution.md). That pack is the 1 ms policy. This pack is the report that may *name* that leftover.
- Not [USB selective suspend](usb-selective-suspend.html). That is the Power Options click. This pack may *name* the device.
- Not `/batteryreport` or `/systemsleepdiagnostics`. Those are different reports. None of them belong on Pages.
- Not a published `energy-report.html`, XML, ETL, or device-path dump on GitHub Pages.
- Not Settings → Energy recommendations → Apply all.
- Not a High-performance plan essay.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
