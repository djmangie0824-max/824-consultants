# Intel Graphics panel power saving vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/intel-graphics-panel-power.html

Companion to [turn off display after](turn-off-display-after.html), [console lock display off](console-lock-display-off.html), and [PCI Express Link State Power Management](pcie-link-state-power.html). VIDEOIDLE, VIDEOCONLOCK, and ASPM can already be honest and dual ultrawide still drop. This pack is the remaining GPU encoder: **Intel Graphics Power Plan** and Intel panel / display power saving. The iGPU parks DP/HDMI. The dock re-enumerates. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Sleep, lid, Turn off display after, Console lock, and ASPM can already be honest. The process is still alive. The session is still unlocked. Intel Graphics Settings still lets the display engine nap. Balanced / Maximum Battery Life on the Intel Graphics Power Plan, Display Power Saving Technology, and Panel Self-Refresh can starve the DP/HDMI encoder. The panels go black. The dock treats it as unplug. Windows rebuilds the desktop. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks VIDEOIDLE lied. The GPU panel-power policy napped the link.

On this class of laptop the Intel iGPU is often the display engine even when NVIDIA is rendering. This is not Sleep. This is not unlocked Display minutes. This is not lock-screen minutes. This is not ASPM. `powercfg /a` still reports the same standby type. `powercfg /requests` can still be None. VIDEOIDLE can still be 0. The Intel subgroup is the liar.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| Session unlocked. Panels black after 5–10 minutes. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html) |
| VIDEOIDLE already 0. Session locked. Panels black in about a minute | [console-lock-display-off](console-lock-display-off.html) |
| USB4/Thunderbolt dock or NVMe vanishes; USB suspend already Disabled | [pcie-link-state-power](pcie-link-state-power.html) |
| Cable yank on sit/stand rise; Windows and Intel timers already honest | [DisplayPort cable](../reviews/displayport-cable-sitstand.html) |
| No Intel UHD / Iris / Arc / HD Graphics in Display adapters | Skip. This SKU has no Intel display engine. Not a fail. Not a registry hack. |
| VIDEOIDLE 0. Console lock 0. ASPM Off. Session unlocked. Named task Ready / 267009. Dual ultrawide drop. Intel Graphics Power Plan is not Maximum Performance on AC, or Display Power Saving Technology is still on | **This page** |

Do not set Intel Graphics Power Plan to Maximum Performance as the first click on a new host. Sleep, lid, Turn off display after, Console lock, and ASPM first. Missing Intel adapter = skip.

## What to change (plugged-in Grok desk)
1. Confirm the Windows display and PCIe layers are already done — Turn off display after is 0 on AC. Console lock display off is 0 on AC if the GUID exists. PCI Express Link State Power Management is Off on AC. See [turn-off-display-after](turn-off-display-after.html). If VIDEOIDLE is still 5–10 minutes, stop here.
2. Confirm an Intel display adapter exists. Device Manager → Display adapters. Intel UHD, Iris, Arc, or HD Graphics must be Present. Hybrid NVIDIA + Intel still uses this page when Intel owns the outputs. NVIDIA-only or AMD-only SKUs skip. Do not disable the Intel adapter. Do not uninstall the driver.
3. Power Options → Change plan settings → Change advanced power settings → **Intel(R) Graphics Settings** → **Intel(R) Graphics Power Plan**.
4. Set **Plugged in** to **Maximum Performance**. On battery may stay Balanced or Maximum Battery Life if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube. If the Intel subgroup is missing, skip this GUI row and use Command Center.
5. Intel Graphics Command Center / Intel Graphics Software → System → Power. On AC, **Display Power Saving Technology** Off. **Panel Self-Refresh** Off if the row exists. Legacy Intel HD Graphics Control Panel names the same idea **Panel Power Saving** — Off / 0 on AC. Do not hunt NVIDIA Power management mode on this page.
6. Leave the current Windows plan in place. This is one Intel driver knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
Get-PnpDevice -Class Display | Format-Table Status, FriendlyName
powercfg /query SCHEME_CURRENT SUB_VIDEO VIDEOIDLE
powercfg /query SCHEME_CURRENT SUB_PCIEXPRESS
powercfg /query SCHEME_CURRENT 44f3beca-a7c0-460e-9dfc-c6b29bba6c22
powercfg /setacvalueindex SCHEME_CURRENT 44f3beca-a7c0-460e-9dfc-c6b29bba6c22 36186c97-ef0c-4f90-877d-0365058721eb 2
powercfg /setactive SCHEME_CURRENT
powercfg /a
```

The Intel subgroup GUID is the driver-injected Intel(R) Graphics Settings block. The setting GUID is Intel(R) Graphics Power Plan. AC index **2** is Maximum Performance. **0** is Maximum Battery Life. **1** is Balanced. Those are Intel’s plan values, not VIDEOIDLE seconds. Apply with `/setactive` or the GUI change does not take. If powercfg omits `44f3beca-…`, this driver did not inject the subgroup — stop at Command Center; do not invent a registry paste on a public page. VIDEOIDLE is unlocked Display minutes, not this click. VIDEOCONLOCK is lock-screen minutes, not this click. `SUB_PCIEXPRESS` is ASPM, not this click. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. VIDEOIDLE already 0 on AC. Console lock already 0 on AC if the GUID exists. ASPM already Off on AC. Lid close already Do nothing on AC. Otherwise this soak is lying about Windows display and PCIe.
2. Idle 30 minutes, session unlocked, lid closed, dedicated NIC plugged, dual ultrawide up. Panels stay on. A black-then-handshake on first input is a fail if Intel Graphics Power Plan was not Maximum Performance on AC, or if Display Power Saving Technology was still on.
3. Device Manager still shows the Intel adapter Present. A brief yellow bang then recover on the Intel GPU is a fail on this page, not a cable fail.
4. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a dead DP link is not forever.
5. The Intel AC index still 2 when the GUID exists. If someone set Balanced to "save the iGPU," restore Maximum Performance. Do not "fix" it by switching the whole Windows plan to High performance.
6. No Intel adapter = skip, not a red soak. Missing Intel subgroup + no Command Center Power page = skip, not a registry paste.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the encoder stayed awake.

## What this page is not
- Not turn-off-display-after. That is [turn-off-display-after](turn-off-display-after.html).
- Not console-lock-display-off. That is [console-lock-display-off](console-lock-display-off.html).
- Not PCI Express ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not NVIDIA Control Panel Power management mode. If Display adapters has no Intel device, skip.
- Not “disable Intel Graphics” and not a driver uninstall.
- Not a DisplayPort SKU. That is [displayport-cable-sitstand](../reviews/displayport-cable-sitstand.html).
- Not a High-performance Windows plan essay. One Intel driver setting.
- Not a Linux systemd unit. This host is Windows.
- Not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
