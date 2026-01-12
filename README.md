# act-with-agentskills

GitHub Actionをローカルで実行し、エージェントスキルとして利用できるようにする検証リポジトリです。

## 概要

このリポジトリは以下を実現します：
- [act](https://github.com/nektos/act)を使用してGitHub Actionをローカル実行
- [GitHub Copilot Agent Skills](https://docs.github.com/ja/copilot/concepts/agents/about-agent-skills)仕様に準拠したスキル定義
- 5つの異なるアプローチによる不具合修正手順の比較

## エージェントスキル

このリポジトリには5つのエージェントスキルがあり、それぞれ異なる方法で不具合を修正します：

### 1. direct-execution（直接実行）
コマンドを直接実行してビルドとテストを行います。

**手順：**
```bash
npm test  # 不具合を特定
# index.jsを修正
npm test  # 修正を確認
```

**特徴：**
- ✅ 最もシンプル
- ✅ 素早い実行
- ❌ 再利用性が低い

### 2. script-execution（スクリプト実行）
コマンドをシェルスクリプトに記述し、それを実行します。

**手順：**
```bash
# test.shを作成
./test.sh  # 不具合を特定
# index.jsを修正
./test.sh  # 修正を確認
```

**特徴：**
- ✅ スクリプトの再利用可能
- ✅ バージョン管理できる
- ❌ スクリプト作成の手間

### 3. script-reference（スクリプト参照）
シェルスクリプトを参考資料として作成し、コマンドは直接実行します。

**手順：**
```bash
# test-reference.shを作成（参照用）
cat test-reference.sh  # 内容確認
npm test  # 直接実行
# index.jsを修正
npm test  # 修正を確認
```

**特徴：**
- ✅ ドキュメントとして機能
- ✅ 柔軟に変更可能
- ✅ 学習に適している

### 4. gha-execution（GHA実行）
GitHub Actionsワークフローをactで実行します。

**手順：**
```bash
act -j build-and-test  # 不具合を特定
# index.jsを修正
act -j build-and-test  # 修正を確認
```

**特徴：**
- ✅ CI環境と同等
- ✅ ワークフローの動作確認
- ❌ actとDockerが必要
- ❌ 実行時間が長い

### 5. gha-reference（GHA参照）
GitHub Actionsワークフローを参照し、コマンドを直接実行します。

**手順：**
```bash
cat .github/workflows/build-test.yml  # ワークフロー確認
npm install && npm test  # 直接実行
# index.jsを修正
npm test  # 修正を確認
```

**特徴：**
- ✅ ワークフローが参考資料に
- ✅ act不要で高速
- ✅ 開発イテレーションに最適

## アプローチの比較

| アプローチ | セットアップ | 実行速度 | 再利用性 | CI整合性 |
|----------|------------|---------|---------|---------|
| direct-execution | ⭐⭐⭐ | ⭐⭐⭐ | ⭐ | ⭐ |
| script-execution | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐ |
| script-reference | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐ |
| gha-execution | ⭐ | ⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| gha-reference | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ |

## セットアップ

### 必要なツール

1. Node.js (v18以上)
2. act ([インストール方法](https://github.com/nektos/act#installation)) - gha-executionスキルに必要

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
│   ├── skills/
│   │   ├── direct-execution/      # スキル1
│   │   ├── script-execution/      # スキル2
│   │   ├── script-reference/      # スキル3
│   │   ├── gha-execution/         # スキル4
│   │   └── gha-reference/         # スキル5
│   └── workflows/
│       └── build-test.yml         # GitHub Actionワークフロー
├── index.js                       # サンプルコード
├── test.js                        # テストコード
└── package.json                   # Node.js設定
```

## ライセンス

MIT