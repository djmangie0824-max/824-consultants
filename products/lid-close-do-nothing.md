# Lid close Do nothing vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/lid-close-do-nothing.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md) and [USB selective suspend](usb-selective-suspend.html). Those packs diagnose Modern Standby and a sleeping NIC. This pack is the lid *action*: what Windows does when the operator closes the laptop on a plugged-in Grok desk.

## What this is
The operator architecture on this class of Windows Grok host is closed-lid on a cooling stand, docked, Ethernet dedicated, Task Scheduler Interactive-only. Default lid action is Sleep. Closing the lid then pauses user tasks even when a LED still shows. `LEXXII-Materialize-Forever` misses the hour.

Grok in-session schedulers are a different layer: they expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## Lid actions (plugged in)
| Plugged-in lid action | What happens to the forever loop |
|---|---|
| Sleep | User tasks pause. Interactive-only Task Scheduler does not fire. |
| Hibernate | Session written and powered off. Worse than Sleep. |
| Shut down | Hard stop. No loop. |
| Do nothing | Lid is a thermal lid, not a power button. Tasks can still fire if Standby and USB suspend are also healed. |

Do nothing is necessary and not sufficient. Connected standby can still freeze Task Scheduler with the lid already set to Do nothing — remaining layer is sleep-vs-forever. A dead NIC under a closed lid is USB selective suspend.

## What to change (plugged-in Grok desk)
1. Control Panel → Hardware and Sound → Power Options → **Choose what closing the lid does**.
2. *When I close the lid* / *Plugged in* → **Do nothing**. On battery may stay Sleep if this laptop actually travels.
3. Leave the power-button action as Shut down or Sleep. Do nothing on the lid is not a license to make the power button a no-op.
4. Confirm with `powercfg`. AC lid action index `0` is Do nothing, `1` Sleep, `2` Hibernate, `3` Shut down.

```
powercfg /query SCHEME_CURRENT SUB_BUTTONS LIDACTION
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0
powercfg /setactive SCHEME_CURRENT
```

Read the AC index before writing it. If AC already shows `0x00000000`, the lid layer is set — remaining closed-lid death is Standby or USB, not this page. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Plugged in. Close the lid on the cooling stand for ten minutes. The machine must not enter Sleep/Hibernate from the lid.
2. With the lid still closed, query `LEXXII-Materialize-Forever`. Next-run must still be in the future.
3. Open the lid. No “resuming” splash. If Windows is waking from Sleep, the AC lid action is not Do nothing.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not a cooling-stand SKU. Hardware air under the lid is [laptop-cooling-stand-14h](../reviews/laptop-cooling-stand-14h.html).
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
