#!/usr/bin/env bash
# 用法: ./push.sh https://github.com/<你的用户名>/<仓库名>.git
set -euo pipefail
REMOTE_URL="${1:-}"
if [ -z "$REMOTE_URL" ]; then
  echo "用法: ./push.sh https://github.com/USER/REPO.git"
  exit 1
fi
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"
git branch -M main
git push -u origin main
