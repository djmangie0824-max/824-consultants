# Storage D3 in Modern Standby vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/storage-d3-modern-standby.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [Hard disk idle timeout](hard-disk-idle-timeout.md). Sleep-vs-forever diagnoses S0ix pausing the hourly. DISKIDLE is minutes while the session is still awake. [Network connectivity in Standby](network-standby-connectivity.md) is the NIC during S0ix. NVMe APST is the drive dropping its own power states while the PCIe function is still D0. This pack is the remaining storage PCI D-state during S0ix: Storport **StorageD3InModernStandby** can put inbox StorNVMe / StorAHCI into D3 (often D3cold) the moment the laptop enters Modern Standby.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep timeouts, DISKIDLE Never, ASPM Off, and AHCI LPM Active can already be honest. The process is still alive. Resume is not a boot. RAM is still there. Inbox storage still took the boot disk to PCI **D3** for Modern Standby. First Git object waits. Event 129 (Reset to device, `\Device\RaidPort0`) on stornvme/storahci. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks the NVMe died. Storport D3’d it.

Microsoft’s documented key:

- Path: `HKLM\SYSTEM\CurrentControlSet\Control\Storage\StorageD3InModernStandby`
- Type: `REG_DWORD`
- `0` — Disable D3 support
- `1` — Enable D3 support

If the value is **not configured**, Storport checks ACPI `_DSD` `StorageD3Enable`, then a platform allowlist. Missing is not Disabled.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| S0ix paused the hourly; tasks never ran | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| NIC died only after Standby; disk was fine | [network-standby-connectivity](network-standby-connectivity.md) |
| Session still awake. First write after ~20 minutes waits on a spun-down disk | [hard-disk-idle-timeout](hard-disk-idle-timeout.md) |
| Disk stalls while still D0 / session unlocked. Drive dropped NVMe PS on its own | NVMe APST. Sibling layer. Not this click. |
| USB4/Thunderbolt dock or NVMe drops while awake | [pcie-link-state-power](pcie-link-state-power.html) |
| SATA PHY flaps; HIPM/DIPM is not Active | [ahci-link-power-management](ahci-link-power-management.html) |
| `powercfg /a` lists S0 Low Power Idle. DISKIDLE already Never if the row exists. Resume stalls or Event 129. StorageD3InModernStandby is 1 or missing | **This page** |
| `powercfg /a` has no S0 Low Power Idle (classic S3 only) | This page does not apply. Stop. Not a fail. |

Do not set StorageD3InModernStandby to 0 as the first click on a new host. Do not use `PlatformAoAcOverride` to hide a D3 stall.

## What to change (plugged-in Grok desk)
1. Confirm `powercfg /a` lists Standby (S0 Low Power Idle). This page does not disable Modern Standby. It stops Storport from D3’ing the disk *during* it.
2. Confirm DISKIDLE is already Never on AC if the row exists. ASPM Off and AHCI LPM Active on AC if those buses exist.
3. Query `HKLM\SYSTEM\CurrentControlSet\Control\Storage\StorageD3InModernStandby`. There is usually no Power Options row. Windows Configuration Designer names the same policy StorageD3InModernStandby / Enable Storage Device D3.
4. Set DWORD **0**. Reboot so Storport reloads. A travel cube that actually lives on battery may leave 1. A desk that never unplugs should not pretend it is a travel cube.
5. Leave ACPI `_DSD` StorageD3Enable alone. That is firmware. The registry override is the operator click.
6. Leave APST, DISKIDLE, and `PlatformAoAcOverride` alone on this click.
7. Leave the current plan in place. This is one Storport DWORD, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.

```
powercfg /a
reg query HKLM\SYSTEM\CurrentControlSet\Control\Storage /v StorageD3InModernStandby
reg add HKLM\SYSTEM\CurrentControlSet\Control\Storage /v StorageD3InModernStandby /t REG_DWORD /d 0 /f
```

Reboot after the add. Query again. **0x0** is the pass. A missing value before the add means Storport may still follow `_DSD` / allowlist. After reboot, a still-missing key means the write did not stick; do not invent a second path under `Control\Power`. Third-party RAID/NVMe miniport is a skip. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. DISKIDLE already Never on AC if the row exists. ASPM / AHCI LPM already honest if those rows exist.
2. `StorageD3InModernStandby` is 0 after reboot. Missing after the add is a fail of the write, not a skip.
3. Short S0ix, lid closed, cooling stand in place. Resume without a vanished-disk BitLocker prompt. Disk stays Present. No re-enumerate.
4. First Git object / Grok session write after resume is not a multi-second stall. One silent Event 129 reset storm is a fail if the DWORD was not 0.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a D3cold boot disk is not forever.
6. Classic S3-only host = skip, not a red soak. No fourth Grok TUI.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not Network connectivity in Standby. That is [network-standby-connectivity](network-standby-connectivity.html).
- Not DISKIDLE. That is [hard-disk-idle-timeout](hard-disk-idle-timeout.html).
- Not NVMe APST. Drive-autonomous PS while D0. Wrong click here.
- Not PCIe ASPM and not AHCI LPM.
- Not `PlatformAoAcOverride`. That kills S0ix. Wrong layer.
- Not an NVMe SKU.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
