#!/bin/sh
# PostToolUse hook: .lua を編集したら構文チェックする。
# エラー時は exit 2 で stderr を Claude に返し、その場で直させる。

set -u

input="$(cat)"

file="$(printf '%s' "$input" | python3 -c 'import json,sys
try:
    d = json.load(sys.stdin)
except Exception:
    raise SystemExit(0)
print((d.get("tool_input") or {}).get("file_path") or "")' 2>/dev/null)"

case "$file" in
    *.lua) ;;
    *) exit 0 ;;
esac

[ -f "$file" ] || exit 0

# wezterm は Lua 5.4 (mlua)、nvim は LuaJIT 5.1。実行系に合わせてパーサを選ぶ。
# 5.4 のパーサでは `//` や `<<` を通してしまい LuaJIT では落ちるため、混ぜてはいけない。
case "$file" in
    */wezterm/*)
        command -v luac >/dev/null 2>&1 || exit 0
        out="$(luac -p "$file" 2>&1)" && exit 0
        checker="luac (Lua 5.4)"
        ;;
    *)
        command -v luajit >/dev/null 2>&1 || exit 0
        out="$(luajit -bl "$file" 2>&1 >/dev/null)" && exit 0
        checker="luajit (LuaJIT 5.1)"
        ;;
esac

printf 'Lua syntax error detected by %s:\n%s\n' "$checker" "$out" >&2
exit 2
