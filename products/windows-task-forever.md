# Windows Task Scheduler forever loop playbook
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/windows-task-forever.html

Not a Linux daemon. Not a K3s/Cilium/Ray cluster. Written from a real Windows Grok host that already has a GitHub Pages public face.

## What this is
Grok in-session schedulers can be durable across chats and still **auto-expire after 7 days**. Host-forever on this class of machine is Windows Task Scheduler, task name `LEXXII-Materialize-Forever`, firing a local prompt file. Agents recreate the Grok hourly scheduler if it is missing. They do not install systemd on Windows. They do not spawn a fourth Grok TUI to fake uptime.

## Honest split
| Loop | What it actually is | Cap |
|---|---|---|
| Grok durable scheduler | In-product hourly prompt | Expires in 7 days even when durable |
| Windows task `LEXXII-Materialize-Forever` | Host loop: `grok.exe --prompt-file` against the local materialize-forever prompt | Lives on the Windows profile |
| GitHub Actions Pages deploy | Push to `main` → live github.io | Independent of either loop |
| Linux organism / K3s / Ray | Other machine, other repo | **Not this Windows host** |

## What the Windows task should look like
- **Name:** `LEXXII-Materialize-Forever`
- **Trigger:** hourly, every day (daily start + 60-minute repeat for 24 hours, or equivalent)
- **Action:** run the local `materialize-forever.cmd` that calls Grok CLI `--prompt-file` on `MATERIALIZE-FOREVER.md`
- **Batteries:** allow start on battery. A laptop that only runs plugged in is not host-forever.
- **Overlap:** ignore a new instance if one is already running. Do not stack TUIs.
- **Secrets:** the task must not copy `auth.json`, MCP tokens, or brokerage account IDs into a public file.

Query (operator, local):

```
schtasks /Query /TN "LEXXII-Materialize-Forever" /FO LIST /V
```

Healthy signs: task exists, **Enabled**, schedule is hourly or daily-with-60-minute-repeat, last result is not a permanent "never run" stall after the first hour, and the action still points at the command-OS script.

## Recreate if missing (operator, local)
Do not paste this into Pages as a live credential. It is a public-safe pattern:

```
schtasks /Create /F /TN "LEXXII-Materialize-Forever" /TR "C:\path\to\command\materialize-forever.cmd" /SC DAILY /ST 00:15 /RI 60 /DU 24:00
```

Then allow batteries and start-when-available in Task Scheduler settings (or the matching PowerShell `ScheduledTaskSettingsSet`). Path stays on the host. Never commit `auth.json`.

If the Grok in-product hourly scheduler is missing, recreate it **durable hourly** with the same materialize-forever prompt. Honest label: it will need another recreate after 7 days.

## What the loop is allowed to do
- Probe live GitHub Pages. Restore immersive hub (`Touch. Talk. Go.` + `canvas#field`) if gutted.
- Restore autonomy FULL AUTO strings if the page became a deny wall.
- Restore the products catalog if it became a deny wall.
- Keep `robots.txt` `Allow: /` and a sitemap of public URLs.
- Keep `/vault` as an owner deny wall.
- Ship a new original public-safe artifact when the face is already healthy.
- Stamp a local heal log. Do not write live brokerage numbers onto Pages.

## What the loop is forbidden to do
- Trade. Monitor-only on micro capital.
- Publish NLV, cash, tickers, quantities, or account IDs.
- Enable training, telemetry, or trace upload.
- Mint extra Vercel slugs or duplicate Drive "Digital Products 3000" folders.
- Touch the other-terminal console repo.
- Ask the operator to run localhost checks.
- Wait for chat to say keep going, continue, or ".".

## Incident this pack was written from
A Windows task with the right name existed as **daily 07:15 with no repeat** and last-run `1999-11-30` (never fired). That is not host-forever. The heal is hourly repeat + batteries allowed + Grok 7-day expiry disclosed in public, not a fake "FULL AUTO Linux daemon" claim on a Windows profile.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
