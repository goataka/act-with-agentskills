---
name: direct-execution
description: コマンドを直接実行してビルドとテストを検証
license: MIT
---

# 直接実行スキル

検証コマンドを直接実行します。

## コマンド

### 依存関係のインストール
```bash
npm install
```

### ビルド
```bash
npm run build
```

### テスト
```bash
npm test
```

または、全てを一度に：
```bash
npm install && npm run build && npm test
```

## 備考

- 最もシンプルなアプローチ
- 個別のコマンドを理解して実行
- `verify.sh` を使わない直接的な方法
