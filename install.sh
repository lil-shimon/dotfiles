#!/bin/bash

# 各ディレクトリの install.sh をまとめて実行します。
# 新しく <tool>/install.sh を追加した場合、このスクリプトの変更は不要です。

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

failed=()

for script in "$SCRIPT_DIR"/*/install.sh; do
    [ -f "$script" ] || continue
    name="$(basename "$(dirname "$script")")"

    echo ""
    echo "=== ${name} ==="
    if bash "$script"; then
        echo "--- ${name}: 完了"
    else
        echo "--- ${name}: 失敗 (終了コード $?)"
        failed+=("$name")
    fi
done

echo ""
if [ ${#failed[@]} -eq 0 ]; then
    echo "すべてのインストールスクリプトが完了しました。"
else
    echo "失敗したスクリプト: ${failed[*]}"
    exit 1
fi
