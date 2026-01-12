---
name: gha-reference
description: GitHub Actionsワークフローを参照し、コマンドを直接実行
license: MIT
---

# GitHub Actions参照スキル

GitHub Actionsワークフローを参照し、コマンドを直接実行します。

## コマンド

### ワークフローステップを確認
```bash
cat .github/workflows/build-test.yml
```

### ワークフローから手動でコマンドを実行
```bash
npm install
npm run build
npm test
```

### 不具合を特定して修正
`index.js`を編集し、不足している感嘆符を追加します。

### 直接検証
```bash
npm test
```

## 備考

- ワークフローが参考ドキュメントとして機能
- act/Docker不要
- 高速なローカル実行
- 開発イテレーションに適している
