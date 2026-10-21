#!/bin/sh
# UserPromptSubmit hook: herdr のペイン名を、入力したプロンプト先頭で置き換える。
# config.toml がこれを pane トークンとして読み、agents 欄の1行目
# ([ui.sidebar.agents] rows) と外側のターミナルのウィンドウタイトル
# ([ui] window_title) の両方に出す。
# タブ名も同じ文字列で付け、プロンプトに Issue か PR (#123 か URL) があればタイトルの要約で差し替える。
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
export HERDR_AGENT_NAME_WIDTH

# 標準入力の1行目を表示幅に収める
fit() {
  python3 -c '
import os, sys, unicodedata

limit = int(os.environ.get("HERDR_AGENT_NAME_WIDTH") or 22)
text = sys.stdin.read().strip()
line = text.splitlines()[0].strip() if text else ""

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
'
}

# 入力 JSON から「プロンプト」「cwd」「Issue のリポジトリ」「Issue 番号」をタブ区切りで取り出す
fields="$(python3 - "$hook_input_file" <<'PY'
import json, re, sys

try:
    with open(sys.argv[1], encoding="utf-8") as f:
        data = json.load(f)
except Exception:
    raise SystemExit(0)

prompt = data.get("prompt") or ""
first = prompt.strip().splitlines()[0].strip() if prompt.strip() else ""
repo, num = "", ""
m = re.search(r"https://github\.com/([\w.-]+/[\w.-]+)/(?:issues|pull)/(\d+)", prompt)
if m:
    repo, num = m.group(1), m.group(2)
else:
    m = re.search(r"(?<![\w/&])#(\d+)\b", prompt)
    if m:
        num = m.group(1)

clean = lambda s: s.replace("\t", " ")
print("\t".join([clean(first), clean(data.get("cwd") or ""), repo, num]))
PY
)" || exit 0

sep="$(printf '\t')"
prompt_line="${fields%%"$sep"*}"; rest="${fields#*"$sep"}"
cwd="${rest%%"$sep"*}"; rest="${rest#*"$sep"}"
issue_repo="${rest%%"$sep"*}"
issue_num="${rest#*"$sep"}"

name="$(printf '%s' "$prompt_line" | fit)" || exit 0
[ -n "$name" ] || exit 0
herdr pane rename "$HERDR_PANE_ID" "$name" >/dev/null 2>&1 || true

[ -n "${HERDR_TAB_ID:-}" ] || exit 0

# 自動で付けたタブ名を覚えておき、prefix+r で付けた名前と見分ける
auto_dir="${TMPDIR:-/tmp}/herdr-tab-auto"
auto_file="$auto_dir/$(printf '%s' "$HERDR_TAB_ID" | tr -c 'A-Za-z0-9' '_')"

# タブ名が既定の番号（数字だけ）か、前回自動で付けた名前のままなら書き換えてよい
tab_renamable() {
  herdr tab get "$HERDR_TAB_ID" 2>/dev/null | AUTO_FILE="$auto_file" python3 -c '
import json, os, sys
t = json.load(sys.stdin)["result"]["tab"]
try:
    auto = open(os.environ["AUTO_FILE"], encoding="utf-8").read()
except OSError:
    auto = None
sys.exit(0 if t["label"].isdigit() or t["label"] == auto else 1)
' 2>/dev/null
}

set_tab() {
  herdr tab rename "$HERDR_TAB_ID" "$1" >/dev/null 2>&1 || return 0
  mkdir -p "$auto_dir" && printf '%s' "$1" >"$auto_file"
}

if [ -z "$issue_num" ]; then
  # Issue の指定がないときは、最初のプロンプトでだけ付ける
  [ -f "$auto_file" ] && exit 0
  tab_renamable && set_tab "$name"
  exit 0
fi

tab_renamable || exit 0
set_tab "$name"
command -v gh >/dev/null 2>&1 || exit 0
command -v claude >/dev/null 2>&1 || exit 0

# 要約は数秒かかるので、hook を待たせずに裏で差し替える
(
  cd "${cwd:-.}" 2>/dev/null || exit 0
  if [ -n "$issue_repo" ]; then
    title="$(gh issue view "$issue_num" --repo "$issue_repo" --json title -q .title)" || exit 0
  else
    title="$(gh issue view "$issue_num" --json title -q .title)" || exit 0
  fi
  [ -n "$title" ] || exit 0
  cd "${TMPDIR:-/tmp}"
  summary="$(claude -p --model haiku --settings '{"disableAllHooks":true}' \
    "次の GitHub の Issue か PR のタイトルを、ターミナルのタブ名として全角$((HERDR_AGENT_NAME_WIDTH / 2))文字以内に要約してください。タブ名だけを1行で出力し、説明や記号の装飾は付けないでください。

タイトル: $title" | fit)" || exit 0
  [ -n "$summary" ] || exit 0
  tab_renamable && set_tab "$summary"
) </dev/null >/dev/null 2>&1 &

exit 0
