# Windows Fast Startup vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/windows-fast-startup.html

Companion to [Windows sleep vs a forever loop](windows-sleep-vs-forever.md), [Lid close Do nothing](lid-close-do-nothing.md), and [USB selective suspend](usb-selective-suspend.html). Those packs diagnose Modern Standby, the lid action, and a sleeping NIC. This pack is hybrid shutdown: Start menu **Shut down** with Fast Startup still on.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. Fast Startup (Hiberboot) closes the user session, hibernates the kernel, and on the next power button restores that kernel without a full logon. Task Scheduler shows Ready. Next-run is in the future. No hourly fire happens until someone actually signs in.

Grok in-session schedulers are a different layer: they expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## Shutdown vs hybrid shutdown
| What you clicked | What happens to the forever loop |
|---|---|
| Sleep / Modern Standby | Different layer. Sleep-vs-forever. |
| Lid close | Different layer. Lid-close Do nothing. |
| Restart | Real boot. Interactive-only tasks wait for logon, then fire. |
| Shut down, Fast Startup ON | Hybrid shutdown. User-context tasks stay quiet until a real logon. |
| Shut down, Fast Startup OFF | Actual shutdown. Event log does not lie about hibernate. |
| Hibernate (explicit) | Session written. Worse than Fast Startup for an hourly loop. |

Do not `powercfg /hibernate off` as the first click. That kills Fast Startup **and** Hibernate. A UPS-backed Grok desk may still want Hibernate. Uncheck Fast Startup. Leave the hibernate file unless you measured that you do not need it.

## What to change (this Windows profile)
1. Control Panel → Hardware and Sound → Power Options → **Choose what the power buttons do**.
2. **Change settings that are currently unavailable**.
3. Shutdown settings → uncheck **Turn on fast startup (recommended)**.
4. Leave Hibernate available unless this host has no UPS drain path.
5. Confirm.

```
powercfg /a
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled
```

Registry `0x0` is off. `0x1` is still on. Do not paste live brokerage numbers next to that output. Do not paste `auth.json`.

## Soak test
1. Note `LEXXII-Materialize-Forever` last-run and next-run.
2. Start menu → Shut down. Wait two minutes. Power on. Sign in.
3. Event Viewer → Windows Logs → System. A hybrid-boot / Hiberboot path after that click is a fail on this page.
4. Task Scheduler last-run must not claim an hourly fire during the “off” window.
5. Repeat after the checkbox is off. The next Shut down must be a real shutdown in the log.

## What this page is not
- Not the create-the-task playbook. That is [windows-task-forever](windows-task-forever.html).
- Not Modern Standby diagnosis. That is [windows-sleep-vs-forever](windows-sleep-vs-forever.html).
- Not lid-close. That is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not USB selective suspend. That is [usb-selective-suspend](usb-selective-suspend.html).
- Not a UPS SKU. Hardware brown-out is [ups-windows-operator-host](../reviews/ups-windows-operator-host.html).
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
