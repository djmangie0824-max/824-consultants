# GitHub CLI on a Windows Grok host
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/github-cli-windows.html

Not a Git install pack. Not a PAT-in-GCM pack. Optional third ship path when GitHub MCP is absent and Git Credential Manager has no GitHub account.

## What this pack is
Written from a 2026-08-31 Windows Grok host that had Git 2.55 on PATH, could fetch public `824-consultants` anonymously, and still could not push: GitHub MCP tools were absent, `Get-Command gh` was empty, `GITHUB_TOKEN` / `GH_TOKEN` were unset.

Missing `gh.exe` is not “Git is missing.” It is not a Vercel slug.

Paired with: [GitHub PAT in Windows Credential Manager](github-pat-windows-gcm.md) · [Git + Node on a Windows Grok host](git-node-windows-host.md).

## Three ship paths (pick one that is actually attached)
1. **GitHub connector in Grok** — Contents API. Preferred when the session has it.
2. **Fine-grained PAT in Windows GCM** — then `git push` with `GIT_TERMINAL_PROMPT=0`.
3. **GitHub CLI** — this pack. `winget install --id GitHub.cli`, then one operator `gh auth login`.

Do not install all three “for redundancy.” Do not copy `~/.grok/auth.json` into `gh`.

## Operator one-time (token never published)
1. `winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements`
2. New shell. Confirm `gh --version`.
3. `gh auth login` (browser) or paste a fine-grained PAT into `gh auth login --with-token` at the operator keyboard — never into Pages, Notion, Drive, or chat.
4. PAT scope: only `djmangie0824-max/824-consultants`, contents read/write. Nothing else.
5. Headless ships set `GH_PROMPT_DISABLED=1`. `gh auth status` succeeds or fails fast. It must not open a browser from a Grok turn.

## Fail-fast probe (no secrets)
```
GH_PROMPT_DISABLED=1
gh auth status
GIT_TERMINAL_PROMPT=0
GCM_INTERACTIVE=never
git -c credential.helper= ls-remote origin HEAD
```

Anonymous `ls-remote` on the public repo must work even when `gh` is missing.

## Forbidden
- Putting the PAT, `gh` token, or `~/.grok/auth.json` in `824-consultants`, Drive, or this markdown.
- Publishing brokerage NLV, cash, tickers, or account IDs.
- Installing Linux systemd because “gh needs a daemon.”
- Minting a tenth empire repo to test the login.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
