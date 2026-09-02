# powercfg /a vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/powercfg-availablesleepstates.html

Companion map to [Sleep vs forever](windows-sleep-vs-forever.md), [CSEnabled](connected-standby-csenabled.md), [Hybrid Sleep](hybrid-sleep-ac.md), [Hibernate Off](hibernate-off-forever.md), and [Fast Startup](windows-fast-startup.md). Those packs set a policy or describe a behavior. This pack *reads* which sleep states the firmware will enter. `powercfg /a` is the same as `powercfg /availablesleepstates`. It is not STANDBYIDLE, not CSEnabled, not sleepstudy, and not lastwake.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. S0ix can look asleep while grok.exe is still a process. S3 freezes RAM and the Interactive session is gone until resume. Hybrid Sleep is S3 plus a hibernate file. Fast Startup is a hybrid shutdown that requires Hibernate. Operators skip the map and click the sibling that does not exist on this firmware.

- **/a** — availability. Two lists: states the platform will enter, and states it will not, with a reason.
- **S0 Low Power Idle** — Modern Standby. Stays in S0. Network Connected vs Disconnected is NIC policy during idle.
- **S3** — classic Suspend-to-RAM. Hybrid Sleep can only exist if this is available.
- **Hibernate (S4)** — dump RAM to disk. Fast Startup can only exist if this is available.

Typical docked-laptop Grok hosts in this class print Standby (S0 Low Power Idle) Network Connected as available, and S1 / S2 / S3 as unavailable because S0 low power idle is supported. Hybrid Sleep then says Standby (S3) is not available. That is a class, not a serial. Do not paste a live dump with OEM reasons onto GitHub Pages.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Sleep after still 5–20 minutes on AC. Map already known | [sleep-after-timeout](sleep-after-timeout.md) |
| Lid close still Sleep. Map already known | [lid-close-do-nothing](lid-close-do-nothing.md) |
| Need to disable Connected Standby in the registry | [CSEnabled](connected-standby-csenabled.md). Dangerous. Map first. |
| Hybrid Sleep GUI row missing or grey. Want the reason | **This page**. Hybrid Sleep requires S3. |
| Hibernate still listed. Want it gone | [hibernate-off-forever](hibernate-off-forever.md) after this map |
| Start-menu Shut down is a fake boot | [windows-fast-startup](windows-fast-startup.md). Requires Hibernate. |
| Need S0ix history, not the map | [sleepstudy](powercfg-sleepstudy.md) |
| Need who yanked the last sleep | [lastwake](powercfg-lastwake.md) |
| Need the firmware map before any of those clicks | **This page** |
| Last result 267009 | Still running. Do not spawn a 4th TUI. |

Do not flip CSEnabled, Hybrid Sleep, or Hibernate as the first click on a new host. Read `/a` first.

## What to run (plugged-in Grok desk)
1. Elevated Command Prompt, session unlocked, brick in: `powercfg /a`.
2. Split available vs unavailable. Read the reason line. Firmware, hypervisor, S0ix-disables-S3, and Hibernate not enabled are different sentences.
3. Classify the standby class: S0 Low Power Idle vs S3 vs both (rare). Network Connected vs Disconnected is NIC policy, not a different ACPI letter.
4. Do not “fix” an honest unavailable. Hybrid Sleep unavailable because S3 is unavailable is expected on S0ix-only firmware. S1/S2 unavailable is expected. Hibernate still available is the Hibernate Off pack.
5. Re-query after a real policy click. `/h off` should move Hibernate and Fast Startup to unavailable. Save the text locally. Do not publish it. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /a
powercfg /availablesleepstates
```

There is no GUID to unhide. There is no AC vs DC index. A Hyper-V / WSL2 / VBS host can add “The hypervisor does not support this standby state” under Hybrid Sleep even when S3 is already gone. Name it. Do not disable VBS to heal a 5-minute pulse.

## How to read the map
| /a says | What it is | Where to go |
|---|---|---|
| Available · Standby (S0 Low Power Idle) Network Connected | Modern Standby. Stays in S0. NIC may stay up. Interactive-only tasks can miss fires. | [Sleep vs forever](windows-sleep-vs-forever.md), then [Sleep after](sleep-after-timeout.md) and [lid](lid-close-do-nothing.md). Not an S3 hunt. |
| Available · Standby (S0 Low Power Idle) Network Disconnected | Same S0ix class. NIC is supposed to drop in idle. | [Network in Standby](network-standby-connectivity.md) after this map. |
| Available · Standby (S3) | Classic Suspend-to-RAM. Hybrid Sleep can exist. | [STANDBYIDLE](sleep-after-timeout.md) is S3 minutes. [Hybrid Sleep](hybrid-sleep-ac.md) is allowed to be a real row. |
| Unavailable · S3 because S0 low power idle is supported | Firmware chose Modern Standby over S3. Expected on this laptop class. | Stop hunting S3. Do not flash BIOS for Grok. |
| Unavailable · Hybrid Sleep · Standby (S3) is not available | Ghost row. Hybrid Sleep is S3 + a hibernate file. | Not a GUI bug. Leave it. |
| Available · Hibernate | S4 still on. Fast Startup can still lie. | [Hibernate Off](hibernate-off-forever.md) if this desk should never S4. |
| Available · Fast Startup | Hybrid shutdown still armed. | [Fast Startup](windows-fast-startup.md). Hibernate Off first or with it. |
| Unavailable · Hibernate has not been enabled | `/h off` already done, or no S4. | Fast Startup should be unavailable too. |
| Unavailable · S1 / S2 · firmware does not support | Legacy standby. Not used on this class of PC. | Ignore. Not a fail. |
| Hypervisor does not support this standby state | VBS / Hyper-V / WSL2 stacked on the firmware map. | Name it. Do not disable VBS to heal the pulse. Not systemd. |

## Soak test
1. `powercfg /a` on AC, session unlocked. Two lists. At least one standby class (S0ix or S3).
2. S0ix available and S3 unavailable because S0 low power idle is supported: classify Modern Standby. Do not hunt S3.
3. S3 available and S0ix not: classify classic sleep. Hybrid Sleep may be a real row.
4. After `powercfg /h off`, re-run `/a`. Hibernate and Fast Startup should be unavailable.
5. Hybrid Sleep unavailable solely because S3 is unavailable is a pass of this forensic. Do not Apply Energy recommendations to force it.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof the firmware grew S3. Keep the dump off Pages.

## What this page is not
- Not Sleep vs forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not CSEnabled. That is [connected-standby-csenabled](connected-standby-csenabled.html).
- Not Sleep after. That is [sleep-after-timeout](sleep-after-timeout.html).
- Not Hybrid Sleep. That is [hybrid-sleep-ac](hybrid-sleep-ac.html).
- Not Hibernate Off. That is [hibernate-off-forever](hibernate-off-forever.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not sleepstudy, /energy, /lastwake, or batteryreport.
- Not permission to flash BIOS, disable VBS, or flip CSEnabled because S0ix listed as available.
- Not a published `/a` dump on GitHub Pages.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
