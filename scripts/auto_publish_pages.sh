#!/usr/bin/env bash
# Auto-publish public surface to GitHub Pages (via push → Actions).
# Usage: ./scripts/auto_publish_pages.sh "commit message"
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
MSG="${1:-Auto-publish public surface $(date -u +%Y-%m-%dT%H:%MZ)}"

# Guard: never gut autonomy strings
if ! grep -q "Fully autonomous public surface" autonomy.html; then
  echo "ABORT: autonomy.html missing protected FULL AUTO string" >&2
  exit 1
fi
if ! grep -q "Zero human input required" autonomy.html; then
  echo "ABORT: autonomy.html missing Zero human input string" >&2
  exit 1
fi
if ! grep -q "Touch. Talk. Go." index.html; then
  echo "ABORT: index.html missing immersive hub title" >&2
  exit 1
fi

git add -A
if git diff --cached --quiet; then
  echo "No changes to publish."
  exit 0
fi

git commit -m "$MSG

© 2026 824 Consultants LLC. ONLY YOU. FOREVER."
git push origin HEAD

echo "Pushed. GitHub Actions will deploy Pages automatically."
echo "Watch: https://github.com/djmangie0824-max/824-consultants/actions"
