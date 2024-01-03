#!/bin/bash

# このスクリプトがあるディレクトリを取得
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# vscodeの設定ファイルがあるディレクトリ
VSCODE_SETTING_FILE_DIR="$HOME/Library/Application Support/Code/User"

# vscodeの設定ファイルを上書きする
echo "vscodeの設定ファイルを上書きします"
if [ -L "${VSCODE_SETTING_FILE_DIR}/settings.json" ]; then
  # 既存のリンクやファイルを上書きして新しいシンボリックリンクを作成し、各操作の詳細を表示し、既存のシンボリックリンクを追跡しない
  ln -fsvn "${SCRIPT_DIR}/settings.json" "${VSCODE_SETTING_FILE_DIR}/settings.json"
fi

# vscodeのキーバインドを上書きする
echo "vscodeのキーバインドを上書きします"
if [ -L "${VSCODE_SETTING_FILE_DIR}/keybindings.json" ]; then
  ln -fsvn "${SCRIPT_DIR}/keybindings.json" "${VSCODE_SETTING_FILE_DIR}/keybindings.json"
fi


# vscodeの拡張機能をインストールする
cat "$SCRIPT_DIR/extensions" | while read line
do
  code --install-extension $line
done

# 拡張機能のリストを更新する
code --list-extensions > "$SCRIPT_DIR/extensions"
