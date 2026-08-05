# NVMe Ubuntu Install Order Pack
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-05 · Public-safe · **$19** list price  
Companion review: https://djmangie0824-max.github.io/824-consultants/reviews/nvme-ubuntu-local-ai.html  
Landing: https://djmangie0824-max.github.io/824-consultants/products/nvme-install-pack.html

## Goal
Install order that avoids bricked ESP layouts on local AI hosts running Ubuntu.

## Pre-flight
- [ ] Recovery USB imaged and tested on a spare port
- [ ] Board UEFI updated (vendor notes checked)
- [ ] NVMe enumerated in UEFI before OS install
- [ ] SMART baseline tool available (`smartctl` plan)

## Install order (do not skip)
1. Confirm firmware + NVMe enumeration (not a mystery SATA alias).
2. Write GPT with correct EFI system partition size (modern ESP).
3. Install root on the NVMe only after the installer sees the drive as non-removable.
4. Validate `fstab` and rebuild initramfs before first reboot under load.
5. Short write soak (fio or similar) before parking irreplaceable model caches.
6. Record SMART health baseline the day it enters production.

## Failure modes this pack prevents
- Silent boot-order traps after dual-drive installs
- ESP on the wrong disk
- Remount failures under continuous inference
- Trusting peak synthetic scores over endurance + thermal path

## Post-install operator checks
- [ ] Cold boot twice cleanly
- [ ] `lsblk` + mount points match intent
- [ ] Thermal pad / airflow under sustained load
- [ ] Associate / purchase documentation saved privately if used for tax

## Related public criteria
Samsung 990 PRO 1TB is Rank-1 on the public site when install order is correct. Tag `824consultant-20` on the live card.  
#ad · As an Amazon Associate I earn from qualifying purchases.

## Ownership
ONLY YOU. FOREVER. · 824 Consultants LLC
