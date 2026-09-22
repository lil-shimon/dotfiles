#!/bin/bash

# グローバルの mise 設定を dotfiles 管理下のファイルに symlink します。
SOURCE="$HOME/dotfiles/mise/config.toml"
TARGET="$HOME/.config/mise/config.toml"

if [ ! -f "$SOURCE" ]; then
    echo "Error: リンク元が見つかりません: $SOURCE" >&2
    exit 1
fi

mkdir -p "$(dirname "$TARGET")" || exit 1

if [ -L "$TARGET" ]; then
    current="$(readlink "$TARGET")"
    if [ "$current" = "$SOURCE" ]; then
        echo "既にシンボリックリンクが存在します: $TARGET"
        exit 0
    fi
    echo "別のリンク先を指しているため張り替えます: $current"
    rm "$TARGET" || exit 1
elif [ -e "$TARGET" ]; then
    echo "既存のconfig.tomlファイルが存在します。バックアップを作成します..."
    timestamp="$(date +%Y%m%d%H%M%S)"
    mv "$TARGET" "$TARGET.backup.$timestamp" || exit 1
    echo "バックアップを作成しました: $TARGET.backup.$timestamp"
fi

ln -s "$SOURCE" "$TARGET" || exit 1
echo "シンボリックリンクを作成しました: $TARGET"
