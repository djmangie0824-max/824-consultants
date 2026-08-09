# Failure handling — GitHub Pages deploy

**Owner:** Douglas James Mangie II / 824 Consultants LLC  
**Workflow:** `.github/workflows/pages.yml`  
**Scripts:** `scripts/auto_publish_pages.sh` · `scripts/recover_failed_deploy.sh`  
**Stamp:** © 2026 824 Consultants LLC. ONLY YOU. FOREVER.

## Automatic behavior

| Event | What happens |
|-------|----------------|
| **validate fails** | Fail fast · summary + commit comment + issue with recovery steps · **no** auto re-run (content must be fixed) |
| **upload / deploy / checkout fails** | Notifications fire · **one automatic `gh run rerun --failed`** on attempt 1 |
| **attempt ≥ 2 still fails** | Notifications only · manual recovery required |
| **success** | Commit comment · issue log · optional webhook · live `DEPLOY_STAMP.json` |

## Stages → first action

| Stage | Meaning | First action |
|-------|---------|--------------|
| `validate` | Missing files or FULL AUTO / immersive strings gutted | Restore strings + files, then push |
| `assemble` | Site tree assembly failed | Check repo contents on `main` |
| `upload` | Artifact upload failed | **Re-run failed jobs** (often transient) |
| `deploy` | Pages deploy API failed | Pages settings + re-run |
| `checkout` | Clone failed | Re-run |

## Failure handling steps (operator order)

1. **Open the failed run**  
   https://github.com/djmangie0824-max/824-consultants/actions  
   Click the red **Deploy GitHub Pages** run → failed job logs.

2. **Read the stage** from the failure summary / commit comment (`validate`, `upload`, `deploy`, …).

3. **Fix by stage**
   - **validate:** restore in `autonomy.html`:
     - `Fully autonomous public surface`
     - `Zero human input required…`  
     Restore on `index.html`: `Touch. Talk. Go.`  
     Ensure files: `index.html`, `autonomy.html`, `sim.html`, `sitemap.xml`, `robots.txt`
   - **assemble:** ensure tree is not empty; fix broken paths
   - **upload / deploy / checkout:** no code change first — re-run

4. **Re-run**
   - UI: **Re-run failed jobs**
   - CLI: `./scripts/recover_failed_deploy.sh --rerun`
   - Or: Actions → **Deploy GitHub Pages** → **Run workflow**
   - Or: `git commit --allow-empty -m "chore: redeploy pages" && git push`

5. **Confirm recovery**
   - https://djmangie0824-max.github.io/824-consultants/DEPLOY_STAMP.json shows new SHA
   - Hub title **Touch. Talk. Go.**
   - Autonomy FULL AUTO strings intact
   - Issue [#1](https://github.com/djmangie0824-max/824-consultants/issues/1) shows ✅ row

6. **Do not**
   - Gut FULL AUTO language to “make validate pass”
   - Disable the workflow to hide failures
   - Publish private vault / keys / IBKR secrets

## Local pre-flight (before push)

```bash
./scripts/auto_publish_pages.sh "your message"
# On local guard failure, the script prints failure handling steps and exits non-zero
```

## Diagnose last run

```bash
./scripts/recover_failed_deploy.sh          # diagnose
./scripts/recover_failed_deploy.sh --rerun  # re-run failed jobs
```

## Notifications on failure

- Actions job summary (recovery steps embedded by stage)
- Commit comment with numbered steps
- Issue deploy log comment
- Optional `DEPLOY_NOTIFY_WEBHOOK` JSON (`status: failure`, `stage`, `recovery`)

## Hard rules

- Never weaken FULL AUTO / never_weaken flywheel language  
- Never strip failure handling from the workflow  
- Failure handling is permanent ops law for this public surface  
