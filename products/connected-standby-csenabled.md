# Connected Standby / CSEnabled vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/connected-standby-csenabled.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [Network connectivity in Standby](network-standby-connectivity.md). Sleep-vs-forever diagnoses why S0ix pauses the hourly. Network-standby is the NIC policy *during* S0ix. This pack is the remaining firmware/policy knob: can this class of laptop turn **Connected Standby / CSEnabled** off and get classic S3 back.

On this class, the honest answer is **skip**.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Modern Standby (S0 Low Power Idle / connected standby) pauses user tasks while the lid still looks like “on.” Operators then hunt a Windows DWORD named `CsEnabled` (Windows 8 Connected Standby leftover) or a BIOS row named Sleep State / Modern Standby / Linux, hoping S3 returns and Task Scheduler behaves like a desktop.

This host class is a Lenovo Yoga 7 2-in-1 16IML9 (machine type 83DL, BIOS NWCN25WW class). Measured on this desk:

- `powercfg /a` lists **Standby (S0 Low Power Idle) Network Connected**. Hibernate and Fast Startup are available.
- **Standby (S3) is not available.** Firmware does not support it. Windows also reports it is disabled when S0 low power idle is supported.
- Hybrid Sleep is unavailable because S3 is unavailable.
- `HKLM\SYSTEM\CurrentControlSet\Control\Power\CsEnabled` is **not present**. `PlatformAoAcOverride` and `CsEnabledOverride` are not present.
- There is **no** `powercfg` alias `CSENABLED`.
- Lenovo `Lenovo_BiosSetting` WMI is empty on this consumer Yoga. Setup does not expose Sleep State / Modern Standby / Linux S3 the way some ThinkPads do.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| S0ix paused the hourly; timeouts / lid / Interactive-only still lying | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Dedicated NIC dies only after S0ix | [network-standby-connectivity](network-standby-connectivity.md) |
| Sleep happened and the hourly never recovered | [wake-timers-forever](wake-timers-forever.md) |
| Lid close put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Want S3 so Task Scheduler runs through a “real” sleep. `powercfg /a` shows S0 LPI. S3 firmware-disabled. `CsEnabled` missing. BIOS has no Sleep State row | **This page. Skip.** |
| A different OEM actually lists Sleep State / Modern Standby / Linux in firmware Setup, and `powercfg /a` grows an S3 line after that click | Remaining firmware knob. Use Setup. Re-query. Not a registry paste. |
| Forum recipe: write `CsEnabled=0` or `PlatformAoAcOverride` | Not this page. Do not invent that DWORD on a public playbook. |

Do not write `CsEnabled` as the first click on a new host. Timeouts and lid first. This page is only whether firmware will even let you leave Connected Standby.

## What to change (plugged-in Grok desk)
1. Confirm the diagnosis layer is already done — you already know S0ix is the sleep that pauses the hourly. See [sleep-vs-forever](windows-sleep-vs-forever.html). If sleep timeouts are still 5–20 minutes, stop here.
2. Confirm the NIC-during-S0ix layer is a different click. See [network-standby-connectivity](network-standby-connectivity.html). This page does not keep Ethernet up. It asks whether S0ix itself can be turned off.
3. Query available sleep states. S0 Low Power Idle present and S3 “firmware does not support” is the skip tell on this class.
4. Query the old Connected Standby DWORD. Missing is not Off. Missing means Windows is not offering a policy knob.
5. Look in firmware Setup (Novo / F2 on this Lenovo) for Sleep State, Modern Standby, Connected Standby, or Linux. On Yoga 7 2-in-1 16IML9 (83DL) that row is not there. Empty `Lenovo_BiosSetting` is the same skip. Some ThinkPads expose it. This Yoga does not.
6. **Stop.** Do not create `CsEnabled`. Do not create `PlatformAoAcOverride`. Do not `powercfg /hibernate off` to “kill” Modern Standby — Hibernate is a different file, and S0ix still remains. Do not install systemd because S3 is missing.
7. Forever on this class is therefore: keep the session out of S0ix ([sleep after](sleep-after-timeout.html), [lid close Do nothing](lid-close-do-nothing.html)), then NIC-in-standby, then [wake timers](wake-timers-forever.html). You cannot firmware-convert this SKU to S3 from Windows.

```
powercfg /a
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Control\Power | Select-Object CsEnabled, PlatformAoAcOverride, CsEnabledOverride
```

`powercfg /a` is the source of truth for whether S3 exists. Empty `CsEnabled` plus S3 firmware-disabled is a green skip, not a failed soak. If a future BIOS on a *different* machine lists S3 after a Setup click, re-query; do not assume this Yoga grew the row. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep-vs-forever already honest. Otherwise this soak is lying about timeouts vs firmware.
2. `powercfg /a` still shows S0 Low Power Idle and no S3. That is the pass for this class: the conversion knob was never exposed.
3. `CsEnabled` still absent. A DWORD that appeared because someone followed a forum paste is a fail — delete the experiment, do not keep a hack that did not restore S3.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever` because the session stayed out of S0ix, not because Connected Standby was “disabled.”
5. No fourth Grok TUI. Last result 267009 is still-running, not proof CSEnabled flipped.
6. Skip is not a red soak. Inventing `CsEnabled=0` is.

## What this page is not
- Not the Modern Standby *diagnosis*. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not Network connectivity in Standby. That is [network-standby-connectivity](network-standby-connectivity.html).
- Not lid-close, not sleep-after timeout, not wake timers, not hybrid sleep.
- Not a recipe to write `CsEnabled=0` or `PlatformAoAcOverride`. Those are forum hacks. This class does not expose them, and S3 is firmware-absent.
- Not a ThinkPad Sleep State tutorial pretending this Yoga has the row.
- Not permission to keep 5-minute sleep because “Connected Standby is the platform.” Timeouts still matter.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
