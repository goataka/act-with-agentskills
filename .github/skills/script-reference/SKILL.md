---
name: script-reference
description: verify.shを参照してコマンドを実行
license: MIT
---

# スクリプト参照スキル

`verify.sh` の内容を参照し、必要なコマンドを適切に実行します。

## コマンド

### 検証スクリプトの内容を確認
```bash
cat verify.sh
```

### スクリプトの内容を参照して実行
```bash
npm install
npm run build
npm test
```

または、スクリプトを直接実行：
```bash
./verify.sh
```

## 備考

- `verify.sh` がコマンドのドキュメントとして機能
- エージェントはスクリプトの内容を理解して実行
- 状況に応じてコマンドを選択的に実行可能
