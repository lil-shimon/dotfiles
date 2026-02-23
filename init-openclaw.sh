#!/bin/bash

set -e

# ── Homebrew ──────────────────────────────────────────────
echo ">>> Installing Homebrew..."
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# インストール後にbrewをPATHに追加（現在のセッション用）
if [[ $(uname -m) == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# ── mise ──────────────────────────────────────────────────
echo ">>> Installing mise..."
brew install mise
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc

# ── openclaw ──────────────────────────────────────────────
echo ">>> Installing openclaw..."
curl -fsSL https://openclaw.ai/install.sh | bash

echo ">>> Done! Restart your terminal or run: source ~/.zshrc"
