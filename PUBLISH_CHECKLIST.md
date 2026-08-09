# Publish checklist — automated GitHub Pages

**Owner:** Douglas James Mangie II / 824 Consultants LLC  
**Automation:** Every push to `main` → GitHub Actions → GitHub Pages  
**Manual:** Actions → Deploy GitHub Pages → Run workflow  

## Flow

1. Edit public HTML / laws / products on `main`
2. `git push` **or** `./scripts/auto_publish_pages.sh "message"`
3. Workflow validates FULL AUTO strings + immersive hub
4. Clean artifact deploys to https://djmangie0824-max.github.io/824-consultants/
5. Proof: `/DEPLOY_STAMP.json` on the live site (SHA + run id)

## Never skip

- [ ] `autonomy.html` still has **Fully autonomous public surface**
- [ ] `autonomy.html` still has **Zero human input required…**
- [ ] `index.html` immersive hub (**Touch. Talk. Go.**)
- [ ] No private vault / keys / IBKR secrets
- [ ] Amazon Associate disclosure present


## Deployment notifications (automatic)

On every deploy:

| Channel | What you get |
|---------|----------------|
| **Actions summary** | Green/red deploy card on the workflow run |
| **Commit comment** | ✅/❌ comment on the deploy commit |
| **Issue log** | Open issue `Deploy notifications · 824 Consultants Pages` (label `deploy-notifications`) — table + comment per deploy |
| **DEPLOY_STAMP.json** | Live site proof file |
| **Optional webhook** | Repo secret `DEPLOY_NOTIFY_WEBHOOK` (Discord/Slack/custom) — POSTs JSON on success/failure |

### Optional: Discord / Slack

1. Create an incoming webhook URL
2. Repo → Settings → Secrets → Actions → `DEPLOY_NOTIFY_WEBHOOK`
3. Next deploy pings it automatically


## Watch runs

https://github.com/djmangie0824-max/824-consultants/actions

## Local agent command

```bash
./scripts/auto_publish_pages.sh "your publish message"
```

© 2026 824 Consultants LLC. ONLY YOU. FOREVER.



## Failure handling steps (summary)

1. Open failed Actions run logs  
2. Read stage (`validate` / `upload` / `deploy` / …)  
3. Fix content **or** re-run (see stage table in `docs/FAILURE_HANDLING.md`)  
4. CLI: `./scripts/recover_failed_deploy.sh` · re-run: `./scripts/recover_failed_deploy.sh --rerun`  
5. Confirm live `DEPLOY_STAMP.json` + FULL AUTO strings  

Public mirror: `/failure-handling.html`  

## Failure handling

Full playbook: [docs/FAILURE_HANDLING.md](docs/FAILURE_HANDLING.md)

- Validate failures → fix content (never gut FULL AUTO) → push  
- Upload/deploy blips → auto re-run once, then manual **Re-run failed jobs**  
- Every failure posts recovery steps on the commit + deploy issue  
