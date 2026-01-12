# act-with-agentskills

エージェント向けの指定方法を検証するリポジトリです。

## 概要

このリポジトリは、GitHub Copilotエージェントに対する指示方法を検証します：
- シェルスクリプトによる検証コマンドの統合
- GitHub Actions（GHA）でのスクリプト利用
- エージェントスキルによる実行方法の指定
- [act](https://github.com/nektos/act)によるGHA変更の検証

## 検証の結論

### コマンド実行の役割分担

| 実行者 | 実行方法 | 目的 |
|--------|---------|------|
| **人間** | `./verify.sh` を実行 | ローカルでの素早い検証 |
| **エージェント** | `verify.sh` を参照して実行 | スクリプトの内容を理解して適切に実行 |
| **GHA** | `verify.sh` + 固有アクション | CI/CD環境での自動検証 |
| **act** | `act -j build-and-test` | GHA変更の事前検証 |

### 検証スクリプト

`verify.sh` に全ての検証コマンドを統合：

```bash
#!/bin/bash
# 依存関係のインストール
npm install

# ビルド
npm run build

# テスト
npm test
```

### GitHub Actions

GHAは `verify.sh` を実行し、さらにGHA固有のアクション（Node.jsセットアップ、PR通知など）を追加：

```yaml
steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-node@v4          # GHA固有: Node.jsセットアップ
  - run: bash verify.sh                   # 共通検証スクリプト
  - uses: actions/github-script@v7       # GHA固有: PRへ結果通知
```

GHA固有のアクション例：
- **Node.jsセットアップ**: CI環境で必要な実行環境の準備
- **PRコメント通知**: 検証結果をPRに自動コメント
- **チェックアウト**: リポジトリのコードを取得

### エージェント

エージェントは `verify.sh` の内容を参照し、状況に応じて適切なコマンドを実行します。
5つのエージェントスキルで異なるアプローチを実装：

1. **direct-execution** - コマンドを直接実行
2. **script-execution** - シェルスクリプトを作成して実行
3. **script-reference** - シェルスクリプトを参照として利用
4. **gha-execution** - actでワークフローを実行
5. **gha-reference** - ワークフローを参照として利用

### actの役割

actはGHAの変更を事前に検証します：

```bash
# verify-workflow.shでワークフローを検証
./verify-workflow.sh
```

**自動検証：**
`build-test.yml` が変更されると、`.github/workflows/verify-workflow.yml` が `verify-workflow.sh` を実行してactで検証します。

## 使い方

### 人間による検証

```bash
# ビルドとテストの検証
./verify.sh

# ワークフローの検証
./verify-workflow.sh
```

### エージェントによる検証

エージェントスキルを参照してください：
- `.github/skills/direct-execution/SKILL.md`
- `.github/skills/script-execution/SKILL.md`
- `.github/skills/script-reference/SKILL.md`
- `.github/skills/gha-execution/SKILL.md`
- `.github/skills/gha-reference/SKILL.md`

### GHA変更の検証

```bash
# actでローカル実行
act -j build-and-test

# 変更を加える
vim .github/workflows/build-test.yml

# 再度検証
act -j build-and-test
```

## セットアップ

### 必要なツール

1. Node.js (v18以上)
2. act ([インストール方法](https://github.com/nektos/act#installation)) - GHA検証用

### actのインストール

```bash
# macOS
brew install act

# Linux
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

## ファイル構造

```
.
├── .github/
│   ├── skills/              # エージェントスキル
│   │   ├── direct-execution/
│   │   ├── script-execution/
│   │   ├── script-reference/
│   │   ├── gha-execution/
│   │   └── gha-reference/
│   └── workflows/
│       ├── build-test.yml       # GHA定義（verify.shを利用）
│       └── verify-workflow.yml  # build-test.yml変更時のact検証（verify-workflow.shを利用）
├── verify.sh                # 検証スクリプト（ビルドとテスト）
├── verify-workflow.sh       # ワークフロー検証スクリプト（act使用）
├── index.js                 # サンプルコード
├── test.js                  # テストコード
└── package.json             # Node.js設定
```

## ライセンス

MIT