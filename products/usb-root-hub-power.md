# USB Root Hub power vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/usb-root-hub-power.html

Companion to [USB selective suspend](usb-selective-suspend.html) and [USB 3 LPM](usb3-link-power-management.html). Power Options USB selective suspend is the plan policy. This page is the **per-hub Device Manager checkbox**: USB Root Hub → Power Management → Allow the computer to turn off this device to save power.

## What this is
The named task can still show Ready while the hub that carries Ethernet is already off at the PnP layer. Selective suspend Disabled on AC is not the same click as unchecking that box on the Root Hub that actually feeds the NIC.

## Click path
1. Confirm USB selective suspend is already Disabled on AC. If not, stop — that is the other page.
2. Device Manager → Universal Serial Bus controllers → the USB Root Hub feeding the dedicated NIC / fallback hub.
3. Properties → Power Management → uncheck **Allow the computer to turn off this device to save power**.
4. Do not cargo-cult every hub on the machine. The hub that carries Ethernet is the one that lies.
5. Soak 30 minutes idle. NIC stays Present. Named task still next-runs.

## Not
Not USB 3 LPM. Not ASPM. Not systemd. Not live capital.
