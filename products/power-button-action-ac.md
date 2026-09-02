# Power button action vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/power-button-action-ac.html

Companion to [lid close](lid-close-do-nothing.html). The hinge can already be Do nothing on AC and one chassis press still Sleeps the desk. This pack is the remaining hardware key: **Power buttons and lid → Power button action**. That is `PBUTTONACTION`. Balanced AC is often Sleep. A bump is Standby. Interactive-only Grok tasks miss fires. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid-close, sleep timeouts, and Fast Startup can already be honest. The process is still alive. Balanced **Power button action** on AC is Sleep. A closed-lid Ultra 7 on a cooling stand still has a power key on the chassis or a dock button that maps to the same action. The operator leans. The key clicks. Windows Sleeps. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks lid-close lied. A different button did the Sleep.

This is not lid-close. Lid is `LIDACTION`. This is `PBUTTONACTION`.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom | Layer |
|---|---|
| Closing the lid put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Idle timeout 5–20 minutes, no button press | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) |
| Start-menu Shut down restored a kernel | [windows-fast-startup](windows-fast-startup.html) |
| Sleep still writes hiberfil then S3 | [hybrid-sleep-ac](hybrid-sleep-ac.html) |
| Lid already Do nothing. A press of the chassis or dock power key Sleeps the session. Hourly task missed | **This page** |
| Sleep *button* (not power button) Sleeps the session | Sibling. Sleep button action is not this click. Do not invent a registry paste here. |

Do not set Power button action to Do nothing as the first click on a new host. Do not Shut down from this row to “make it obvious.”

## What to change (plugged-in Grok desk)
1. Confirm lid-close on AC is already Do nothing. If closing the lid still Sleeps, that is [lid-close](lid-close-do-nothing.html), not this page.
2. Confirm sleep timeouts are already honest — plugged-in sleep / hibernate are not 5–20 minutes. See [sleep-vs-forever](windows-sleep-vs-forever.html).
3. Power Options → Change plan settings → Change advanced power settings → **Power buttons and lid** → **Power button action**.
4. Set **Plugged in** to **Do nothing**. On battery may stay Sleep if the laptop actually travels.
5. Leave Sleep button action as a sibling. If this chassis has a dedicated Sleep key, that is `SBUTTONACTION`, not this click.
6. Leave the current plan in place. This is one button knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
7. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_BUTTONS
powercfg /a
```

`SUB_BUTTONS` is Power buttons and lid. `PBUTTONACTION` is Power button action. Typical values: **0 = Do nothing**, **1 = Sleep**, **2 = Hibernate**, **3 = Shut down**. 0 on AC is the pass for this desk. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Do nothing. If powercfg also omits the alias, this firmware did not expose the knob — stop; do not invent a registry hack on a public page. Lid action is a sibling, not this click. Sleep button action is a sibling, not this click. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Lid already Do nothing on AC. Sleep timeouts already honest. Otherwise this soak is lying about which button fired.
2. Press the chassis power key once, lid closed, dedicated NIC plugged. The session stays awake. The Grok TUI still accepts input. Sleep or a black panel is a fail.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 after a power-key Sleep is not forever.
4. AC index still 0. If someone set Sleep to “have a real off switch,” restore Do nothing. Use Start-menu Shut down when you mean off — after Fast Startup is honest.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the power key is already Do nothing.

## What this page is not
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not hybrid sleep. That is [hybrid-sleep-ac](hybrid-sleep-ac.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not Sleep button action. That sibling is a different alias.
- Not a High-performance plan essay. One button setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
