---
name: script-reference
description: シェルスクリプトを参考資料として作成し、コマンドを直接実行
license: MIT
---

# スクリプト参照スキル

シェルスクリプトをドキュメントとして作成し、コマンドは直接実行します。

## コマンド

### 参照用スクリプトを作成
```bash
cat > test-reference.sh << 'EOF'
#!/bin/bash
# 参照用スクリプト - 手動で実行するコマンド
npm test
EOF
```

### 参照を確認して直接実行
```bash
cat test-reference.sh
npm test
```

### 不具合を修正
`index.js`を編集し、不足している感嘆符を追加します。

### 直接検証
```bash
npm test
```

## 備考

- スクリプトがドキュメントとして機能
- コマンドをその場で柔軟に変更可能
- 学習と理解に役立つ
