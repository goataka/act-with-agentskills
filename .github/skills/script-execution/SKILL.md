---
name: script-execution
description: verify.shを実行してビルドとテストを検証
license: MIT
---

# スクリプト実行スキル

`verify.sh` を実行して検証を行います。

## コマンド

### 検証スクリプトを実行
```bash
./verify.sh
```

このスクリプトは以下を実行します：
- 依存関係のインストール（npm install）
- ビルド（npm run build）
- テスト（npm test）

## 備考

- 人間が実行する標準的な方法
- 全ての検証を一度に実行
- スクリプトはバージョン管理されている
