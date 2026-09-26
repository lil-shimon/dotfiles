#!/usr/bin/env bash
# usage: nix-version-diff.sh <base-rev>
#
# <base-rev> と作業ツリーの間で nix/flake.lock が変わっていれば、
# home.packages の各パッケージの name を nix eval で比較し、Markdown を stdout に出す。
# $GITHUB_OUTPUT があれば changed=true|false を書き出す。
set -euo pipefail
shopt -s inherit_errexit

base=$1
apply='map (p: p.name)'

root=$(git rev-parse --show-toplevel)
cd "$root"

base_tree=$(mktemp -d)
trap 'git worktree remove --force "$base_tree"' EXIT
git worktree add --quiet --detach "$base_tree" "$base"

eval_names() {
  local json
  json=$(nix eval --no-update-lock-file --json "$1#homeConfigurations.shimonlil.config.home.packages" --apply "$apply")
  jq -r '.[]' <<<"$json"
}

if git diff --quiet "$base" -- nix/flake.lock; then
  echo "no nix/flake.lock changes against $base" >&2
  exit 1
fi

# process substitution 内の失敗は set -e で止まらず「変化なし」扱いになるので、先に変数で受ける
before_names=$(eval_names "$base_tree/nix")
after_names=$(eval_names "$root/nix")

changed=false
rows=""
while IFS=$'\t' read -r before after; do
  if [ "$before" = "$after" ]; then
    rows+="| $before | $after |"$'\n'
  else
    changed=true
    rows+="| $before | **$after** |"$'\n'
  fi
done < <(paste <(echo "$before_names") <(echo "$after_names"))

echo "<!-- nix-version-diff -->"
echo "## ツールのバージョン差分"
echo
echo "| before | after |"
echo "|---|---|"
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
