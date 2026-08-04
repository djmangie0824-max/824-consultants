# NVMe Install Pack — Ubuntu local AI hosts
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-04 · Companion to public review page · $19 list price

## Goal
Install an NVMe on Ubuntu for a local AI / cluster host without bricking boot order.

## Pre-flight
- Confirm backup of critical data
- Note current `lsblk` and boot device
- Have a USB recovery stick ready

## Order (do not skip)
1. Physically seat NVMe, power on, enter firmware if needed to enable NVMe
2. Boot existing OS; confirm device with `lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,MODEL`
3. Partition + filesystem only on the target NVMe (double-check device letter)
4. Mount, move data or clone carefully; update fstab / bootloader only after mount test
5. Reboot once; verify boot and thermal under load

## Endurance gate
Would we buy this drive with zero commission for 24/7 local inference? If no, do not recommend it.

## Tracking links
Pending Amazon Associates SiteStripe. Content is ready; tags inject after approval.

## Ownership
ONLY YOU. FOREVER. · Full write-up: /reviews/nvme-ubuntu-local-ai.html
