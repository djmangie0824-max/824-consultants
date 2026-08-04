# DESIGN LAW — PERMANENT
**824 Consultants LLC / Lexxii / Douglas James Mangie II**  
**Status: LOCKED · non-negotiable · applies to every public surface**

## 0. Axiom
Public property is a cash + legitimacy rail. It must look intentional, load fast, disclose honestly, and never leak vault data.

## 1. Tokens (single source of truth)
```
--bg: #070708
--bg-elevated: #0e0e11
--bg-subtle: #16161a
--fg: #f4f4f5
--fg-muted: #a1a1aa
--fg-subtle: #71717a
--border: #27272a
--border-strong: #3f3f46
--signal: #22c55e
--ice: #a5f3fc
--warn: #f59e0b
--danger: #ef4444
--radius: 12px | 16px | 20px
--font: system-ui / Segoe UI stack
--mono: ui-monospace stack
--max-content: 720px (research) | 1120px (ops dashboards)
```
No ad-hoc hex in components. No second palette.

## 2. Layout law
- Mobile-first (~390px) then scale
- Sticky header with backdrop blur
- One primary action per view
- Cards: border + elevated surface, hover strengthens border only
- Touch targets ≥ 40px
- No horizontal overflow

## 3. Typography law
- Headings: tracking tight, weight 600
- Body: 0.95rem, line-height 1.55, muted color
- Mono only for skill IDs, tickers, code
- ≤ 2 font families forever

## 4. Anti-slop (banned forever)
- No gradient blobs as decoration
- No emoji-as-icons
- No lorem / placeholder gray boxes on live pages
- No purple-by-default AI aesthetic
- No fake metrics or invented commission numbers

## 5. Motion law
- 150–250ms ease on hover/border only
- Respect prefers-reduced-motion
- No layout-thrashing animations

## 6. Security surface law (911)
- Public site = research, disclosure, contact, SEO only
- NEVER: API keys, IBKR secrets, vault paths, private agent logs, session tokens
- Associates tags only after approval
- If a page can be crawled, treat it as public forever

## 7. Performance law
- Static HTML first for github.io
- No heavy trackers until intentional analytics
- Prefer CSS over JS for chrome
- Images: real assets only, never empty frames

## 8. State-of-the-art checklist (ship gate)
- [ ] Tokens only — no rogue colors
- [ ] Sticky blur header, clear nav
- [ ] Disclosure present on commercial pages
- [ ] Schema.org Organization on home
- [ ] Mobile clean, no overflow
- [ ] Zero secrets in source
- [ ] Live HTTP 200 before claiming done

## 9. Ownership stamp
ONLY YOU. FOREVER.  
Entity: 824 Consultants LLC  
Principal: Douglas James Mangie II  
Brand: Lexxii / LEX XII

**This file is permanent law. Future UI work obeys it or does not ship.**
