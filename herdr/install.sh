#!/bin/bash

if ! command -v nix &>/dev/null; then
    echo "Error: nix is required to install herdr." >&2
    echo "Install Nix first, then re-run this script: https://determinate.systems/nix" >&2
    exit 1
fi

# herdr本体をインストールします。
if nix profile list --json 2>/dev/null | grep -q "dotfiles?dir=herdr"; then
    echo "herdrは既にインストールされています。"
else
    echo "herdrをインストールしています..."
    nix profile add ~/dotfiles/herdr
    echo "herdrのインストールが完了しました。"
fi

herdr_path="$(command -v herdr)"
if [ "$herdr_path" != "$HOME/.nix-profile/bin/herdr" ]; then
    echo "Warning: herdr resolves to ${herdr_path:-none}, not $HOME/.nix-profile/bin/herdr." >&2
    if brew list herdr &>/dev/null; then
        echo "Warning: brew版のherdrが残っています。'brew uninstall herdr' で削除してください。" >&2
    fi
fi

# Agent Skill をインストールします。flake の herdr と同じ rev から取得されます。
mkdir -p ~/.claude/skills
if [ -e ~/.claude/skills/herdr ] && [ ! -L ~/.claude/skills/herdr ]; then
    echo "既存のherdrスキルが存在します。バックアップを作成します..."
    mv ~/.claude/skills/herdr ~/.claude/skills/herdr.backup
    echo "バックアップを作成しました: ~/.claude/skills/herdr.backup"
fi
nix build ~/dotfiles/herdr#skill --out-link ~/.claude/skills/herdr
echo "Agent Skillをインストールしました: ~/.claude/skills/herdr"

# herdr-reviewrプラグインがインストールされているかどうかをチェックします。
if [ -d ~/.config/herdr/plugins/config/persiyanov.reviewr ]; then
    echo "herdr-reviewrは既にインストールされています。"
else
    echo "herdr-reviewrをインストールしています..."
    herdr plugin install persiyanov/herdr-reviewr --yes
    echo "herdr-reviewrのインストールが完了しました。"
fi

# シンボリックリンクを作成する前に、既存のファイル/リンクをチェックします。
mkdir -p ~/.config/herdr
if [ -L ~/.config/herdr/config.toml ]; then
    echo "既にシンボリックリンクが存在します: ~/.config/herdr/config.toml"
elif [ -f ~/.config/herdr/config.toml ]; then
    echo "既存のconfig.tomlファイルが存在します。バックアップを作成します..."
    mv ~/.config/herdr/config.toml ~/.config/herdr/config.toml.backup
    echo "バックアップを作成しました: ~/.config/herdr/config.toml.backup"
    ln -s ~/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
    echo "シンボリックリンクを作成しました: ~/.config/herdr/config.toml"
else
    ln -s ~/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
    echo "シンボリックリンクを作成しました: ~/.config/herdr/config.toml"
fi

# Claude Code の hook をシンボリックリンクします。
mkdir -p ~/.claude/hooks
if [ -L ~/.claude/hooks/herdr-agent-name.sh ]; then
    echo "既にシンボリックリンクが存在します: ~/.claude/hooks/herdr-agent-name.sh"
elif [ -f ~/.claude/hooks/herdr-agent-name.sh ]; then
    echo "既存のherdr-agent-name.shファイルが存在します。バックアップを作成します..."
    mv ~/.claude/hooks/herdr-agent-name.sh ~/.claude/hooks/herdr-agent-name.sh.backup
    echo "バックアップを作成しました: ~/.claude/hooks/herdr-agent-name.sh.backup"
    ln -s ~/dotfiles/herdr/hooks/herdr-agent-name.sh ~/.claude/hooks/herdr-agent-name.sh
    echo "シンボリックリンクを作成しました: ~/.claude/hooks/herdr-agent-name.sh"
else
    ln -s ~/dotfiles/herdr/hooks/herdr-agent-name.sh ~/.claude/hooks/herdr-agent-name.sh
    echo "シンボリックリンクを作成しました: ~/.claude/hooks/herdr-agent-name.sh"
fi
