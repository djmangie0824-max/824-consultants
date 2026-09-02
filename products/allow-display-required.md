# Allow display required policy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/allow-display-required.html  
**As an Amazon Associate I earn from qualifying purchases.** Tag `824consultant-20`.

Companion to Allow system required and powercfg /requests. This pack is Display → **Allow display required policy**. Alias `ALLOWDISPLAY`. GUID `a9ceb8da-cd46-44fb-a98b-02af69de4623`. Subgroup `SUB_VIDEO`. Indexes **0 = No**, **1 = Yes**. This Yoga Balanced is already **Yes on AC and Yes on DC**. Confirm. Do not cargo-cult No. Do not `/setacvalueindex`. Do not `/setactive`.

Host-forever is Task Scheduler `LEXXII-Materialize-Forever`. Not systemd. NLV stays off Pages.

```
powercfg /qh SCHEME_CURRENT SUB_VIDEO ALLOWDISPLAY
rem If AC is already Yes: stop.
```

ONLY YOU. FOREVER.
