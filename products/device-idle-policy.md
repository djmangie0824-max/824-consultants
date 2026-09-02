# Device idle policy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/device-idle-policy.html

Companion to [USB selective suspend](usb-selective-suspend.html) and [USB 3 LPM](usb3-link-power-management.html). Those packs already say Off on AC. This pack is the remaining PCI/device idle personality: **Device idle policy**. GUID `4faab71a-92e5-4726-b531-224559672d19`. Balanced default is often Power savings (1). The dedicated NIC still drops after idle. Task Scheduler still shows Ready. Power savings is not USB selective suspend.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. USB selective suspend can already be Off. USB 3 LPM can already be Off. A GitHub MCP ship still dies after idle. Device Manager still lists the NIC. First packet after idle waits. `schtasks` still prints Ready and last result 267009. The operator thinks USB suspend came back. Device idle policy is still Power savings. That personality parks idle devices independently of the USB checkboxes. Performance (0) on AC is the pass for this desk.

This is not Sleep. This is not ASPM. This is not EEE. A vanished Thunderbolt dock is ASPM. A Green Ethernet gap is EEE. This page is Present + idle-park under Power savings.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| USB selective suspend still On | [usb-selective-suspend](usb-selective-suspend.html) first |
| USB 3 LPM still On; SuperSpeed NIC drops | [usb3-link-power-management](usb3-link-power-management.html) |
| Hub timeout still short | [usb-hub-suspend-timeout](usb-hub-suspend-timeout.html) |
| PCIe dock vanishes then re-enumerates | [pcie-link-state-power](pcie-link-state-power.html) |
| Dedicated NIC gaps; EEE still On | [energy-efficient-ethernet](energy-efficient-ethernet.html) |
| GUID missing after unhide | This edition did not expose the knob. Stop. Not a fail. Not a registry hack. |
| USB suspend Off. USB 3 LPM Off. Session awake. Named task Ready / 267009. NIC stays listed. First packet after idle waits. Device idle policy on AC is Power savings | **This page.** DEVICEIDLE Performance on AC. |

Do not set Device idle policy as the first click. Sleep, lid, USB selective suspend, and USB 3 LPM first. Performance on AC is the pass. Hidden is not Performance.

## What to change (plugged-in Grok desk)
1. Confirm USB layers are already done — selective suspend Off on AC. USB 3 LPM Off on AC. See [usb-selective-suspend](usb-selective-suspend.html) and [usb3-link-power-management](usb3-link-power-management.html). If those are still On, stop here.
2. Unhide the row if it is missing. Device idle policy is ATTRIB_HIDE on many images. Missing from the GUI before this step is expected, not a skip.
3. Power Options → Change plan settings → Change advanced power settings → **Device idle policy**. Set **Plugged in** to **Performance**. On battery may stay Power savings if the laptop actually travels.
4. Leave USB, ASPM, EEE, and hub timeout alone on this click. Those are siblings. This GUID is the idle personality, not the USB checkbox.
5. Leave the current plan in place. Not a switch to High performance. Do not claim a fleet GPO.
6. Confirm.

```
powercfg -attributes SUB_NONE 4faab71a-92e5-4726-b531-224559672d19 -ATTRIB_HIDE
powercfg /query SCHEME_CURRENT SUB_NONE 4faab71a-92e5-4726-b531-224559672d19
powercfg /setacvalueindex SCHEME_CURRENT SUB_NONE 4faab71a-92e5-4726-b531-224559672d19 0
powercfg /setactive SCHEME_CURRENT
```

GUID `4faab71a-92e5-4726-b531-224559672d19` is Device idle policy. Typical values: **0 = Performance**, **1 = Power savings**. 0 on AC is the pass for this desk. If powercfg omits the GUID after unhide, this edition did not expose the knob — stop. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. USB selective suspend Off. USB 3 LPM Off. Otherwise this soak is lying about USB.
2. Idle past a few minutes, lid closed, dedicated NIC plugged. First GitHub MCP or Pages probe is not a wait. Device Manager still lists the NIC. No re-plug.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a napped NIC is not forever if this row is still Power savings.
4. Missing GUID after unhide = skip, not a red soak. Do not invent the value in the registry.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof DEVICEIDLE is already Performance. Host-forever is that named Windows task. Grok in-session schedulers still expire in 7 days even when durable.

## What this page is not
- Not USB selective suspend. That checkbox is [usb-selective-suspend](usb-selective-suspend.html).
- Not USB 3 LPM. That SuperSpeed park is [usb3-link-power-management](usb3-link-power-management.html).
- Not PCIe ASPM. That link is [pcie-link-state-power](pcie-link-state-power.html).
- Not EEE. That NIC gap is [energy-efficient-ethernet](energy-efficient-ethernet.html).
- Not a Linux systemd unit. This host is Windows.
- Not a SKU. Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
