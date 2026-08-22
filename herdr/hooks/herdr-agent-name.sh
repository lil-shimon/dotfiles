#!/bin/sh
# UserPromptSubmit hook: herdr の agents 欄の表示名を、入力したプロンプト先頭で置き換える。
# herdr が自動インストールする herdr-agent-state.sh とは別ファイル（あちらは更新で上書きされる）。

set -eu

hook_input_file="$(mktemp "${TMPDIR:-/tmp}/herdr-agent-name.XXXXXX")" || exit 0
trap 'rm -f "$hook_input_file"' EXIT HUP INT TERM
cat >"$hook_input_file" 2>/dev/null || true

[ "${HERDR_ENV:-}" = "1" ] || exit 0
[ -n "${HERDR_PANE_ID:-}" ] || exit 0
command -v python3 >/dev/null 2>&1 || exit 0
command -v herdr >/dev/null 2>&1 || exit 0

# 表示幅の上限（サイドバー幅に合わせる）。全角は2カラムとして数える。
: "${HERDR_AGENT_NAME_WIDTH:=22}"

name="$(HERDR_HOOK_INPUT_FILE="$hook_input_file" python3 - <<'PY'
import json, os, sys, unicodedata

limit = int(os.environ.get("HERDR_AGENT_NAME_WIDTH") or 22)

try:
    with open(os.environ["HERDR_HOOK_INPUT_FILE"], encoding="utf-8") as f:
        prompt = json.load(f).get("prompt") or ""
except Exception:
    raise SystemExit(0)

# 1行目だけ・前後空白を落とす
line = prompt.strip().splitlines()[0].strip() if prompt.strip() else ""
if not line:
    raise SystemExit(0)

def width(ch):
    return 2 if unicodedata.east_asian_width(ch) in ("W", "F") else 1

out, used = [], 0
for ch in line:
    w = width(ch)
    if used + w > limit:
        out.append("…")
        break
    out.append(ch)
    used += w

sys.stdout.write("".join(out))
PY
)" || exit 0

[ -n "$name" ] || exit 0
herdr agent rename "$HERDR_PANE_ID" "$name" >/dev/null 2>&1 || true
exit 0
