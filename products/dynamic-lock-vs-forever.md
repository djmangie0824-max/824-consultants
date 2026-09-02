# Dynamic lock vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/dynamic-lock-vs-forever.html

Companion to [console lock display off](console-lock-display-off.html). VIDEOCONLOCK can already be Never and a paired phone still locks the session when it walks away. This pack is the remaining walk-away lock: Settings → Accounts → Sign-in options → **Dynamic lock**. The phone leaves Bluetooth range. Windows locks. Then the lock-screen timer can still drop dual ultrawide. Task Scheduler still shows Ready.

## What this is
`LEXXII-Materialize-Forever` is Interactive-only. VIDEOIDLE, VIDEOCONLOCK, and the Bluetooth radio checkbox can already be honest. The process is still alive. The operator walks to the kitchen with a paired phone. Dynamic lock notices the device is away and locks Windows. A later soak that assumed “unlocked idle” is lying. If VIDEOCONLOCK was never healed, the panels go black about a minute after that lock. `schtasks` still prints Ready and last result 267009 (still-running). The operator thinks console-lock lied. A phone lock fired first.

This is not Bluetooth power saving. Unchecking the radio Power Management checkbox does not disable Dynamic lock. This is not VIDEOCONLOCK. Dynamic lock is the lock *event*. Console lock display off is the timer *after* that event.

Grok in-session schedulers expire in 7 days even when durable. Recreate them if missing. Do not claim the Windows task is a Linux FULL AUTO daemon.

## When this page applies
| Symptom | Layer |
|---|---|
| Session unlocked. Panels black after 5–10 minutes. VIDEOIDLE is not 0 | [turn-off-display-after](turn-off-display-after.html) |
| Win+L. VIDEOIDLE already 0. Panels black in about a minute | [console-lock-display-off](console-lock-display-off.html) |
| Bluetooth HID mouse dies; session stays unlocked | [bluetooth-adapter-power-saving](bluetooth-adapter-power-saving.html) |
| Phone walks out of range. Session locks by itself. Hourly task still Ready. Panels may then follow VIDEOCONLOCK | **This page** |
| No paired phone / Dynamic lock checkbox missing | Skip. This desk does not use Dynamic lock. Not a fail. |

Do not turn Dynamic lock off as the first click on a new host. Do not disable the Bluetooth adapter to hide it.

## What to change (plugged-in Grok desk)
1. Confirm Turn off display after is 0 on AC. Console lock display off is Never on AC if the row exists. See [VIDEOIDLE](turn-off-display-after.html) and [VIDEOCONLOCK](console-lock-display-off.html). If those still black the panels, stop here.
2. Settings → Accounts → Sign-in options → **Dynamic lock**.
3. Uncheck **Allow Windows to automatically lock your device when you're away**. Do not unpair the phone unless you mean to. Do not turn Bluetooth off.
4. If the checkbox is grey because nothing is paired, skip. That is not a fail.
5. Leave Device Manager Bluetooth Power Management as a sibling. That checkbox is HID radio sleep, not Dynamic lock. See [Bluetooth power saving](bluetooth-adapter-power-saving.html).
6. Confirm.

```
# Dynamic lock is a Settings toggle, not a portable powercfg alias.
# Confirm in Settings → Accounts → Sign-in options → Dynamic lock.
```

There is no honest `powercfg` alias for Dynamic lock on this host class. The Settings toggle is the source of truth. Do not invent a registry paste on a public page to force the checkbox. If Settings omits Dynamic lock, this edition did not expose it — skip. Win+L is still a manual lock; that is VIDEOCONLOCK, not this page. Do not paste live brokerage numbers. Do not paste `auth.json`.

## Soak test
1. VIDEOIDLE already 0 on AC. VIDEOCONLOCK already Never on AC if the row exists. Otherwise a walk-away lock is blamed on the wrong timer.
2. Paired phone walks out of Bluetooth range for two minutes. The Windows session stays unlocked. A lock screen is a fail on this page.
3. Task Scheduler still has a next-run for `LEXXII-Materialize-Forever`. Ready + 267009 after a Dynamic lock is not forever.
4. The Settings checkbox still unchecked. If someone re-enabled it to “secure the kitchen walk,” uncheck it on this desk. Travel laptops may differ.
5. No paired phone = skip, not a red soak. Do not invent Dynamic lock in the registry.
6. No fourth Grok TUI. Last result 267009 is still-running, not proof Dynamic lock is already off.

## What this page is not
- Not console-lock display off. That is [console-lock-display-off](console-lock-display-off.html).
- Not VIDEOIDLE. That is [turn-off-display-after](turn-off-display-after.html).
- Not Bluetooth power saving. That is [bluetooth-adapter-power-saving](bluetooth-adapter-power-saving.html).
- Not “turn off Bluetooth” and not airplane mode.
- Not a phone SKU and not a commission claim.
- Not a High-performance plan essay. One Settings checkbox.
- Not a Linux systemd unit. This host is Windows.
- Not live capital. NLV stays off Pages.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
