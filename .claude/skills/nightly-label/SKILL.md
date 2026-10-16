---
name: nightly-label
description: >
  dotfiles の Issue に `nightly` ラベルを付けてよいか（夜間のクラウド実行に任せられるか）を判定するスキル。
  「nightly 付けられる？」「今夜回せる Issue ある？」「夜間に回す Issue を選んで」「/nightly-label [番号...]」
  などのトリガーで起動する。番号が無ければ open な Issue をすべて見る。
  Issue の読み込み → 判定基準ごとの確認 → 受入基準のコマンドを master で実測 → 判定表の提示 →
  承認を得てラベル付与、という流れを実行する。
---

# nightly-label

`nightly` ラベルの Issue は、毎日 1:00（JST）にクラウドの定期実行が古い順に最大 3 件ずつ
`issue-to-pr` で PR にする。マージはしない。実行環境は Linux で、誰も見ていない。
Mac でしか確かめられない受入基準は、PR に「手元で確認」として残り、本人が朝に確かめてからマージする。

ラベルを付けた時点で、その Issue は**人の判断なしで実装される**。
このスキルは、その前の最後の関門を受け持つ。**迷ったら付けない側に倒す。**

## 1. 対象を集める

```bash
gh issue list --state open --limit 100 --json number,title,labels
gh pr list --state open --json number,title,body
```

- 番号を渡されたらそれだけ、無ければ open な Issue すべてが対象
- 既に `nightly` が付いている Issue も判定し直す（付け直しの要否を見る）
- `gh` が見つからないときは `/etc/profiles/per-user/shimonlil/bin/gh` を使う

Issue ごとに本文と、親 Issue があれば親の本文も読む。

```bash
gh issue view <N> --json number,title,body,labels,state,comments
gh api graphql -f query='{repository(owner:"lil-shimon",name:"dotfiles"){issue(number:<N>){
  parent{number title body} subIssues(first:20){nodes{number title state}}}}}'
```

## 2. 判定基準

すべて満たしたときだけ「付けられる」。1 つでも外れたら「付けられない」とし、外れた基準を理由に書く。

| # | 基準 | 外れる例 |
|---|---|---|
| 1 | open で、担当 PR が無く、未解決の依存（`blocked by`、「〜の後で」）が無い | open な PR の本文に `#<N>` がある |
| 2 | 変更がリポジトリの中で完結し、`nix/flake.lock` を変えない | `~/.claude` など管理外のファイルの変更、入力の更新 |
| 3 | 実装に macOS の実機が要らない。現状の値など、Mac で調べる必要のあることは Issue に書いてある | 「今の値を確かめてから決める」、棚卸しの表が空いている |
| 4 | 本人にしか決められない判断事項が残っていない。「判断事項」が「なし」か、すべて答えが書いてある | 好み・運用方針で決まる選択、⭐ の推奨だけで本人が確定していない、親 Issue の方針と食い違う |
| 5 | 作業がチェックリストで書かれ、対象のファイル（できれば行）が特定されている | 「〜を整理する」だけで範囲が閉じていない |
| 6 | 変更そのものを確かめる受入基準が、少なくとも 1 つコマンドで機械的に確かめられる。残りの基準は手元で確かめる操作手順になっている | 目視・体感の基準だけ、手元での確かめ方が書いていない |
| 7 | 機械的に確かめる受入基準のコマンドが、クラウドで使えるツールだけで動く | wezterm・deno・tree-sitter CLI・Mac の GUI・`darwin-rebuild` を要する |
| 8 | 受入基準のコマンドを master で実際に叩き、書いてあるとおりの前提で動く（手順 3） | master でも別の理由で失敗する、出力の比較対象が取れない |
| 9 | 差分が 1〜2 ファイルの数行で、朝に数分で読める | 新機能、複数ディレクトリにまたがる変更 |

クラウドで使えるツールは、定期実行のプロンプトが入れる `luajit`・`lua5.4`（`luac`）・`nvim` v0.12.5、
イメージに入っている `nix`（`nix eval` のみ。ビルドはできない）と、`git`・`grep`・`python3` などの標準的なコマンドだけ。
基準 7 はこの一覧で判定する。`nix eval` の準備は `issue-to-pr` の「クラウド実行時」にある。

## 3. 受入基準を master で実測する

基準 1〜7 を満たした Issue だけ、受入基準のコマンドを master の worktree で叩く。
変更前の master で「満たしていない」側の結果が出ること、比較の基準になる出力が取れることを確かめる。

```bash
git fetch -q origin
git worktree add --detach <scratchpad>/nl-master origin/master
```

- nvim の起動確認は、設定ディレクトリを symlink にして `-u` を付けずに行う。
  `-u nvim/init.lua` では `nvim/lua` が runtimepath に入らず、master でも `module 'base' not found` で止まる

  ```bash
  mkdir -p <scratchpad>/nl-cfg && ln -sfn <scratchpad>/nl-master/nvim <scratchpad>/nl-cfg/nvim
  XDG_CONFIG_HOME=<scratchpad>/nl-cfg nvim --headless +qa
  ```

- 1 回目の起動はプラグインの導入なので、比べるのは 2 回目以降
- 手元に無いツール（`luajit` など）は `nix run nixpkgs#luajit -- ...` で代える
- 手元で確かめる受入基準は叩かない。操作手順が具体的か（コマンドと期待する出力があるか）だけを見る
- 終わったら `git worktree remove --force` で片付ける

- 受入基準が「`io.popen` を差し替えて〜を示す」のように手順の説明だけでコマンドが無いときは、
  その検証スクリプトを書いて master で動かす。動いたら、スクリプトをそのまま貼った本文案を作る。
  夜間の実行に毎回スクリプトを書かせると、確かめ方が晩ごとに変わり、朝に結果を比べられない

コマンドが master で想定どおりに動かないときは、基準 8 で「付けられない」とする。
受入基準の書き方だけが原因なら、直した本文案を判定表に添える。

## 4. 判定を見せる

結論を先に書き、次の表で返す。

| Issue | 判定 | 理由（外れた基準の番号と中身、または実測の要点） |
|---|---|---|

- 「付けられる」が 4 件以上なら、1 晩 3 件なので何日で捌けるかを添える
- 「受入基準を直せば付けられる」Issue は分けて示し、直した本文案を付ける
- 判断を求める Issue が 3 件以上あれば、HTML の判断ページを Artifact で公開し、推奨（付ける / 付けない / 本文を直して付ける）を初期選択にする

## 5. ラベルを付ける

ラベルの付与と Issue 本文の修正は、**本人の承認を得てから**行う。

```bash
gh issue edit <N> --add-label nightly
gh issue edit <N> --body-file <file>   # 本文を直す場合
```

最後に `gh issue list --label nightly --state open` で、付いた Issue と次の 1:00 に回る順（古い順に 3 件）を報告する。
