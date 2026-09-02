# NVMe Autonomous Power State Transition vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/nvme-apst.html

Companion to [PCIe ASPM](pcie-link-state-power.html) and [DISKIDLE](hard-disk-idle-timeout.html). ASPM can already be Off on AC and Turn off hard disk after can already be Never and a ship still stalls on the first write after idle. This pack is the remaining NVMe controller table: **Autonomous Power State Transition**. The disk stays Present. Grok CLI looks hung. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, USB, PCIe ASPM, DISKIDLE, and AHCI LPM can already be honest. The process is still alive. The session is still unlocked. The TUI paints once a minute. NVMe Identify Controller advertises an APST table. The controller walks PS0 → PS3/PS4 on its own idle timers. No host Set Features required. Device Manager still says Present. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks Git hung. An NVMe power state napped.

This is not ASPM L0s/L1. This is not PCI D3 by itself. This is not HIPM/DIPM. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. Stock Windows Power Options has no honest `APST` alias. Do not invent one.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon. Do not paste `nvme_core.default_ps_max_latency_us=0` on this Windows profile.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Thunderbolt/USB4 dock or NVMe *disappears* then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) |
| SATA PHY flaps; HIPM/DIPM is not Active | [ahci-link-power-management](ahci-link-power-management.html) |
| Mechanical or USB spinning disk waits on spin-up; DISKIDLE is not 0 | [hard-disk-idle-timeout](hard-disk-idle-timeout.html) |
| USB hub / USB NIC slept | USB playbooks. Wrong page. |
| USB-C NVMe stick brown-out or UASP drop | [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html) |
| ASPM already Off on AC. DISKIDLE already Never if the row exists. Session awake. Named task Ready / 267009. NVMe stays Present. First write after seconds-to-minutes is a stall | **This page** |
| No BIOS APST row, no vendor APST toggle, Device Manager has no Power Management tab, soak writes are clean | This firmware did not expose a host click, or APST is already harmless. Stop. Not a fail. Not a registry hack. |

Do not hunt APST as the first click on a new host. APST can fire in seconds, not only at the 20-minute DISKIDLE lie. Missing host click plus a clean soak is a skip.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done — plugged-in sleep / hibernate are not 5–20 minutes. Lid close on AC is Do nothing. See [sleep-vs-forever](windows-sleep-vs-forever.html). If the desk still *intends* to sleep every idle, stop here.
2. Confirm PCIe ASPM is already Off on AC. If Link State Power Management is still Moderate or Maximum, that is [PCIe ASPM](pcie-link-state-power.html), not this page. A device that vanishes is the link. A device that stays Present and stalls is APST.
3. Confirm DISKIDLE is already Never on AC if the row exists. [Turn off hard disk after](hard-disk-idle-timeout.html) is minutes, not NVMe PS3. AHCI LPM already Active if a SATA row exists.
4. Name the NVMe driver before you click. Device Manager → Storage controllers. *Standard NVM Express Controller* is Microsoft `stornvme`. Intel RST / “Chipset SATA/PCIe RST Premium Controller” is a different UI. Do not switch RST to Microsoft storNVMe on a public page. That can hide the boot volume.
5. Clear PCI D3 on the NVMe function. Device Manager → the NVMe controller → Properties → Power Management → uncheck **Allow the computer to turn off this device to save power**. That is PCI D3, not APST. Do it so D3 is not the remaining liar. It is not the APST table itself.
6. Disable APST where the firmware actually exposes it. BIOS/UEFI: a row named Autonomous Power State Transition / NVMe APST / NVMe power state. Off / Disabled on an AC desk. If the only BIOS row is PCI Express ASPM or L1 Substates, that is the [PCIe page](pcie-link-state-power.html) — leave it. Intel Memory and Storage Tool or the RST UI: APST = Disabled only if that tool is already the driver path. Do not download a vendor dashboard as a required step. Do not flash firmware from this page.
7. Leave write-cache, TRIM, and High performance alone. Policies → write caching is not APST. Do not rename the plan. Do not claim a fleet GPO. Do not paste `nvme_core.default_ps_max_latency_us`. That is Linux. This host is Windows.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_PCIEXPRESS
powercfg /query SCHEME_CURRENT SUB_DISK DISKIDLE
powercfg /a
powershell -NoProfile -Command "Get-PnpDevice | Where-Object { $_.FriendlyName -match 'NVM|NVMe|RST' } | Format-Table Status, Class, FriendlyName -AutoSize"
```

`SUB_PCIEXPRESS` must already read Off on AC. `DISKIDLE` AC index 0 is Never. The PowerShell line names the controller so you do not treat RST as storNVMe. APST itself is BIOS / vendor / firmware — not a fake `powercfg` subgroup. If BIOS and vendor UI both omit APST, stop; do not invent a registry GUID on a public page. If the NVMe stays Present and the first write after idle is still a multi-second stall after D3 is cleared and every exposed APST row is Off, that is firmware-autonomous with no host click. Stop. Not a registry paste. Not a new enclosure until the [enclosure criteria](../reviews/nvme-enclosure-operator.html) are the actual fail. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Timeouts already honest. PCIe ASPM already Off on AC. DISKIDLE already 0 if the row exists. AHCI LPM already Active if the row exists. Otherwise this soak is lying about the bus or the minutes knob.
2. Idle 30 minutes, lid closed, dedicated NIC plugged. Also fail a 2-minute quiet if the first write already stalls — APST timers are often seconds, not 20 minutes.
3. Device Manager still shows the NVMe Present. A disappear/re-enumerate is [ASPM](pcie-link-state-power.html), not this page.
4. The Grok TUI still accepts input. First Git object / Pages write after idle is not a multi-second wait. One silent stall is a fail if an APST row existed and was not Off.
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a napping NVMe power state is not forever.
6. No host APST click + clean first write = skip, not a red soak. Do not invent an APST GUID in the registry to make this page apply.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof PS0 held. Do not "fix" it by switching the whole plan to High performance. Do not install systemd.

## What this page is not
- Not PCIe ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not AHCI LPM. That is [ahci-link-power-management](ahci-link-power-management.html).
- Not DISKIDLE. That is [hard-disk-idle-timeout](hard-disk-idle-timeout.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not an NVMe enclosure SKU. That is [nvme-enclosure-operator](../reviews/nvme-enclosure-operator.html).
- Not the Ubuntu install order pack. That is [nvme-install-pack](nvme-install-pack.html).
- Not `nvme_core.default_ps_max_latency_us=0` and not a Linux systemd unit. This host is Windows.
- Not a driver swap from Intel RST to Microsoft storNVMe.
- Not a High-performance plan essay. One controller table.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
