---
name: gha-reference
description: GHAワークフローを参照してverify.shの使用方法を理解
license: MIT
---

# GitHub Actions参照スキル

GHAワークフローを参照し、`verify.sh` の使用方法を理解します。

## コマンド

### ワークフローを確認
```bash
cat .github/workflows/build-test.yml
```

ワークフローは以下を実行しています：
1. Node.jsのセットアップ（GHA固有アクション）
2. `verify.sh` の実行（共通検証スクリプト）

### ローカルで同じ検証を実行
```bash
# GHA固有アクションは不要（Node.jsは既にインストール済み）
./verify.sh
```

## 備考

- GHAの構成を理解するための参照
- ローカルでは `verify.sh` を直接実行
- GHA固有アクション（actions/checkout, actions/setup-nodeなど）はローカルでは不要
