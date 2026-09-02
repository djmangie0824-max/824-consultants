#!/usr/bin/env bash
# Diagnose last Pages deploy + apply recovery steps.
# Usage: ./scripts/recover_failed_deploy.sh
set -euo pipefail
REPO="${REPO:-djmangie0824-max/824-consultants}"
SITE="https://djmangie0824-max.github.io/824-consultants/"

echo "=== Last Deploy GitHub Pages run ==="
RUN_JSON=$(gh run list -R "$REPO" --workflow "Deploy GitHub Pages" --limit 1 --json databaseId,conclusion,status,url,headSha,displayTitle,attempt)
echo "$RUN_JSON" | python3 -m json.tool
CONCLUSION=$(echo "$RUN_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin)[0]['conclusion'] or '')")
RUN_ID=$(echo "$RUN_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin)[0]['databaseId'])")
ATTEMPT=$(echo "$RUN_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin)[0].get('attempt',1))")
URL=$(echo "$RUN_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin)[0]['url'])")

echo ""
echo "=== Live stamp ==="
curl -fsSL "${SITE}DEPLOY_STAMP.json" | python3 -m json.tool || echo "(stamp unreachable)"

if [ "$CONCLUSION" = "success" ]; then
  echo ""
  echo "Latest run succeeded. Nothing to recover."
  echo "Site: $SITE"
  exit 0
fi

echo ""
echo "=== Failure handling steps ==="
echo "1. Open logs: $URL"
echo "2. Identify stage (validate | assemble | upload | deploy | checkout)"
echo "3. Fix content if validate (NEVER gut FULL AUTO strings)"
echo "4. Re-run failed jobs (auto once on upload/deploy/checkout)"
echo "5. Confirm stamp + hub + autonomy"
echo "Playbook: docs/FAILURE_HANDLING.md"

if [ "$CONCLUSION" = "failure" ] || [ "$CONCLUSION" = "cancelled" ] || [ -z "$CONCLUSION" ]; then
  if [ "${1:-}" = "--rerun" ]; then
    if [ "${ATTEMPT:-1}" -ge 3 ]; then
      echo "Attempt $ATTEMPT already high — refusing auto re-run. Fix content first."
      exit 1
    fi
    echo "Requesting: gh run rerun $RUN_ID --failed"
    gh run rerun "$RUN_ID" --failed -R "$REPO"
    echo "Re-run requested. Watch: $URL"
  else
    echo ""
    echo "To re-run failed jobs: $0 --rerun"
  fi
fi
