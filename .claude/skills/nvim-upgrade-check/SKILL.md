---
name: nvim-upgrade-check
description: >
  `nix/flake.lock` の更新（Dependabot の PR や手動の nix flake update）で neovim のバージョンが
  上がるときに、マージ・switch の前に新しい neovim で設定が壊れないかを検証するスキル。
  「nvim 上がる PR 見て」「Dependabot の flake.lock の PR 確認して」「neovim のバージョンアップ大丈夫？」
  「/nvim-upgrade-check」などのトリガーで起動する。flake.lock を動かす PR をマージしようとしている時は、
  nvim と明示されていなくてもまずこのスキルでバージョン差を確認すること。
---

# nvim-upgrade-check

neovim は `nix/` の flake（`nix/home.nix` の `pkgs.neovim-unwrapped`）で入っていて、
nixpkgs は全ツールで共通の1つ。**lock の更新で neovim のバージョンが黙って動く**ので、
マージ・`switch` の前にバージョン差を見て、必要なときだけ検証する。

## 1. バージョン差を見る

PR のブランチ（または lock を更新した作業ツリー）で:

```bash
cd ~/dotfiles
nix eval --raw --inputs-from "git+file://$HOME/dotfiles?dir=nix&rev=$(git rev-parse origin/master)" nixpkgs#neovim-unwrapped.version; echo
nix eval --raw --inputs-from ./nix nixpkgs#neovim-unwrapped.version; echo
```

1 行目が master、2 行目が変更後。

| 差 | 例 | やること |
|---|---|---|
| 変わらない | 0.12.5 → 0.12.5 | 検証不要 |
| パッチ | 0.12.4 → 0.12.5 | 検証不要。マージ → `switch` でよい |
| **マイナー** | 0.12.x → 0.13.0 | **手順 2 へ。** neovim は 1.0 前なので、マイナーが実質メジャー。API の挙動が変わる |

実績: 0.11 → 0.12 では `vim.treesitter.get_parser` の失敗時の挙動が変わり、rainbow-delimiters が
ファイルを開くたびにエラーを出した（#77 で検出、#82 でプラグインごと削除）。

## 2. 新しい neovim で起動する（マイナーのときだけ）

switch せずに、新しいバイナリだけを取り出して実 UI で起動する。設定もデータも本番のものを使う。

```bash
NEW=$(nix build --no-link --print-out-paths --inputs-from ./nix nixpkgs#neovim-unwrapped)
"$NEW/bin/nvim" --version | head -1
"$NEW/bin/nvim" <普段よく開くファイル>
```

起動したら以下を見る。

- ファイルを開いたとき・filetype が付いたときにエラーが出ないか（`:messages`）
- `:checkhealth` に ERROR が増えていないか（`Denops is stopped` は headless 特有で、実 UI では出ない）
- treesitter のハイライトが効いているか。崩れていたら `:TSUpdate` で parser を作り直す

**`:Lazy sync` は打たない。** プラグインが最新へ動き、「neovim を上げた結果」と
「プラグインを上げた結果」が混ざって切り分けられなくなる。取得が要るなら `:Lazy restore`（lock どおり）。
`lazy-lock.json` は `~/dotfiles/nvim/lazy-lock.json` そのものなので、sync するとリポジトリの lock が書き換わる。

### 壊れていたら

原因が新しい neovim か既存の問題かを切り分けるため、今のバイナリで同じ操作をする。

```bash
nvim <同じファイル>   # 今 PATH にあるのは master 側の neovim
```

両方で出るなら neovim の版上げとは無関係。新しい方だけで出るなら、PR に症状と再現手順を書いて
マージを保留する（プラグインの pin を上げる / プラグインを外す、などの対処は別 PR）。

## 3. switch 後に壊れた場合の戻し方

```bash
home-manager generations                     # 2 行目が1つ前の世代
"$(home-manager generations | sed -n 2p | awk '{print $NF}')"/activate
```

**データディレクトリは戻らない。** 新しい neovim で一度でも起動していれば、
`~/.local/share/nvim` の treesitter parser は新しい ABI で作り直されている。
戻した後にハイライトが崩れていたら `:TSUpdate` で作り直す。
ここにあるネイティブの成果物（parser、`telescope-fzf-native` の `libfzf.so`、LuaSnip の `jsregexp.so`）は
すべて `:TSUpdate` / `:Lazy build` で作り直せるので、取り返しのつかないものは無い（#59 で調査済み）。
