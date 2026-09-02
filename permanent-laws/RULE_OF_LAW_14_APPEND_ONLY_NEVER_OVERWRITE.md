# RULE OF LAW #14 — APPEND ONLY · NEVER OVERWRITE
**Owner:** Douglas James Mangie II / 824 Consultants LLC  
**Locked:** 2026-09-01  
**DNA:** `LEXXII-BH-ONLYME-FOREVER`  
**Binds:** ROL-1 flywheel · ROL-2 NEVER WEAKEN · ROL-4 Complete Delivery · ROL-6 materialize first

## The violation
Replacing a living file with a shorter or reconstructed copy is **sabotage**. Incidents: PLACEHOLDER `index.html`, Law 237 catalog/robots gut, hub races that drop cards, sitemap emptied, SHA-bump of a stub over an immersive hub.

**NEVER EVER OVERWRITE. APPEND ONLY.**

## Protected surfaces (never replace with a subset)
| Surface | Rule |
|---|---|
| `index.html` | Never PLACEHOLDER. Never essay-chrome-only. Keep `Touch. Talk. Go.` + `canvas#field` |
| `products/index.html` | GET origin. Insert cards. Result **must have ≥ origin card count**. Dropping a card is a violation |
| `sitemap.xml` | Insert `<url>` rows. Never ship a sitemap with fewer locs than origin |
| `materialize.html` / `flywheel.html` / `layers.html` | Insert. Never delete live cards |
| `autonomy.html` | NEVER WEAKEN protected strings |
| `robots.txt` | Never Disallow-all |
| `HEAL.log` / memory / laws | Append. Never truncate |
| `lexxii-empire-console` | Do not touch |

## How to ship (Git still replaces blobs)
Git `push_files` rewrites the blob. That is allowed **only** when the new blob is a **superset** of origin:

1. `get_file_contents` origin **first**.
2. Insert the new card / loc / paragraph.
3. Count cards/locs. If new count **<** origin count: **ABORT**. Do not push.
4. Prefer a **new path** (`products/ip-stack.html`, `permanent-laws/RULE_OF_LAW_N.md`) over editing a hub.
5. Parallel children must not push the same hub file. One hub-writer. Others ship **new files only**.

## Abort beats overwrite
If origin cannot be read, or two writers race: **skip the hub**. Ship the original as its own URL. Stamp HEAL.log `append-only abort skip hub overwrite`.

## Restore is not overwrite
Restoring a gutted hub from a known-good full immersive blob is **heal**, not overwrite — only when live is PLACEHOLDER, deny-wall, or missing `canvas#field`.

© 2026 824 Consultants LLC. ONLY YOU. FOREVER.
