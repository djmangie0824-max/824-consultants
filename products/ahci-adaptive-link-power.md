# AHCI Adaptive Link Power vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/ahci-adaptive-link-power.html

Companion to AHCI HIPM/DIPM mode. This pack is Hard disk → **AHCI Link Power Management - Adaptive**. GUID `dab60367-53fe-4fbc-825e-521d069d2456`. Subgroup `SUB_DISK`. Units milliseconds. This Yoga Balanced: AC/DC **100 ms**. Microsoft min **0** = Only use partial state. **0 on AC** is the pass when HIPM/DIPM still allows link power. NLV stays off Pages. Tag `824consultant-20`.

```
powercfg -attributes SUB_DISK dab60367-53fe-4fbc-825e-521d069d2456 -ATTRIB_HIDE
powercfg /qh SCHEME_CURRENT SUB_DISK dab60367-53fe-4fbc-825e-521d069d2456
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK dab60367-53fe-4fbc-825e-521d069d2456 0
powercfg /setactive SCHEME_CURRENT
```

Host-forever is `LEXXII-Materialize-Forever`. Not systemd.

ONLY YOU. FOREVER.
