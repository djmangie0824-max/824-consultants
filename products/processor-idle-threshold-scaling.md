# Processor idle threshold scaling vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/processor-idle-threshold-scaling.html

Companion to [idle promote / demote thresholds](processor-idle-promote-threshold.html). That pack writes the percent pair. This pack is whether the idle engine is allowed to **rescale** that pair: **Processor power management → Processor idle threshold scaling**. Alias `IDLESCALING`. GUID `6c2993b0-8f48-481f-bcc6-00dd2742aa06`. Values are **Disable scaling** (0) and **Enable scaling** (1). This host printed **Disable scaling on AC and DC**.

## What this is
The promote/demote pack names a hysteresis pair. Balanced default on this Yoga is 60% / 40%. The forever-desk click on that page is 100 / 80 on AC. Those numbers only stay those numbers if the engine is not allowed to rescale them. `IDLESCALING` Enable scaling (1) lets the idle engine move the thresholds with conditions. A soak that printed 100 / 80 can walk back toward a 60 / 40 feel without anyone reopening Power Options. `grok.exe` is alive. Task Scheduler still prints Ready and last result 267009. The operator thinks the percent pack failed. Scaling was Enabled.

This host already has Disable scaling (0). That is the pass. This page still ships because Enable scaling is a one-click undo of the percent pack, and because other images default differently. The click here is: query, keep 0, restore 0 if someone Enabled it. Do not Enable scaling on AC as a forever-loop upgrade. There is no upgrade. 0 is the hold.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## Live query on this host (2026-09-01)
| Field | This desk |
|---|---|
| Scheme | `SCHEME_BALANCED` `381b4222-f694-41f0-9685-ff5bb260df2e` |
| Subgroup | `SUB_PROCESSOR` `54533251-82be-4824-96c1-47b60b740d00` |
| Setting GUID | `6c2993b0-8f48-481f-bcc6-00dd2742aa06` alias `IDLESCALING` |
| Possible 0 | Disable scaling |
| Possible 1 | Enable scaling |
| AC / DC | `0x00000000` = Disable scaling |
| Sibling `IDLEDISABLE` | AC 0 / DC 0 Enable idle — this page still applies |
| Sibling `IDLEPROMOTE` / `IDLEDEMOTE` | AC/DC 60% / 40% until that pack runs. Different pack. |
| Sibling `IDLECHECK` | AC/DC 50 ms. Different pack. |
| Sibling `IDLESTATEMAX` | AC 0 / DC 0 no cap. Different pack. |

## Scaling is not the pair
| Layer | What it actually is |
|---|---|
| Processor idle promote / demote | The percent values. `IDLEPROMOTE` / `IDLEDEMOTE`. 60/40 vs 100/80. |
| Processor idle threshold scaling | Whether the engine may rescale those values. `IDLESCALING`. 0 = hold. 1 = drift. This page. |
| Processor idle time check | Sample window. Microseconds. Not a rescale. |
| Processor idle disable | Allow/deny. Not a rescale. |
| Processor idle state maximum | Depth cap. Not a rescale. |

100 / 80 with Enable scaling is a lie that looks true in the first `/qh` after the write. Do the percent pack and keep scaling Disabled.

## When this page applies
| Symptom after idle | Layer |
|---|---|
| Laptop went to S0ix / Modern Standby | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| IDLEDISABLE already 1 on AC | Scaling unused. [processor-idle-disable](processor-idle-disable.html) |
| Promote / demote still 60 / 40 and scaling already 0 | Write the pair. [processor-idle-promote-threshold](processor-idle-promote-threshold.html) |
| IDLECHECK still 50000 µs | [processor-idle-time-check](processor-idle-time-check.html) |
| IDLESTATEMAX still 0 | [processor-idle-state-maximum](processor-idle-state-maximum.html) |
| A named 100/80 pair drifted. `IDLESCALING` prints Enable scaling (1). Or a new image defaults to 1 | **This page.** Restore Disable scaling (0) on AC. |
| This Yoga already prints Disable scaling (0) | This page still applies as the hold. Do not Enable it. |

Do not Enable scaling as a forever-loop upgrade. If `/qh` omits the GUID, stop.

## What to change (plugged-in Grok desk)
1. Confirm the timeout layer is already done.
2. Confirm IDLEDISABLE is still Enable idle (0). If it is already Disable idle (1), scaling is unused.
3. Query `IDLESCALING` with `/qh` before you write. This host printed 0. If `/qh` omits the GUID, **stop**.
4. If AC is 1, set Plugged in to Disable scaling (0). If AC is already 0, do not write 1.
5. Do not Enable scaling to “help” 100/80. Enable scaling is the undo.
6. Leave promote, demote, time check, and state maximum as siblings.
7. Activate the scheme after any AC index write. Query again. AC `0x00000000` is the pass. `0x00000001` is Enable scaling — a fail.
8. Leave the Balanced (or current) plan in place. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLESCALING
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLESCALING 0
powercfg /setactive SCHEME_CURRENT
powercfg /qh SCHEME_CURRENT SUB_PROCESSOR IDLESCALING
```

If AC is already 0, the set line is a no-op hold, not a restamp of the percent pair.

## Soak test
1. Timeouts already honest. Enable idle still 0 if that is the heat choice.
2. Query `IDLESCALING` after 30 minutes idle. Still 0 on AC. A 100/80 pair (if written) still reads 100/80.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`.
4. If someone set Enable scaling to “save watts,” restore Disable scaling on AC.
5. No fourth Grok TUI. Isolation-empty `scheduler_list` is skip recreate. Not systemd.

## What this page is not
- Not a Linux FULL AUTO daemon on this Windows profile. Not systemd.
- Not the promote/demote percent write. Not idle disable. Not idle time check. Not idle state maximum.
- Not a High-performance plan essay. One processor setting.
- Not a SKU and not a commission claim.
- Not a brokerage number. Live capital stays off Pages. NLV stays off Pages.
