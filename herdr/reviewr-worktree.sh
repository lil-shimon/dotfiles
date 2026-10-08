#!/usr/bin/env bash
# reviewr サイドバーを、選んだ git worktree を対象にトグルする。
# herdr の [[keys.command]] (type = "popup") から呼ばれる前提。
# reviewr 本体の toggle は focused pane の cwd しか見ないため、
# Claude Code が中で worktree を切る運用だと本体 checkout を見てしまう。
set -uo pipefail

export PATH="$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/run/current-system/sw/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:${PATH:-}"

H="${HERDR_BIN_PATH:-herdr}"
ws="${HERDR_ACTIVE_WORKSPACE_ID:-}"
pane="${HERDR_ACTIVE_PANE_ID:-}"
cwd="${HERDR_ACTIVE_PANE_CWD:-$PWD}"

die() {
  printf 'reviewr-worktree: %s\n' "$1" >&2
  read -r -n 1 -p 'press any key' _
  exit 1
}

[ -n "$ws" ] || die "no active workspace"

panes_json=$("$H" pane list --workspace "$ws") || die "herdr pane list failed"
existing=$(printf '%s' "$panes_json" | jq -r '.result.panes[] | select(.label == "reviewr") | .pane_id')
if [ -n "$existing" ]; then
  while IFS= read -r p; do
    "$H" pane close "$p" >/dev/null
  done <<<"$existing"
  exit 0
fi

git -C "$cwd" rev-parse --show-toplevel >/dev/null 2>&1 || die "not a git repo: $cwd"

# 最近触られた worktree を上に出す。index の mtime は git status でも更新されるので、
# エージェントが作業中の worktree がだいたい先頭に来る。
candidates=$(
  git -C "$cwd" worktree list --porcelain |
    awk '/^worktree /{path=substr($0,10)} /^branch /{sub("refs/heads/","",$2); print path "\t" $2} /^detached/{print path "\t(detached)"}' |
    while IFS=$'\t' read -r wt branch; do
      [ -d "$wt" ] || continue
      gitdir=$(git -C "$wt" rev-parse --absolute-git-dir 2>/dev/null) || continue
      mtime=$(stat -f %m "$gitdir/index" 2>/dev/null || echo 0)
      printf '%s\t%s\t%s\n' "$mtime" "$branch" "$wt"
    done |
    sort -rn | cut -f2-
)
[ -n "$candidates" ] || die "no worktrees found"

if [ "$(printf '%s\n' "$candidates" | wc -l)" -eq 1 ]; then
  target=$(printf '%s' "$candidates" | cut -f2)
else
  target=$(printf '%s\n' "$candidates" |
    fzf --delimiter=$'\t' --with-nth=1,2 --prompt='reviewr> ' --header='worktree to review' |
    cut -f2)
  [ -n "$target" ] || exit 0
fi

set -- --placement split --direction right
[ -n "$pane" ] && set -- "$@" --target-pane "$pane"
"$H" plugin pane open --plugin persiyanov.reviewr --entrypoint sidebar \
  "$@" --cwd "$target" --no-focus >/dev/null || die "herdr plugin pane open failed"
