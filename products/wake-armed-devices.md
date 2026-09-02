# powercfg /devicequery wake_armed vs a forever loop
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/wake-armed-devices.html

Companion inventory to [Wake on Magic Packet](wake-on-magic-packet.html), [powercfg /lastwake](powercfg-lastwake.html), [Allow wake timers](wake-timers-forever.html), and [lid-close Do nothing](lid-close-do-nothing.html). Magic Packet is one Advanced checkbox on the dedicated NIC. lastwake is who yanked the previous sleep. Wake timers are the Windows RTC list and the plan policy. Lid-close is whether the lid is a Sleep key. This pack is the live device list: **`powercfg /devicequery wake_armed`** — who is allowed to yank a docked Interactive Grok desk right now. **`powercfg /devicequery wake_programmable`** is who could be armed. Those two dumps are not lastwake and not `/waketimers`.

## What this is
A closed-lid AC desk can already have honest sleep, lid, USB suspend, and Allow wake timers. The named task still looks Ready. Then a HID bump, leftover radio, dock audio, or OEM management engine yanks S0ix / S3. lastwake is one wake, already spent. `/waketimers` names Windows RTC owners. The live device grant is `wake_armed`.

OEM images often arm more than the dedicated Ethernet. A programmable device that is not armed is honest. An armed device the operator did not intend is the surprise. Empty `wake_armed` (powercfg prints `NONE`) is a pass when this desk wants only the named task / RTC — not proof the last yank was a timer.

Turning the whole USB Ethernet adapter off is the wrong fix. The [dedicated NIC](../reviews/usb-ethernet-operator-host.html) is the ship path. This page lists names. It does not disable that NIC.

Grok in-session schedulers expire in 7 days even when durable. Isolation-empty `scheduler_list` is skip recreate, not missing-forever. Host-forever on this profile is Task Scheduler `LEXXII-Materialize-Forever`. Not a Linux FULL AUTO daemon.

## When this page applies
| Symptom | Layer |
|---|---|
| Need the name of the last yank | [powercfg /lastwake](powercfg-lastwake.html). Come back here after it names a Device. |
| Need the Windows RTC list / plan policy | [Allow wake timers](wake-timers-forever.html) plus `powercfg /waketimers` |
| Lid close put the session to Sleep | [Lid close Do nothing](lid-close-do-nothing.html) |
| Dedicated NIC Advanced Magic Packet / pattern match still On; directed wake not in use | [Wake on Magic Packet](wake-on-magic-packet.html). Inventory here first. |
| USB NIC itself napped | [USB selective suspend](usb-selective-suspend.html) |
| Unattended sleep after a legitimate wake | [UNATTENDSLEEP](unattended-sleep-timeout.html) |
| Need who is allowed to yank **now** | **This page.** `wake_armed` live list. `wake_programmable` candidate list. |
| `wake_armed` prints NONE and the operator wanted no device wake | This page, pass. Confirm lastwake if a yank still happened. |

Do not disable the dedicated NIC. Do not treat `wake_programmable` as a fail. Do not paste live brokerage numbers next to device names. Do not paste `auth.json`.

## Read the two lists (plugged-in Grok desk)
1. Confirm lid-close, Allow wake timers, and lastwake are the wrong object or already honest. If you only need Magic Packet, inventory here first so you know the NIC is even armed.
2. Elevated Command Prompt, while the desk is awake: run the two queries. Save locally. Do not publish the dump. Device instance paths do not belong on Pages.
3. Classify every `wake_armed` line:
   - Dedicated USB Ethernet or dock NIC — expected if the Power Management wake checkbox is on. Leave the adapter Enabled. Magic Packet is the sibling click, not a disable.
   - HID keyboard / mouse — a bump yanks a closed lid. Disarm the HID, not the lid policy.
   - Wi-Fi or Bluetooth leftover — radio wake is not wireless power-saving and not the dedicated NIC.
   - OEM audio, unused hub, management engine — surprise. Try exact-name disarm. Some firmware will not drop — skip, not a registry hack.
4. Read `wake_programmable` as the candidate set. Longer than armed is normal. Do not empty programmable. The pass is armed matching intent.
5. Disarm named surprises only: `powercfg /devicedisablewake` with the exact string from the dump, quoted. Or Device Manager → that device → Power Management → uncheck Allow this device to wake the computer. Leave “Allow the computer to turn off this device to save power” to the USB-suspend pack.
6. Never disable the dedicated NIC as the inventory fix. Do not `/devicedisablewake` the Ethernet string by default. Directed-wake desks keep that NIC armed on purpose.

```
powercfg /devicequery wake_armed
powercfg /devicequery wake_programmable
powercfg /devicedisablewake "exact name from wake_armed"
```

`wake_armed` is the live grant. `wake_programmable` is who could be armed. `/devicedisablewake` takes the exact friendly name powercfg printed. Quotes are required when the name has spaces. `NONE` on armed means the live list is empty, not that lastwake is empty. If disablewake errors, this driver did not expose the grant — stop. Do not invent a wake DWORD in the registry on a public page.

## Soak test
1. Sleep, lid, USB suspend, and Allow wake timers already honest, or this soak is lying about a different layer.
2. Re-run `powercfg /devicequery wake_armed`. Dedicated NIC still Enabled and still has a link. Armed names match intent: NIC only if directed wake is in use; no surprise HID / OEM / leftover radio.
3. Lid closed, named task next-run still in the future. No surprise S0 from a mouse bump or a packet the operator did not send. A bump that still wakes means that HID is still armed — re-query, do not blame lid-close.
4. `wake_programmable` may still list the HID. That is capability. Fail the soak only if it returned to `wake_armed`.
5. Host-forever is `LEXXII-Materialize-Forever`. Grok in-session schedulers expire in 7 days. Isolation-empty skip recreate. Not systemd. Last result 267009 is still-running, not proof the arm list is honest.

## What this page is not
- Not Wake on Magic Packet. That Advanced checkbox is [wake-on-magic-packet](wake-on-magic-packet.html).
- Not lastwake. That history dump is [powercfg-lastwake](powercfg-lastwake.html).
- Not Allow wake timers / `/waketimers`. That RTC list is the timer packs.
- Not lid-close Do nothing. The lid is [lid-close-do-nothing](lid-close-do-nothing.html).
- Not “disable the NIC.” The dedicated Ethernet review still stands.
- Not a Linux FULL AUTO daemon on this Windows profile.
- Not live capital. NLV stays off Pages. Device names stay off the public dump.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
