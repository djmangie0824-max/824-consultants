# Hardware-accelerated GPU scheduling vs a forever Grok desk
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/hags-gpu-scheduling.html

Companion to [processor boost mode](processor-boost-mode.html), [Intel Graphics panel power](intel-graphics-panel-power.html), [system cooling policy](system-cooling-policy.html), and [PCIe ASPM](pcie-link-state-power.html). Boost is CPU turbo. Intel panel power is the iGPU encoder nap. Cooling policy is fans vs throttle. ASPM is the PCIe link. This pack is the remaining WDDM click: **Settings → System → Display → Graphics → Default graphics settings → Hardware-accelerated GPU scheduling** (HAGS). The GPU’s hardware scheduler takes command-buffer work the OS used to queue. It is a **reboot click**. Registry `HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers` value `HwSchMode` is **read-only confirm** (`1` = off, `2` = on). It does not unstick GitHub MCP. Task Scheduler can still show Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Boost, Intel panel power, cooling, and ASPM can already be honest on AC. After a Windows Update or a vendor driver drop, the compositor hitch, a copy stall, or a TDR toast shows up. `grok.exe` looks hung. `schtasks` still prints Ready and last result 267009. The operator thinks GitHub MCP died. HAGS flipped, or never applied because nobody rebooted.

HAGS is WDDM 2.7+ handing GPU scheduling to the adapter. On a forever Grok desk the GPU is mostly the display engine, not a game. On can cut CPU overhead of the software scheduler. On can also hitch a mixed iGPU+dGPU compositor. Off can be the honest desk if On was the stutter. Neither state unblocks a Contents PUT. The forever desk wants a **known rebooted state**, Settings matching the registry, and a skip when the toggle is missing.

Do not install systemd to paper over a WDDM toggle. Do not invent a driver SKU. Do not paste GPU-Z, dxdiag, or board serials. Do not cargo-cult On as “always faster” or Off as “always safer.”

Grok in-session schedulers expire in 7 days even when durable. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle or a driver drop | Layer |
|---|---|
| TUI starves; Processor performance boost mode is Disabled | [processor-boost-mode](processor-boost-mode.html) |
| DP/HDMI drops; Intel panel / display power saving still on | [intel-graphics-panel-power](intel-graphics-panel-power.html) |
| Closed-lid Ultra 7 throttles; System cooling policy is Passive | [system-cooling-policy](system-cooling-policy.html) |
| Dock or NVMe vanishes then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) |
| Unlocked display minutes still fire; VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html) |
| Per-app Graphics setting is Power saving / High performance for grok.exe | App GPU preference. Not HAGS. |
| Variable refresh rate or Optimizations for windowed games is the row you are staring at | Sibling on Default graphics settings. Not this click. |
| GitHub MCP / Contents PUT 401; PAT missing; GCM empty | Credential layer. HAGS reboot does not mint a token. |
| Default graphics settings has no Hardware-accelerated GPU scheduling row | This edition or GPU did not expose HAGS. **Skip.** Not a fail. Not a registry hack. |
| Session still awake. Named task Ready / 267009. Compositor hitch or TDR after a driver/Windows drop. HAGS row exists. State unknown or Settings disagrees with HwSchMode because nobody rebooted | **This page.** WDDM HAGS. Reboot click. Not boost. Not ASPM. |

Do not drag HAGS as the first click on a new host. Sleep, lid, ASPM, Intel panel power, cooling, and boost first. Missing toggle = skip, not a DWORD create on a public page. The click does not apply until reboot.

## What to change (plugged-in Grok desk)
1. Confirm the earlier layers are already done — plugged-in sleep is not 5–20 minutes. Lid close on AC is Do nothing. ASPM Off on AC. Intel panel power already honest if an Intel adapter exists. Cooling policy Active on AC. Boost not Disabled on AC. See [pcie-link-state-power](pcie-link-state-power.html), [intel-graphics-panel-power](intel-graphics-panel-power.html), [system-cooling-policy](system-cooling-policy.html), and [processor-boost-mode](processor-boost-mode.html).
2. Settings → System → Display → Graphics → **Default graphics settings** (some builds: Change default graphics settings). Look for **Hardware-accelerated GPU scheduling**. If the row is missing, this Windows edition or this GPU/driver did not expose HAGS. Stop. That is a skip, not a fail.
3. Set a known On or Off — then **reboot**. The forever desk wants a documented state, not a mid-session flip. Do not cargo-cult On because a forum said a board family requires it. Do not cargo-cult Off because a game stuttered on a different SKU. If On is hitching the compositor on this mixed iGPU+dGPU desk, Off + reboot is the honest try. If Off is already the known state and the display stack is already honest, do not flip On hoping a Contents PUT recovers. Leave Variable refresh rate and Optimizations for windowed games as siblings.
4. Leave per-app Graphics, vendor control panels, and the Windows plan alone on this click. App GPU preference is not HAGS. Do not invent a vendor SKU. Do not switch the plan to High performance to hide a WDDM toggle.
5. Read-only confirm after reboot. `HwSchMode` under `HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers`. **1 = off. 2 = on.** Settings is the live tell. Registry is the confirm. If the value is missing after a missing Settings row, that is the same skip. Do not `New-ItemProperty`. Do not `reg add`. Do not paste a `.reg` file on this public page.
6. Leave GitHub MCP, PAT, and GCM alone. A HAGS reboot does not mint a token and does not un-hang Git Credential Manager. Credential 401 is still 401.
7. Confirm, then soak. Do not paste live brokerage numbers. Do not paste `auth.json`. Do not paste GPU-Z serials.

```
Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name HwSchMode
# 1 = off    2 = on
# Read-only confirm after Settings + reboot.
# If HwSchMode is missing, this edition did not expose HAGS — skip.
# Do not Set-ItemProperty. Do not reg add. Do not create the DWORD.
```

Settings is the click. Reboot is required. `HwSchMode` 1/2 is the confirm, not the write. A value of 0, a missing name, or a missing Settings row is the same public instruction: **skip**. Do not invent WDDM versions, driver branches, or board SKUs. Do not paste `dxdiag`. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not systemd.

## Soak test
1. Boost, cooling, Intel panel power, and ASPM already honest on AC. Otherwise this soak is lying about CPU, encoder, or link.
2. If the HAGS row is missing, the soak is a skip, not a red. Do not create `HwSchMode`.
3. If the row exists: Settings On or Off matches `HwSchMode` 2 or 1 *after* reboot. A Settings flip with no reboot is not a pass.
4. Idle past a few minutes. Compositor still paints. TUI still accepts input. Named task still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 is still-running, not proof HAGS is already known.
5. GitHub MCP still 401 after a clean HAGS reboot is still a credential miss. This page did not fail. Do not mint a Vercel slug. No fourth Grok TUI. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not processor boost / turbo. That allow is [processor-boost-mode](processor-boost-mode.html).
- Not Intel panel / display power saving. That encoder is [intel-graphics-panel-power](intel-graphics-panel-power.html).
- Not system cooling policy. That thermal row is [system-cooling-policy](system-cooling-policy.html).
- Not PCIe ASPM. That link is [pcie-link-state-power](pcie-link-state-power.html).
- Not Turn off display after. That idle is [turn-off-display-after](turn-off-display-after.html).
- Not a GitHub MCP fix, PAT mint, or GCM un-hang.
- Not a driver SKU, GPU-Z dump, or board serial.
- Not a registry write. Missing toggle = skip.
- Not a High-performance plan essay. One Settings overlay + reboot.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
