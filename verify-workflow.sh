#!/bin/bash
# ワークフロー検証スクリプト - actを使用してGHA検証

set -e

echo "==> Verifying workflow with act..."

# actでワークフローの構文を検証
act -j build-and-test --dryrun

echo "✅ ワークフロー構文検証成功"
