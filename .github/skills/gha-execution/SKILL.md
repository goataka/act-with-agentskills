---
name: gha-execution
description: actを使用してGHA変更を検証
license: MIT
---

# GitHub Actions実行スキル

actを使用してGitHub Actionsワークフローの変更を検証します。

## 前提条件

- actがインストールされていること
- Dockerが起動していること

## コマンド

### ワークフローを実行して検証
```bash
act -j build-and-test
```

### ワークフローを変更
```bash
vim .github/workflows/build-test.yml
```

### 変更を検証
```bash
act -j build-and-test
```

## 備考

- actはGHA変更の事前検証に使用
- ローカルでGHAをテスト可能
- CI/CDパイプラインを壊す前に確認できる
