#!/bin/bash
# 検証スクリプト - ビルドとテスト

set -e

echo "==> Installing dependencies..."
npm install

echo "==> Building..."
npm run build

echo "==> Running tests..."
npm test

echo "✅ All checks passed!"
