# Failure handling — GitHub Pages deploy

**Owner:** Douglas James Mangie II / 824 Consultants LLC  
**Workflow:** `.github/workflows/pages.yml`  
**Stamp:** © 2026 824 Consultants LLC. ONLY YOU. FOREVER.

## Automatic behavior

| Event | What happens |
|-------|----------------|
| **validate fails** | Job fails fast · summary + commit comment + issue with recovery steps · **no** auto re-run (content must be fixed) |
| **upload / deploy / checkout fails** | Notifications fire · **one automatic `gh run rerun --failed`** on attempt 1 |
| **attempt ≥ 2 still fails** | Notifications only · manual recovery required |
| **success** | Commit comment · issue log · optional webhook · live `DEPLOY_STAMP.json` |

## Stages

| Stage | Meaning | First action |
|-------|---------|--------------|
| `validate` | Missing files or FULL AUTO / immersive strings gutted | Restore strings + files, then push |
| `assemble` | Site tree assembly failed | Check repo contents |
| `upload` | Artifact upload failed | **Re-run failed jobs** |
| `deploy` | Pages deploy API failed | Check Pages settings · re-run |
| `checkout` | Clone failed | Re-run |

## Manual recovery order

1. Open the failed run → failed job logs  
2. Apply stage fix (table above)  
3. **Re-run failed jobs** (or Actions → Deploy GitHub Pages → Run workflow)  
4. Confirm https://djmangie0824-max.github.io/824-consultants/DEPLOY_STAMP.json  
5. Confirm hub still shows **Touch. Talk. Go.** and autonomy FULL AUTO strings  

## Hard rules

- Never gut FULL AUTO language to make validate pass  
- Never disable the workflow to hide failures  
- Never publish private vault / keys / IBKR secrets  

## Notifications on failure

- Actions job summary (recovery steps embedded)  
- Commit comment with numbered steps  
- Issue [#1 deploy log](https://github.com/djmangie0824-max/824-consultants/issues/1) comment  
- Optional `DEPLOY_NOTIFY_WEBHOOK` JSON (`status: failure`, `stage`, `recovery`)  
