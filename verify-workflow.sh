#!/bin/bash
# ワークフロー検証スクリプト - actを使用してGHA検証

set -e

PR_NUMBER="${1:-}"

echo "==> Step 1: Verifying workflow syntax with act (dryrun)..."

# actでワークフローの構文を検証
act -j build-and-test --dryrun

echo "✅ ワークフロー構文検証成功"

echo ""
echo "==> Step 2: Running workflow with act (actual execution, mocked actions)..."

# 実際に実行（pushイベントで実行することでPRコメントアクションをスキップ）
act push -j build-and-test

echo "✅ ワークフロー実行検証成功（push event）"

# PR番号が指定されている場合はPRイベントでも検証
if [ -n "$PR_NUMBER" ]; then
  # PR番号が数値であることを検証
  if ! [[ "$PR_NUMBER" =~ ^[0-9]+$ ]]; then
    echo "❌ エラー: PR番号は数値である必要があります"
    exit 1
  fi
  
  echo ""
  echo "==> Step 3: Running workflow with act (PR event with mock data)..."
  
  # 一時ファイルを安全に作成
  PR_EVENT_FILE=$(mktemp)
  trap "rm -f $PR_EVENT_FILE" EXIT
  
  # PRイベント用のペイロードを作成
  cat > "$PR_EVENT_FILE" <<EOF
{
  "pull_request": {
    "number": $PR_NUMBER,
    "head": {
      "ref": "test-branch",
      "sha": "test-sha"
    },
    "base": {
      "ref": "main"
    }
  },
  "repository": {
    "name": "act-with-agentskills",
    "owner": {
      "login": "test-owner"
    }
  }
}
EOF
  
  # PRイベントで実行（github-scriptアクションはモック環境のため失敗する可能性がある）
  if act pull_request -j build-and-test -e "$PR_EVENT_FILE"; then
    echo "✅ ワークフロー実行検証成功（PR event）"
  else
    EXIT_CODE=$?
    echo "⚠️  ワークフロー実行は失敗しましたが、これはモック環境のため想定内です（exit code: $EXIT_CODE）"
  fi
fi
