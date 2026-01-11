# act-with-agentskills

GitHub Actionをローカルで実行し、エージェントスキルとして利用できるようにする検証リポジトリです。

## 概要

このリポジトリは以下を実現します：
- [act](https://github.com/nektos/act)を使用してGitHub Actionをローカル実行
- [GitHub Copilot Agent Skills](https://docs.github.com/ja/copilot/concepts/agents/about-agent-skills)仕様に準拠したスキル定義
- Node.jsの最小限のビルドとテストのサンプル

## セットアップ

### 必要なツール

1. Node.js (v18以上)
2. act ([インストール方法](https://github.com/nektos/act#installation))

### actのインストール

```bash
# macOS
brew install act

# Linux
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

## 使い方

### ローカルでGitHub Actionを実行

```bash
# ワークフローをローカル実行
act push

# 特定のジョブを実行
act -j build-and-test
```

### 通常のNode.jsコマンド

```bash
# ビルド
npm run build

# テスト
npm test
```

## ファイル構造

```
.
├── .github/
│   ├── skills/
│   │   └── build-and-test/
│   │       └── SKILL.md         # エージェントスキル定義
│   └── workflows/
│       └── build-test.yml       # GitHub Actionワークフロー
├── index.js                     # サンプルコード
├── test.js                      # テストコード
└── package.json                 # Node.js設定
```

## エージェントスキル

`.github/skills/build-and-test/SKILL.md`にエージェントスキルが定義されています。
[Agent Skills仕様](https://github.com/agentskills/agentskills)に準拠し、YAML frontmatter + Markdownで記述されています。
この設定により、GitHub Copilotエージェントがビルドとテストを実行できます。

## ライセンス

MIT