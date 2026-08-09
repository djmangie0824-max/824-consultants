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

## Watch runs

https://github.com/djmangie0824-max/824-consultants/actions

## Local agent command

```bash
./scripts/auto_publish_pages.sh "your publish message"
```

© 2026 824 Consultants LLC. ONLY YOU. FOREVER.
