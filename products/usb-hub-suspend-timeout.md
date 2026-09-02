# USB hub selective suspend timeout vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/usb-hub-suspend-timeout.html

Companion to [USB selective suspend](usb-selective-suspend.html) and [USB 3 LPM](usb3-link-power-management.html). Those packs are the on/off (Enabled / Disabled) and SuperSpeed U1/U2. This pack is the remaining USB timer: **USB settings → Hub Selective Suspend Timeout**. GUID `0853a681-27c8-4100-a2fd-82013e970683`. No powercfg alias. Units in the dump are **milliseconds**. Default index is often **50** — fifty milliseconds, not fifty seconds. Converted to seconds, the ceiling is 100. A 5-minute host pulse still looks Ready while the hub already napped.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only on a 5-minute Windows task. USB selective suspend can already be Disabled on AC. USB 3 LPM can already be Off. A fallback hub or dedicated USB NIC still vanishes tens of milliseconds after the ports go idle. Hub Selective Suspend Timeout is idle time for *all* USB hubs before the hub itself requests selective suspend.

Balanced hides the row. Hidden is the default, not a pass. Query it anyway. Index **50** is 50 ms. Maximum documented is **100000** ms = **100 seconds**. Math: this timer cannot outlast the pulse. An operator who raises the timeout instead of disabling selective suspend still loses Ethernet before the next fire. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks GitHub MCP died. A hub idle timer fired.

Zero on this GUID is not Never. Zero is immediate — 0 ms idle, then suspend. Do not cargo-cult `DISKIDLE 0` onto this row.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.md) |
| USB selective suspend still Enabled on AC, or the hub still has “turn off this device” | [usb-selective-suspend](usb-selective-suspend.html) first. This timeout cannot replace Disabled on a 5-minute pulse. |
| USB suspend already Disabled; SuperSpeed NIC still flaps | [usb3-link-power-management](usb3-link-power-management.html) first (U1/U2). |
| USB already honest; Thunderbolt/USB4 dock or NVMe still drops | [pcie-link-state-power](pcie-link-state-power.md) |
| NIC stays Present; ping gaps or speed downshifts | [energy-efficient-ethernet](energy-efficient-ethernet.md) |
| USB suspend Disabled. USB 3 LPM Off. Session awake. Named task Ready / 267009. Hub or USB NIC still vanishes in tens of ms after ports idle. Timeout index still 50 | **This page** |
| Timeout already queried; units milliseconds; raise to max still cannot cover 5 minutes; hub stays Present after Disabled | This firmware ignores the timer once Disabled is honest. Stop. Not a fail. Not a registry hack. |
| No dedicated NIC; Wi-Fi is the only path | Hardware fail. [USB Ethernet review](../reviews/usb-ethernet-operator-host.html) |

Do not set Hub Selective Suspend Timeout as the first click on a new host. Do not treat 0 as Never. Do not treat 100000 as forever. Do not cargo-cult `powercfg -attributes … -ATTRIB_HIDE` from a forum — query works while hidden.

## What to change (plugged-in Grok desk)
1. Confirm USB selective suspend **Plugged in** is already **Disabled**. Hub that carries Ethernet already unchecked for *Allow the computer to turn off this device to save power*. See [USB selective suspend](usb-selective-suspend.html). If that is still Enabled, stop here. A 100-second ceiling cannot cover a 5-minute pulse.
2. Confirm USB 3 LPM is already Off on AC if the row exists. If U1/U2 still parks SuperSpeed, that is [USB 3 LPM](usb3-link-power-management.html), not this page.
3. Query Hub Selective Suspend Timeout by GUID. It is often hidden from the GUI. Hidden is not the same as a forever timeout. Do not unhide as the first click.
4. Read **Possible Settings units** before you set anything. This GUID prints **Millisecond**. Index 50 = 50 ms. Index 100000 = 100 seconds. Index 0 = immediate suspend. Do not paste a `DISKIDLE 0` habit onto this row.
5. If the dump still shows 50 and a hub still naps in tens of ms after Disabled is honest — raise **Plugged in** toward **100000** (100 seconds) as a delay, not as forever. On battery may stay 50 if the laptop actually travels. A desk that never unplugs should not pretend it is a travel cube.
6. Leave the current plan in place. This is one USB timer, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg /query SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683
powercfg /query SCHEME_CURRENT SUB_USB
powercfg /a
```

`2a737441-1930-4402-8d77-b2bebba308a3` is `SUB_USB`. Sibling `48e6b7a6-50f5-4782-a5d4-53bb8f07e226` is USB selective suspend (0 = Disabled, 1 = Enabled) — that stays on [usb-selective-suspend](usb-selective-suspend.html). This GUID `0853a681-27c8-4100-a2fd-82013e970683` is the hub idle timer. No alias. Units are milliseconds. Minimum 0. Maximum 100000. Increment 1. Apply a GUI change with `/setactive SCHEME_CURRENT` or it does not take. If you set after reading units and Disabled is already honest:

```
powercfg /setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 100000
powercfg /setactive SCHEME_CURRENT
```

That second block is a delay to 100 seconds, not Never. Do not run it if USB selective suspend is still Enabled and you think the timer replaced Disabled. It did not. USB 3 LPM is SuperSpeed, not this click. PCIe ASPM is the dock/NVMe bus, not this click. If the GUID is missing from the query, this firmware or edition did not expose the knob. Stop. Do not invent a registry hack on a public page. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. USB selective suspend already Disabled on AC. Hub Power Management already honest. USB 3 LPM already Off on AC if the row exists. Lid close already Do nothing on AC.
2. Query the timeout GUID. Units milliseconds. 0 on AC is a fail. 50 on AC with a hub that vanishes in tens of ms is this page. 100000 on AC is the ceiling — still not a 5-minute pulse.
3. Idle 30 minutes, lid closed, cooling stand in place, dedicated NIC plugged. NIC stays Present. Hub stays enumerated. One silent re-enumerate is a fail if the timeout was still 50 and Disabled was already honest.
4. Ping out the USB NIC. One silent gap is a fail — unless USB suspend is still Enabled (wrong page), U1/U2 still flaps SuperSpeed (USB 3 LPM), or the NIC stays Present and only speed downshifts (EEE).
5. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. A Ready task with a hub that napped at 50 ms is not forever. A Ready task with timeout maxed at 100 s and suspend still Enabled is also not forever — go back to Disabled.
6. Firmware that ignores the timer once Disabled is honest = skip, not a red soak. Do not invent a registry paste to make this page apply.
7. No fourth Grok TUI. Last result 267009 is still-running, not proof the hub stayed up.

## What this page is not
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not USB 3 LPM. That is [usb3-link-power-management](usb3-link-power-management.html).
- Not PCI Express ASPM. That is [pcie-link-state-power](pcie-link-state-power.html).
- Not Energy Efficient Ethernet. That is [energy-efficient-ethernet](energy-efficient-ethernet.html).
- Not `DISKIDLE 0`. Hard-disk Never is [hard-disk-idle-timeout](hard-disk-idle-timeout.html). 0 on this GUID is immediate.
- Not a USB-C hub SKU. That is [usb-c-hub-operator-fallback](../reviews/usb-c-hub-operator-fallback.html).
- Not a High-performance plan essay. One USB timer.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
31consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
