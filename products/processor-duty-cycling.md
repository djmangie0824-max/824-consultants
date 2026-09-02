# Processor duty cycling vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-duty-cycling.html

Companion to [Processor idle disable](processor-idle-disable.html), [Allow Throttle States](allow-throttle-states.html), [Processor performance boost mode](processor-boost-mode.html), and [processor power throttling](processor-power-throttling.html). Idle disable is C-states. Allow Throttle States is ACPI T-states. Boost is turbo allow. The throttling catalog page mixes max-state and EcoQoS. This pack is **Processor power management → Processor duty cycling**. Alias `PERFDUTYCYCLING`. GUID `4e4450b3-6179-4e91-b8f1-5bb9938f81a1`. Possible values: **0 Disabled**, **1 Enabled**. The short alias `DUTYCYCLING` is **invalid** on this SKU.

## What this is
Sibling processor knobs can already be honest on AC. Someone still “optimizes watts” by turning **Processor duty cycling** to Enabled. Enabled duty-cycles the package — modulated on/off — so an Interactive Grok CLI looks hung between bursts. `grok.exe` is alive. Task Scheduler still prints Ready and last result 267009 (still-running). The operator thinks the loop died. The package was chopped.

This host printed **AC 0 / DC 0 Disabled** on Balanced `381b4222-f694-41f0-9685-ff5bb260df2e`. That is already the forever-desk pass. Do not Enable to save watts on a plugged-in Grok desk.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## Live query on this host (2026-09-01)
| Field | This desk |
|---|---|
| Scheme | `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e` |
| Subgroup | `SUB_PROCESSOR` `54533251-82be-4824-96c1-47b60b740d00` |
| Setting GUID | `4e4450b3-6179-4e91-b8f1-5bb9938f81a1` alias `PERFDUTYCYCLING` |
| Invalid alias | `DUTYCYCLING` — not accepted on this SKU |
| Possible | 000 Disabled · 001 Enabled |
| AC / DC | `0x00000000` / `0x00000000` = **Disabled** — already the pass |
| Sibling `IDLEDISABLE` | C-state allow/deny. Different pack. |
| Sibling `THROTTLING` | ACPI T-states Off/On/Automatic. Different pack. |
| Sibling `PERFBOOSTMODE` | Turbo allow. Different pack. |

`powercfg /qh` printed this row on this SKU. Hidden in the GUI is not missing. If `/qh` omits the GUID, stop; do not invent a registry paste.

## Duty cycling is not idle and not T-states
| Layer | What it actually is |
|---|---|
| Processor idle disable | C-state allow. `IDLEDISABLE`. Package sleep, not on/off modulation. |
| Allow Throttle States | ACPI T-state allow. `THROTTLING`. 0 Off · 1 On · 2 Automatic. |
| Processor power throttling page | Max-state / EcoQoS catalog mix. Filename collision. Not this GUID. |
| Processor performance boost mode | Turbo P-state allow. `PERFBOOSTMODE`. |
| Processor duty cycling | Package on/off modulation. `PERFDUTYCYCLING`. 0 Disabled · 1 Enabled. This page. |

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| Wake stall; C-states still Enabled | [processor-idle-disable](processor-idle-disable.html) |
| `THROTTLING` still Automatic or On on AC | [allow-throttle-states](allow-throttle-states.html) |
| Task Manager Power throttling on grok.exe while this GUID is Disabled | [processor-power-throttling](processor-power-throttling.html) |
| Boost mode Disabled; clocks at base while executing | [processor-boost-mode](processor-boost-mode.html) |
| Alias `DUTYCYCLING` errors; GUID present as `PERFDUTYCYCLING` | **This page.** Use the live alias. |
| GUID missing from `powercfg /qh` | Stop. Not a registry hack. |
| Session awake. Named task Ready / 267009. TUI looks frozen in on/off chops. AC is 1 Enabled | **This page.** Restore Disabled (0). |
| AC already 0 Disabled; TUI still stalls | Different layer. Do not Enable “to try something.” |

Do not set Processor duty cycling as the first click on a new host. Do not Enable to “save watts” on a forever desk. If `/qh` omits the GUID, stop.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing.
2. Confirm idle disable, Allow Throttle States, boost, and parking are already named.
3. Query `PERFDUTYCYCLING` with `/qh` before you write. This host printed Disabled 0/0. If `/qh` omits the GUID, **stop**. Do not use alias `DUTYCYCLING`.
4. If AC is already Disabled (0), **stop**. That is the pass. Do not Enable.
5. If AC is Enabled (1), set Plugged in to **Disabled** (index 0). Activate the scheme. Re-query.
6. Leave idle disable, THROTTLING, EcoQoS, and boost as siblings.
7. Leave the Balanced (or current) plan in place. One processor knob. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR PERFDUTYCYCLING
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR 4e4450b3-6179-4e91-b8f1-5bb9938f81a1
rem If AC is already 0 Disabled: stop. That is the pass.
rem Only if AC is 1 Enabled:
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFDUTYCYCLING 0
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR PERFDUTYCYCLING
```

## Soak test
1. Timeouts already honest. Sibling idle / T-state / boost packs already named if those packs ran.
2. Idle 30 minutes, lid closed, cooling stand in place. Fire a 5-minute named task. TUI is not chopped on/off by package duty cycling.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with PERFDUTYCYCLING Enabled is the fail symptom, not proof of health.
4. PERFDUTYCYCLING still 0 on AC. Do not Enable to “save watts.” Do not switch the whole plan to High performance.
5. No fourth Grok TUI. Isolation-empty `scheduler_list` is skip recreate. The Windows task is the host-forever pulse. Not systemd.

## What this page is not
- Not a Linux FULL AUTO daemon on this Windows profile. Not systemd.
- Not Processor idle disable, not Allow Throttle States, not boost mode, not EcoQoS power throttling.
- Not the invalid alias `DUTYCYCLING`.
- Not a High-performance plan essay. One processor setting.
- Not a SKU and not a commission claim.
- Not a brokerage number. Live capital stays off Pages. NLV stays off Pages.

As an Amazon Associate I earn from qualifying purchases. Tag `824consultant-20`.
