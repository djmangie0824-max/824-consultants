# Reserve battery level vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/reserve-battery-level.html

Companion to [Low battery action](low-battery-action.html) and [Critical battery action](critical-battery-action.html). Those packs are Battery-subgroup *verbs* (Sleep / Hibernate / Shut down). This pack is the leftover *percent*: **Reserve battery level**. `BATRESERVELEVEL`. GUID `f3c5027d-cd16-4930-aa6b-90db844a8f00`. Default is often 7%. Operators cargo-cult 0 thinking it disarms Low/Critical. 0 is not “never.” The action is the click. Reserve is not a dump.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid can already be Do nothing. Sleep after can already be Never. Low battery action and Critical battery action can already be Do nothing on a docked desk. The tray still shows a reserve band. Someone sets Reserve battery level to 0 to “turn off battery lies.” That is not a pass. Reserve is the percent Windows holds as a floor for emergency. It does not Sleep the session. Low/Critical verbs dump. This page exists so that cargo-cult does not land on a public playbook.

On a closed-lid docked Grok desk the honest move is: leave Reserve at OEM (often 7). Do not zero it. Do not raise it to 20 as a fake UPS. A lying gauge that jumps to 5% is still [critical-battery-action](critical-battery-action.html) or [low-battery-action](low-battery-action.html). Reserve did not fire.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Host-forever is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| What happened | Layer |
|---|---|
| Tray ~10%, then Sleep | [low-battery-action](low-battery-action.html). `LOWBATACTION`. |
| Tray ~5%, then Hibernate / Sleep / Shut down | [critical-battery-action](critical-battery-action.html). `CRITBATACTION`. |
| Leaf on, CPU capped, session awake | Energy saver overlay. Not reserve. |
| Wall flicker, PD brick died, gauge fine | [ups-windows-operator-host](../reviews/ups-windows-operator-host.html) |
| Reserve still 7. Actions already Do nothing. Toast only | Skip. Reserve is not the dump. Do not zero it. |
| Operator wants to set Reserve to 0 to “disable battery” on a docked desk | **This page.** Leave it. 0 is not never. The verbs are the click. |

Do not set Reserve battery level as the first Battery click. Sleep, lid, S4, Critical, and Low first. Do not copy 0 onto a commute laptop. Do not disable the ACPI battery device.

## What to change (closed-lid docked Grok desk)
1. Confirm Low and Critical actions are already Do nothing on AC and DC for this desk (or skip if those GUIDs are missing). See [low-battery-action](low-battery-action.html) and [critical-battery-action](critical-battery-action.html).
2. Query `powercfg /query SCHEME_CURRENT SUB_BATTERY BATRESERVELEVEL` (GUID `f3c5027d-cd16-4930-aa6b-90db844a8f00`). Read the percent. Typical OEM 7 is a skip, not a fail.
3. **Do not set 0.** 0 is not never. Leave the percent. The dump verbs are the other two pages.
4. Leave Low battery notification and Critical battery notification as toasts. A toast is not a dump.
5. Confirm. Do not paste live brokerage numbers. Do not paste `auth.json`.

```
powercfg /query SCHEME_CURRENT SUB_BATTERY BATRESERVELEVEL
powercfg /query SCHEME_CURRENT SUB_BATTERY f3c5027d-cd16-4930-aa6b-90db844a8f00
```

`BATRESERVELEVEL` is Reserve battery level. Units are percent. Leave OEM. Do not cargo-cult 0. If the GUID is missing, stop. Not a fail. Not a registry hack.

## Soak test
1. Low and Critical already Do nothing. Otherwise this soak is lying about a verb.
2. Reserve still OEM (often 7). Session does not Sleep because of this row.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 with a surprise Sleep is a Low/Critical fail, not a reserve fail.
4. Missing GUID = skip. Do not invent 0 in the registry.
5. No fourth Grok TUI. Grok schedulers expire in 7 days even when durable. Host-forever is that named Windows task. Not systemd.

## What this page is not
- Not Low battery action. That verb is [low-battery-action](low-battery-action.html).
- Not Critical battery action. That verb is [critical-battery-action](critical-battery-action.html).
- Not a UPS SKU. That review is [ups-windows-operator-host](../reviews/ups-windows-operator-host.html).
- Not a Linux systemd unit. Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
