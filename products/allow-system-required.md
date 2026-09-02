# Allow system required policy vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/allow-system-required.html  
As an Amazon Associate I earn from qualifying purchases. Tag `824consultant-20`.

Companion to powercfg /requests and Allow wake timers. Allow system required policy is `SYSTEMREQUIRED` GUID `a4b195f5-8225-47d8-8012-9d41369786e2` under `SUB_SLEEP`. Indexes: **0 = No**, **1 = Yes**. This host: Balanced **Yes on AC** and **Yes on DC**. Confirm. Do not rewrite Yes to Yes. Do not cargo-cult No.

Forum cargo-cult “set it to No so nothing can pin sleep” turns a later honest SYSTEM holder into a no-op. This desk already reads Yes / Yes. That is the pass.

```
powercfg /qh SCHEME_CURRENT SUB_SLEEP SYSTEMREQUIRED
rem If AC is already Yes (1): stop.
```

Host-forever is Task Scheduler `LEXXII-Materialize-Forever`. Not systemd. NLV stays off Pages.

ONLY YOU. FOREVER.
