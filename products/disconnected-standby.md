# Disconnected Standby vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/disconnected-standby.html

Companion to [Connected Standby / CSEnabled](connected-standby-csenabled.html) and [Network connectivity in Standby](network-standby-connectivity.html). CSEnabled asks whether this class can leave Modern Standby and get S3 back. Network-standby is the NIC policy *during* Connected Standby. This pack is the remaining flavor: `powercfg /a` reports **Standby (S0 Low Power Idle) Network Connected** vs **Network Disconnected**. Disconnected Standby is still S0ix. It is not S3.

On this class, the honest answer is **do not invent `DisconnectedStandbyMode`**. Stay out of S0ix.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Operators who already learned they cannot kill Connected Standby then hunt a quieter S0ix: Disconnected Standby (DS). Microsoft’s DS flavor keeps Modern Standby and drops the network during that idle. Forums paste `HKLM\SYSTEM\CurrentControlSet\Control\Power\DisconnectedStandbyMode = 1` as if that were “safer sleep.”

Measured on this desk (Lenovo Yoga 7 2-in-1 16IML9 class):

- `powercfg /a` lists **Standby (S0 Low Power Idle) Network Connected**. Hibernate and Fast Startup are available. **S3 is not available.** Firmware does not support it.
- `DisconnectedStandbyMode` is **not present**. `CsEnabled` and `PlatformAoAcOverride` are not present.
- There is **no** `powercfg` alias `DISCONNECTEDSTANDBY`. `powercfg /qh SCHEME_CURRENT SUB_SLEEP` has no Disconnected Standby GUID on this image.
- `SUB_INTSTEER` and `SUB_PRESENCE` exist as aliases. They are not this flavor.

Grok in-session schedulers expire in 7 days even when durable. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Want S3 so Task Scheduler runs through a “real” sleep. `powercfg /a` shows S0 LPI. S3 firmware-disabled | [connected-standby-csenabled](connected-standby-csenabled.html). Skip. |
| Dedicated NIC dies only after S0ix. Settings row exists | [network-standby-connectivity](network-standby-connectivity.html) |
| Storage walks D3 only in Modern Standby | [storage-d3-modern-standby](storage-d3-modern-standby.html) |
| S0ix paused the hourly; timeouts / lid still lying | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| `powercfg /a` says **Network Connected**. Forum recipe: write `DisconnectedStandbyMode=1` to “force DS” and keep GitHub MCP during a quieter sleep | **This page. Skip the DWORD.** DS is still S0ix. Forcing it drops the NIC. Worse for a forever loop. |
| Session already never sleeps (STANDBYIDLE 0, lid Do nothing). Flavor never fires | Skip. Not a fail. |
| A future BIOS/OS on a *different* machine makes `powercfg /a` print Network Disconnected without a DWORD paste | Re-query. Do not assume this Yoga grew DS. |

Do not write `DisconnectedStandbyMode` as the first click. Timeouts and lid first. CSEnabled conversion already skipped. This page is only whether Connected vs Disconnected flavor is a remaining knob.

## What to change (plugged-in Grok desk)
1. Confirm the diagnosis layer is already done — you already know S0ix pauses the hourly. See [sleep-vs-forever](windows-sleep-vs-forever.html). If sleep timeouts are still 5–20 minutes, stop here.
2. Confirm CSEnabled conversion already skipped on this class. See [connected-standby-csenabled](connected-standby-csenabled.html). This page does not restore S3.
3. Confirm the NIC-during-S0ix layer is a different click. See [network-standby-connectivity](network-standby-connectivity.html). Always vs Never is not Disconnected Standby.
4. Query available sleep states. **Network Connected** plus S3 firmware-disabled is the skip tell on this class. **Network Disconnected** would be DS flavor — still not S3.
5. Query the DWORD. Missing is not Off. Missing means Windows is not offering a policy knob.
6. **Stop.** Do not create `DisconnectedStandbyMode`. Do not create `CsEnabled`. Do not `powercfg /hibernate off` to “kill” the flavor — Hibernate is a different file, and S0ix still remains. Do not install systemd because DS is missing.
7. Forever on this class is therefore: keep the session out of S0ix ([sleep after](sleep-after-timeout.html), [lid close Do nothing](lid-close-do-nothing.html)). You cannot flavor-convert this SKU to a safer sleep from a public playbook.

```
powercfg /a
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Control\Power | Select-Object DisconnectedStandbyMode, CsEnabled, PlatformAoAcOverride
```

`powercfg /a` is the source of truth for Connected vs Disconnected flavor. Empty `DisconnectedStandbyMode` plus **Network Connected** is a green skip, not a failed soak. If a future image on a *different* machine lists Network Disconnected without a paste, re-query; do not assume this Yoga grew the row. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Sleep-vs-forever and CSEnabled skip already honest. Otherwise this soak is lying about timeouts vs flavor.
2. `powercfg /a` still shows S0 Low Power Idle **Network Connected** and no S3. That is the pass for this class: the DS conversion knob was never exposed.
3. `DisconnectedStandbyMode` still absent. A DWORD that appeared because someone followed a forum paste is a fail — delete the experiment. Forcing DS does not restore S3 and it drops the NIC the forever loop needs if the session ever does enter S0ix.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever` because the session stayed out of S0ix, not because Disconnected Standby was “enabled.”
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the flavor flipped.
6. Skip is not a red soak. Inventing `DisconnectedStandbyMode=1` is.

## What this page is not
- Not the Modern Standby *diagnosis*. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not CSEnabled / S3 conversion. That is [connected-standby-csenabled](connected-standby-csenabled.html).
- Not Network connectivity in Standby (Always / Never / Managed by Windows). That is [network-standby-connectivity](network-standby-connectivity.html).
- Not storage D3 in Modern Standby. That is [storage-d3-modern-standby](storage-d3-modern-standby.html).
- Not lid-close, not sleep-after timeout, not wake timers, not hybrid sleep.
- Not a recipe to write `DisconnectedStandbyMode=1`. That is a forum hack. This class does not expose it, and DS is still S0ix.
- Not permission to keep 5-minute sleep because “Disconnected Standby is quieter.” Timeouts still matter. Both flavors pause user tasks.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
