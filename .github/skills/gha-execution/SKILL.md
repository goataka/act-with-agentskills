---
name: gha-execution
description: actを使用してGitHub Actionsワークフローで不具合を修正
license: MIT
---

# GitHub Actions実行スキル

actを使用してGitHub Actionsワークフローを実行し、不具合を特定して検証します。

## 前提条件

- actがインストールされていること
- Dockerが起動していること

## コマンド

### actでワークフローを実行
```bash
act -j build-and-test
```

### ワークフロー出力から不具合を特定
テストステップが失敗し、不具合が表示されます。

### 不具合を修正
`index.js`を編集し、不足している感嘆符を追加します。

### actで検証
```bash
act -j build-and-test
```

## 備考

- CI環境と同様の環境でテスト
- ワークフローの正確性を保証
- actとDockerのセットアップが必要
