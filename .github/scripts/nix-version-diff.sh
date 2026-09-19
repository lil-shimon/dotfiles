#!/usr/bin/env bash
# usage: nix-version-diff.sh <base-rev>
#
# <base-rev> と作業ツリーの間で flake.lock が変わったディレクトリについて、
# ツールのバージョンを nix eval で比較し、Markdown を stdout に出す。
# $GITHUB_OUTPUT があれば changed=true|false を書き出す。
set -euo pipefail
shopt -s inherit_errexit

base=$1
system=aarch64-darwin
# git/ は buildEnv で version を持たないので、paths の中身の name を並べる
apply='p: if p ? paths then map (x: x.name) p.paths else [ p.name ]'

root=$(git rev-parse --show-toplevel)
cd "$root"

base_tree=$(mktemp -d)
trap 'git worktree remove --force "$base_tree"' EXIT
git worktree add --quiet --detach "$base_tree" "$base"

eval_names() {
  local json
  json=$(nix eval --no-update-lock-file --json "$1#packages.$system.default" --apply "$apply")
  jq -r '.[]' <<<"$json"
}

dirs=$(git diff --name-only "$base" -- '*/flake.lock' | xargs -n1 dirname)
if [ -z "$dirs" ]; then
  echo "no flake.lock changes against $base" >&2
  exit 1
fi

changed=false
rows=""
for dir in $dirs; do
  # process substitution 内の失敗は set -e で止まらず「変化なし」扱いになるので、先に変数で受ける
  before_names=$(eval_names "$base_tree/$dir")
  after_names=$(eval_names "$root/$dir")
  while IFS=$'\t' read -r before after; do
    if [ "$before" = "$after" ]; then
      rows+="| \`$dir\` | $before | $after |"$'\n'
    else
      changed=true
      rows+="| \`$dir\` | $before | **$after** |"$'\n'
    fi
  done < <(paste <(echo "$before_names") <(echo "$after_names"))
done

echo "<!-- nix-version-diff -->"
echo "## ツールのバージョン差分"
echo
echo "| directory | before | after |"
echo "|---|---|---|"
printf '%s' "$rows"
echo
if [ "$changed" = true ]; then
  echo "ツールのバージョンが変わっている。"
else
  echo "ツールのバージョンに変化なし。この PR は自動で close する。"
fi

if [ -n "${GITHUB_OUTPUT:-}" ]; then
  echo "changed=$changed" >>"$GITHUB_OUTPUT"
fi
