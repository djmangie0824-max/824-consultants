# Catalog lag vs a live landing
**824 Consultants LLC / Lexxii · Douglas James Mangie II**  
Version 2026-09-01 · Public-safe · **Free**  
Landing: https://djmangie0824-max.github.io/824-consultants/products/catalog-lag-vs-landing.html

Companion to [Pages 404 vs the public catalog](pages-404-vs-catalog.html). That pack is a catalog card whose github.io URL renders the custom deny wall because the file is not on `origin/main`. This pack is the inverse: the landing is already HTTP 200. Raw GitHub has the blob. `products/index.html` and/or `sitemap.xml` still omit it. Crawlers never see the card. That is Incomplete Delivery, not vault protection. **Vault is `/vault`.**

## What this is
Ship lanes on this Windows Grok host often land HTML+markdown only so they do not race the catalog. That race rule is real. It is not permission to leave a live playbook invisible. GitHub Pages will serve the URL to anyone who types it. Googlebot and a human on the hub will not. `robots.txt` still says `Allow: /`. Law 237 does not gut a public host playbook that is already on `main`.

## When this page applies
| What you fetched | Layer |
|---|---|
| Home missing Touch. Talk. Go. or `canvas#field`, or PLACEHOLDER | [Pages Heal Playbook](pages-heal-playbook.html). Wrong page. |
| Catalog URL itself is the deny wall | Gut. Restore the hub. |
| Card in the hub. github.io deny wall. Raw GitHub 404 | [404 vs catalog](pages-404-vs-catalog.html). File not on origin. |
| Landing HTTP 200. File on origin/main. Hub href missing and/or sitemap loc missing | **This page**. Wire the card and the loc. |
| `/vault` deny wall | Correct. Leave it. |
| Local laptop has the HTML, origin does not | Incomplete ship, not catalog lag. Land the blob first. |

## What to change
1. Heal first. Live home still immersive. Autonomy FULL AUTO strings intact. Robots Allow. Vault deny.
2. List origin product HTML on `main`. Diff against live sitemap locs and catalog hrefs.
3. Wire from the origin hub blob, not a dirty local clone that is behind `origin/main`.
4. Insert the missing catalog card before the Flywheel inventory block. Add the sitemap loc. Leave paid-pack honesty (Gumroad pending, no invented checkout URLs).
5. Do not restamp an already-live landing body. This click is hub + sitemap.
6. Confirm after Pages deploy: hub card href 200, sitemap lists the loc. CDN may lag one deploy.

```
curl -sI https://djmangie0824-max.github.io/824-consultants/products/NAME.html
curl -s https://djmangie0824-max.github.io/824-consultants/sitemap.xml | findstr NAME
curl -s https://djmangie0824-max.github.io/824-consultants/products/ | findstr NAME.html
```

HTTP 200 on the landing plus empty findstr on sitemap or hub is the fail. Do not paste `auth.json`. Do not paste a PAT. Do not paste live brokerage numbers.

## Soak test
1. Home still Touch. Talk. Go. + `canvas#field`. Autonomy FULL AUTO strings intact. Vault deny. Robots Allow.
2. A previously unwired origin landing now has a hub card and a sitemap loc.
3. The landing body is still the playbook, not PLACEHOLDER, not a deny wall.
4. No capital figures on the hub. No extra Vercel slug. No tenth Drive dump.
5. Host-forever is Windows task `LEXXII-Materialize-Forever`. Not systemd.

## Forbidden
- Gutting the catalog to “protect” private rails.
- Disallow-all robots or emptying the sitemap.
- Inventing Gumroad URLs or commissions while wiring.
- Publishing NLV, cash, tickers, quantities, or account IDs.
- Claiming a Linux FULL AUTO daemon on this Windows profile.

## Ownership
ONLY YOU. FOREVER.
