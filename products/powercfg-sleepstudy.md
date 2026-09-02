# powercfg /sleepstudy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/powercfg-sleepstudy.html

Companion forensic to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [Connected Standby / CSEnabled](connected-standby-csenabled.md). Sleep-vs-forever names S0ix as the failure mode that freezes Interactive-only tasks while the lid looks on. CSEnabled on this Yoga 7 class is **skip the DWORD** — S3 is not offered. This pack is the remaining Modern Standby **HTML report**: `powercfg /sleepstudy`. It lists Connected Standby sessions, DRIPS residency, and remaining consumers. The report stays on disk. It does not go on GitHub Pages.

Distinct from [powercfg /lastwake](powercfg-lastwake.md) (who yanked the last sleep), [powercfg /requests](powercfg-requests-blockers.md) (holders while awake), and `powercfg /energy` (60-second energy-efficiency HTML). Those dumps are not a CS session table.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing on AC. Sleep after can already be Never. Wake timers can already be Enable. Task Scheduler still prints Ready. Last result 267009 is still-running. The closed-lid docked hour still missed. The box may have entered **Standby (S0 Low Power Idle)** and frozen the user session while RAM stayed powered.

`powercfg /sleepstudy` writes the evidence: CS sessions this firmware actually entered, percent of time in DRIPS (Deepest Runtime Idle Platform State), and remaining activators that blocked DRIPS (NIC, USB hub, radios, display, OEM PEP). A missed hourly that lines up with a CS session is S0ix, not a dead Grok scheduler. A missed hourly with **no** CS session in that window is a different layer. Poor DRIPS with a named remaining consumer is the sibling that owns that name, not a fourth TUI.

On this class, [CSEnabled](connected-standby-csenabled.md) already says skip. Sleep study is how you prove residency without inventing `CsEnabled=0`. Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Do not install systemd because DRIPS printed 12%.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| `powercfg /a` does not list Standby (S0 Low Power Idle). Classic S3 only | Sleep study is AoAc. Use `powercfg /systemsleepdiagnostics` locally. Not this pack |
| Plan still has 5–20 minute sleep on AC. Lid is Sleep | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) / [lid-close](lid-close-do-nothing.md) |
| Want to disable Connected Standby and restore S3 | [connected-standby-csenabled](connected-standby-csenabled.md) — skip on this class |
| Need the name of who woke the last sleep | [powercfg-lastwake](powercfg-lastwake.md) |
| Fan stays up. Session never idled. DISPLAY / SYSTEM held | [powercfg-requests-blockers](powercfg-requests-blockers.md) |
| Need a 60-second energy-efficiency HTML | `powercfg /energy` — different report. Timer leftovers: [multimedia-timer-resolution](multimedia-timer-resolution.md) |
| S0 listed. Timeouts honest. Closed-lid hour missed. Need the CS session list | **This page.** Run `/sleepstudy`. Keep the HTML local |
| Last result 267009 | Still running. Do not spawn a 4th TUI |

Do not run sleep study as the first click on a new host. Confirm `/a` lists S0 Low Power Idle. Do not publish `sleepstudy-report.html` on Pages.

## What to run (plugged-in Grok desk)
1. Confirm this firmware is AoAc — elevated `powercfg /a` must list Standby (S0 Low Power Idle). If it only lists S3, this pack does not apply. If it lists S0 and not S3, you are on the Yoga 7 class path: CSEnabled skip, sleep study for evidence.
2. Confirm plugged-in Sleep after is not 5–20 minutes. Lid close on AC is Do nothing if that is the desk policy. Otherwise the report mixes intended sleep and a missed hourly.
3. Generate locally — `powercfg /sleepstudy /duration 1 /output %USERPROFILE%\sleepstudy-report.html`. Default without `/duration` is three days. Open the HTML on this host. Do not commit it. Do not drag it onto Pages.
4. Classify the missed hour — CS session covering the frozen hourly is S0ix residency. No CS session in that window: CS is not the liar; go to /requests, Hibernate Off, or /lastwake. Poor DRIPS remaining consumers: NIC → [network-standby](network-standby-connectivity.md); USB → [USB root hub](usb-root-hub-power.md) / [selective suspend](usb-selective-suspend.html); radios → [Wi-Fi](wifi-adapter-power-saving.md) / [Bluetooth](bluetooth-adapter-power-saving.md).
5. Act on the named remaining consumer. Do not invent `CsEnabled=0` on firmware that does not offer S3. Do not unplug a HID to “heal” DRIPS. Do not paste `auth.json` next to that HTML.

```
powercfg /a
powercfg /sleepstudy /duration 1 /output %USERPROFILE%\sleepstudy-report.html
schtasks /Query /TN "LEXXII-Materialize-Forever" /FO LIST /V
```

`/a` is the capability list. Sleep study is the session list. `/xml` exists; do not publish that either. `/energy`, `/batteryreport`, and `/systemsleepdiagnostics` are different reports. Device paths stay local.

## How to read the report
| Sleep study says | What it is | Where to go |
|---|---|---|
| No S0 on `/a`. Command errors or empty CS table | Not AoAc, or no CS session in the duration window | S3 only: `/systemsleepdiagnostics` locally. S0 listed but empty: CS did not fire |
| CS session covers the missed hourly. DRIPS high | Deep Modern Standby. Interactive-only froze as designed | [sleep-vs-forever](windows-sleep-vs-forever.md). Keep lid Do nothing / Sleep after Never on AC if this desk must not enter CS |
| CS session. DRIPS low. Remaining NIC / Wi-Fi / WWAN | Radio kept the platform out of DRIPS. User tasks still froze | [network-standby](network-standby-connectivity.md) / [Wi-Fi](wifi-adapter-power-saving.md) |
| Remaining USB hub / HID / root hub | Dock or bump held a device awake inside CS | [USB root hub](usb-root-hub-power.md) / [USB selective suspend](usb-selective-suspend.html) |
| Remaining Bluetooth | BT radio inside CS | [Bluetooth adapter power saving](bluetooth-adapter-power-saving.md) |
| No CS session in the missed hour. Last-run frozen anyway | CS is not the liar | [/requests](powercfg-requests-blockers.md), [Hibernate Off](hibernate-off-forever.md), [hybrid sleep](hybrid-sleep-ac.md), [/lastwake](powercfg-lastwake.md) |

## Soak test
1. `powercfg /a` already lists S0 Low Power Idle. Sleep after and lid policy already match the desk.
2. Plugged in. Lid closed on the dock for sixty minutes. Generate `/sleepstudy /duration 1` after the hour.
3. If the named task last-run advanced across that hour, CS either did not fire or did not freeze Interactive — pass for this layer. Classify any CS session as a baseline.
4. If last-run froze and sleep study shows a CS session covering that hour, this layer is the liar. Do not spawn a fourth Grok TUI. Do not write CSEnabled on this class.
5. If last-run froze and sleep study shows no CS session, fail-over to /requests, Hibernate, hybrid sleep, or lastwake. Poor DRIPS names a remaining consumer — that sibling, not systemd.

## What this page is not
- Not the Modern Standby diagnosis essay. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not permission to write `CsEnabled=0` on firmware that does not offer S3. That skip is [connected-standby-csenabled](connected-standby-csenabled.html).
- Not `/lastwake` or `/waketimers`.
- Not `/requests` while awake.
- Not `/energy`, `/batteryreport`, or `/systemsleepdiagnostics`. None of them belong on Pages.
- Not a published sleep-study HTML, XML, or device-path dump on GitHub Pages.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
