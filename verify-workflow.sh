#!/bin/bash
# ワークフロー検証スクリプト - actを使用してGHA検証

set -e

echo "==> Step 1: Verifying workflow syntax with act (dryrun)..."

# actでワークフローの構文を検証
act -j build-and-test --dryrun

echo "✅ ワークフロー構文検証成功"

echo ""
echo "==> Step 2: Running workflow with act (actual execution, mocked actions)..."

# 実際に実行（PRコメントアクションをスキップ）
# --env でモック環境変数を設定
act -j build-and-test \
  --env GITHUB_EVENT_NAME=push \
  pull_request

echo "✅ ワークフロー実行検証成功"
