# GitHub PAT in Windows Credential Manager
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-08-31 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/github-pat-windows-gcm.html

Not a Git install pack. Not a GitHub MCP reconnect click. Written from headless Grok turns that could clone `824-consultants` anonymously and still could not `git push` because Git Credential Manager had no GitHub account.

## What this pack is
The Git + Node pack names the hang. This pack is the one-time store that ends it.

A public GitHub Pages face that only updates when a GitHub connector is attached to the chat is not host-forever. Windows Git 2.55 is already on PATH. The missing piece is a **classic or fine-grained personal access token stored in Windows Git Credential Manager**, never in a public file.

Paired with: [Git + Node on a Windows Grok host](git-node-windows-host.md). Companion, not a merge: [Pages 404 vs the public catalog](pages-404-vs-catalog.md) (a 404 deny wall is not this bug).

## The failure this pack was written from
- `git fetch` with `credential.helper=` (anonymous HTTPS) works on the public repo.
- `git push` without stored credentials prints `could not read Username` under `GIT_TERMINAL_PROMPT=0`, or hangs forever if GCM is allowed to prompt.
- GitHub MCP tools can be **absent** in a Grok session even when doctrine says “push via GitHub MCP.”
- `gh.exe` is not required. `GH_TOKEN` is not required in the user environment. Neither absence is “Git is not installed.”

Do not mint a Vercel slug, a Drive dump, or a tenth empire folder because push failed.

## Operator one-time path (token never published)

1. On github.com, signed in as `djmangie0824-max`, create a **fine-grained PAT**.
2. Resource: only `djmangie0824-max/824-consultants`. Contents: Read and write. Metadata: Read. Nothing else.
3. Do **not** grant private repos, org admin, workflow, or delete. Do **not** paste the token into Pages, a remote URL, Notion, Drive, or chat.
4. Store it in Git Credential Manager as HTTPS credentials for `github.com` (username `djmangie0824-max`, password = the PAT). GCM UI or `git credential approve` is enough. `cmdkey` is optional.
5. After the store, headless ships use `GIT_TERMINAL_PROMPT=0` and `GCM_INTERACTIVE=never`. Push should succeed or fail fast. It must not hang.
6. Alternative, still operator-one-time: reconnect the GitHub connector in Grok so Contents API ships work when local GCM is empty. That is not a substitute for storing the PAT on this host.

## Fail-fast probe (no secrets)

```
GIT_TERMINAL_PROMPT=0
GCM_INTERACTIVE=never
git -c credential.helper= ls-remote origin HEAD
```

Anonymous `ls-remote` on a public repo must work. If **push** then asks for a username, GCM is empty. That is this pack, not a missing `git.exe`.

## Forbidden
- Putting the PAT, `~/.grok/auth.json`, or any MCP token in `824-consultants`, Drive, or this markdown.
- Publishing brokerage NLV, cash, tickers, or account IDs.
- Broad classic tokens with `repo` + `delete_repo` “so it just works.”
- Installing Linux systemd because “git needs a daemon.”
- Waiting on chat to type keep going after the store exists.

## Ownership
ONLY YOU. FOREVER.  
824consultants.llc@gmail.com · @DJMangie0824  
https://djmangie0824-max.github.io/824-consultants/
