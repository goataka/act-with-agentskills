---
name: script-execution
description: シェルスクリプトを作成して実行し、不具合を修正
license: MIT
---

# スクリプト実行スキル

コマンドをシェルスクリプトに記述し、それを実行して不具合を修正します。

## コマンド

### テストスクリプトを作成
```bash
cat > test.sh << 'EOF'
#!/bin/bash
npm test
EOF
chmod +x test.sh
```

### スクリプトを実行して不具合を特定
```bash
./test.sh
```

### 不具合を修正
`index.js`を編集し、不足している感嘆符を追加します。

### スクリプトで検証
```bash
./test.sh
```

## 備考

- 繰り返しテストに使えるスクリプト
- バージョン管理可能
- 複雑なコマンドシーケンスに適している
