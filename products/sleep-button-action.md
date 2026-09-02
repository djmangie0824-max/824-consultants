# Sleep button action vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/sleep-button-action.html

Companion to [power button](power-button-action-ac.html). The chassis key can already be Do nothing on AC and one moon key still Sleeps the desk. This pack is the remaining Sleep *key*: **Power buttons and lid → Sleep button action**. That is `SBUTTONACTION`. Balanced AC is often Sleep. Fn+moon, a keyboard crescent, or a dock Sleep pad is Standby. Interactive-only Grok tasks miss fires. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Lid-close, power-button, sleep timeouts, and Fast Startup can already be honest. The process is still alive. Balanced **Sleep button action** on AC is Sleep. A closed-lid Ultra 7 on a cooling stand still has Fn+F-row, an external keyboard Sleep, or a dock pad that Windows maps to the same ACPI Sleep button. The operator meant display-off. The key clicks. Windows Sleeps. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks power-button lied. A different key did the Sleep.

This is not power-button. Power is `PBUTTONACTION`. This is not lid. Lid is `LIDACTION`. This is `SBUTTONACTION`. Start-menu Sleep is a software request, not this row.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Isolation-empty `scheduler_list` is skip recreate. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom | Layer |
|---|---|
| Closing the lid put the session to Sleep | [lid-close-do-nothing](lid-close-do-nothing.html) |
| Idle timeout 5–20 minutes, no key press | [windows-sleep-vs-forever](windows-sleep-vs-forever.html) / [sleep-after-timeout](sleep-after-timeout.html) |
| Chassis or dock *power* key Sleeps the session | [power-button-action-ac](power-button-action-ac.html). `PBUTTONACTION`, not this click. |
| Start-menu Sleep / Shut down restored a kernel | Start-menu Sleep is not `SBUTTONACTION`. Hybrid shutdown is [windows-fast-startup](windows-fast-startup.html). |
| Sleep still writes hiberfil then S3 | [hybrid-sleep-ac](hybrid-sleep-ac.html) |
| Lid already Do nothing. Power button already Do nothing. A Fn+moon, keyboard Sleep, or dock Sleep pad Sleeps the session. Hourly task missed | **This page** |
| No Sleep key, no Fn moon, and the row is already Do nothing | This knob is already honest. Stop. Not a fail. Not a registry paste. |

Do not set Sleep button action to Do nothing as the first click on a new host. Do not Shut down from this row. Do not set Turn off the display here as a clever pass — that panel timer is [VIDEOIDLE](turn-off-display-after.html).

## What to change (plugged-in Grok desk)
1. Confirm lid-close on AC is already Do nothing. If closing the lid still Sleeps, that is [lid-close](lid-close-do-nothing.html), not this page.
2. Confirm sleep timeouts are already honest — plugged-in sleep / hibernate are not 5–20 minutes. See [sleep-vs-forever](windows-sleep-vs-forever.html).
3. Confirm power-button on AC is already Do nothing. If the chassis power key still Sleeps, that is [power-button](power-button-action-ac.html), not this click.
4. Power Options → Change plan settings → Change advanced power settings → **Power buttons and lid** → **Sleep button action**. Same row exists under Control Panel → Choose what the power buttons do → *When I press the sleep button*.
5. Set **Plugged in** to **Do nothing**. On battery may stay Sleep if the laptop actually travels.
6. Leave Power button action and lid action as siblings. This click is `SBUTTONACTION` only.
7. Leave the current plan in place. This is one button knob, not a switch to High performance. Do not rename the plan. Do not claim a fleet GPO.
8. Confirm.

```
powercfg /query SCHEME_CURRENT SUB_BUTTONS
powercfg /a
```

`SUB_BUTTONS` is Power buttons and lid. `SBUTTONACTION` is Sleep button action. Typical values: **0 = Do nothing**, **1 = Sleep**, **2 = Hibernate**, **3 = Shut down**. Some images also list 4 = Turn off the display — that is still not this page’s pass. 0 on AC is the pass for this desk. If the row is missing from the GUI, query with `powercfg` anyway — hidden is not the same as Do nothing. If powercfg also omits the alias, this firmware did not expose the knob — stop; do not invent a registry hack on a public page. Power button action is a sibling, not this click. Lid action is a sibling, not this click. Start-menu Sleep is not this click. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. Lid already Do nothing on AC. Power button already Do nothing on AC. Sleep timeouts already honest. Otherwise this soak is lying about which key fired.
2. Press the Sleep key once (Fn+moon, keyboard crescent, or dock Sleep pad), lid closed, dedicated NIC plugged. The session stays awake. The Grok TUI still accepts input. Sleep or a black panel is a fail.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 after a Sleep-key Sleep is not forever.
4. AC index still 0. If someone set Sleep “so the moon key still works,” restore Do nothing. Use Start-menu Shut down when you mean off — after Fast Startup is honest. Start-menu Sleep is a different path; this soak does not claim to disable it.
5. No fourth Grok TUI. Last result 267009 is still-running, not proof the Sleep key is already Do nothing.

## What this page is not
- Not power-button. That is [power-button-action-ac](power-button-action-ac.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not sleep-vs-forever. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not Sleep after. That is [sleep-after-timeout](sleep-after-timeout.html).
- Not hybrid sleep. That is [hybrid-sleep-ac](hybrid-sleep-ac.html).
- Not Fast Startup. That is [windows-fast-startup](windows-fast-startup.html).
- Not Start-menu Sleep. That is a software request, not `SBUTTONACTION`.
- Not a High-performance plan essay. One button setting.
- Not a Linux systemd unit. This host is Windows.
- Not a SKU and not a commission claim.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
