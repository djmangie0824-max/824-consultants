# Git + Node on a Windows Grok host
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/git-node-windows-host.html

Not a Linux cluster. Not a tenth empire dump. Written after Git 2.55 and Node 24.19 LTS actually landed on a Windows Grok profile that already had a live GitHub Pages face.

## What this pack is
The first-boot Grok host pack is true on day zero: CLI can be the only toolchain. This pack is the next hour — Git and Node are on PATH, and the traps are Windows-real.

Paired with: [Windows Grok CLI Host Pack](windows-grok-host-pack.md).

## Versions that were actually installed (this class of host)
| Tool | Fact |
|---|---|
| Git | `2.55.0.windows.3` at `C:\Program Files\Git\cmd\git.exe` |
| Node | `v24.19.0` via WinGet package `OpenJS.NodeJS.LTS` |
| npm | Present as `npm.cmd`. PowerShell `npm.ps1` is a different file |

Do not write “Node is broken” because `npm` in PowerShell exploded. Probe `node --version` and `npm.cmd --version` separately.

## Trap 1 — Restricted execution policy vs `npm.ps1`
WinGet Node LTS drops `npm.ps1` on PATH. Windows PowerShell default **Restricted** will refuse to run it (`UnauthorizedAccess`). That is not a missing install.

Heal, in order:
1. Call `npm.cmd` (or `node`) instead of the `.ps1` shim.
2. If the operator wants scripts: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`. MachinePolicy is not required.
3. Do not weaken execution policy to Unrestricted to “make npm work.”

## Trap 2 — `git fetch` / `git push` hang
Git Credential Manager will sit forever if it wants an interactive GitHub login. A headless Grok turn that waits on that prompt looks dead.

Heal:
- Prefer the GitHub connector / contents API to ship public files.
- For a clone of a **public** repo, fetch can use anonymous HTTPS. If GCM still prompts, abort with `GIT_TERMINAL_PROMPT=0` rather than hanging.
- Never paste `~/.grok/auth.json` into git config, a remote URL, or a public file.
- Local `git push` hanging is a credential problem, not a reason to mint another Vercel slug.

## What Git is for on this host
- Clone and edit `djmangie0824-max/824-consultants` (public face).
- Keep vault / desk / console / organism out of that tree.
- Validate before ship: home still has `Touch. Talk. Go.` + `canvas#field`; autonomy still has FULL AUTO strings; products is not a deny wall; `robots.txt` still `Allow: /`.

## What Node is for on this host
- Small public-safe build scripts (sitemap stitch, HTML checks).
- Not a Ray cluster. Not K3s. Not an excuse to invent income.

## Forbidden
- Copying Grok `auth.json` or MCP tokens into the public repo.
- Publishing brokerage NLV, cash, tickers, or account IDs.
- Installing Linux systemd on Windows because “Node needs a daemon.”
- Spawning a fourth Grok TUI to run `npm`.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
