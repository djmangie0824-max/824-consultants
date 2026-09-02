#!/usr/bin/env bash
# Auto-publish public surface to GitHub Pages (via push → Actions).
# Usage: ./scripts/auto_publish_pages.sh "commit message"
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
MSG="${1:-Auto-publish public surface $(date -u +%Y-%m-%dT%H:%MZ)}"

fail() {
  echo "ABORT: $1" >&2
  echo "" >&2
  echo "Failure handling steps:" >&2
  echo "  1. Fix the issue above (do NOT gut FULL AUTO strings)" >&2
  echo "  2. Re-run: ./scripts/auto_publish_pages.sh" >&2
  echo "  3. Watch: https://github.com/djmangie0824-max/824-consultants/actions" >&2
  echo "  4. Playbook: docs/FAILURE_HANDLING.md" >&2
  exit 1
}

# Guard: never gut autonomy strings
[ -f autonomy.html ] || fail "autonomy.html missing"
[ -f index.html ] || fail "index.html missing"
grep -q "Fully autonomous public surface" autonomy.html \
  || fail "autonomy.html missing protected FULL AUTO string"
grep -q "Zero human input required" autonomy.html \
  || fail "autonomy.html missing Zero human input string"
grep -q "Touch. Talk. Go." index.html \
  || fail "index.html missing immersive hub title"
for f in sim.html sitemap.xml robots.txt; do
  [ -f "$f" ] || fail "required file missing: $f"
done

git add -A
if git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi

git commit -m "$MSG

© 2026 824 Consultants LLC. ONLY YOU. FOREVER." || fail "git commit failed"

if ! git push origin HEAD; then
  fail "git push failed — check auth/network, then retry (Actions will not run until push succeeds)"
fi

echo "Pushed. GitHub Actions will deploy Pages automatically."
echo "Watch: https://github.com/djmangie0824-max/824-consultants/actions"
echo "On failure: docs/FAILURE_HANDLING.md · Re-run failed jobs · issue #1 log"
