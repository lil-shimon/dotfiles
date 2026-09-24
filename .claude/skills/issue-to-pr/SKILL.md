---
name: issue-to-pr
description: >
  dotfiles リポジトリの GitHub Issue を読み、実装・検証して PR 作成まで通すスキル。
  「#110 やって」「この Issue 実装して」「Issue を見て PR まで」「/issue-to-pr <番号 or URL>」
  などのトリガーで起動する。Issue 番号や URL を渡されて「実装して」と言われたら、
  明示的にスキル名を言われていなくても使うこと。
  Issue と親・兄弟 Issue の読み込み → 判断事項の解消 → 事前調査 → 実装 →
  受入基準ごとの実測 → pull-request スキルで commit / PR / マージ判定 → 報告、
  という一連の流れを実行する。
---

# issue-to-pr

Issue を起点に、実装から PR までを1本で通す。
commit / PR / マージ判定は `pull-request` スキルに任せ、このスキルは
**その手前（読む・決める・作る・確かめる）と、最後の報告**を受け持つ。

## 1. Issue を読む

```bash
gh issue view <N> --json number,title,body,labels,state,url
gh api graphql -f query='{repository(owner:"lil-shimon",name:"dotfiles"){issue(number:<N>){
  parent{number title body} subIssues(first:20){nodes{number title state}}}}}'
```

- **親 Issue の本文も読む。** 方針（例:「一度に全部移さない」「スコープ外」）は親にしか
  書かれていないことが多く、子だけ読むとスコープを踏み越える
- 兄弟 Issue の一覧を見て、**今回の Issue がどこまでを担当するか**の境界を掴む。
  兄弟が担当する作業を先取りしない
- `blocked by` や「〜の後で」といった依存が未解決なら、ここで止めて報告する
- Issue が既に close されている、または担当 PR が既にある場合も止める

## 2. 判断事項を解消する

Issue に「判断事項」「要検討」がある場合、実装前に1つずつ答えを出す。

- **コードベース・ドキュメント・実測で決まるものは自分で決める。**
  例: `stateVersion` はロックした home-manager の `release.json` の値を読めば決まる。
  推測で書かず、決めた根拠を PR 本文の `## Why` に残す
- Issue に推奨案が書いてあり、それを覆す材料が無ければそのまま採る
- **本人の好み・運用方針でしか決まらないもの**だけを、⭐5段階の推奨度と理由を付けて質問する。
  慣習で決まるものや、後から直すコストが小さいものは質問しない
- ユーザーからの質問（「なぜ？」「一般的には？」）には、実装を進める前に答える。
  質問への答え次第で Issue の構成が変わることがある（分割の要否など）

## 3. 事前調査

手を動かす前に、今の状態を記録しておく。後の before / after 比較と、
「既存を壊していない」ことの証拠に使う。

```bash
git status --short && git branch --show-current
git fetch -q && git log --oneline -1 origin/master
```

加えて、変更対象に応じて調べる。

| 変更の種類 | 事前に見るもの |
|---|---|
| Nix / home-manager | `nix --version`、`nix profile list` の Name 一覧を scratchpad に保存 |
| ホームに配置するファイル | 配置先に既存ファイルがあるか（`ls -la`）。`.backup` 退避と衝突しないか |
| CI / Dependabot に関わるもの | `.github/` 配下の対象パスやパターンに新しいファイルが入るか |

## 4. 実装する

**ファイルを書く前にブランチを切る**（命名は `pull-request` スキルの規約に従う）。
master の上で作業を始めると、途中で build のために `git add` したときに
master を汚す。

```bash
git switch -c <type>/<kebab-case-summary>
```

- Issue に書かれた作業チェックリストを上から潰す。**チェックリストに無い作業は足さない。**
  気づいた改善点は PR の `## Note / 対象外` に回す
- 既存ファイルの書き方（インデント、コメント密度、命名）に揃える
- ドキュメント更新（`CLAUDE.md` や README）が作業に含まれていれば忘れない
- **Nix flake の落とし穴**: git 管理下の flake は未追跡ファイルを見ない。
  新しいファイルを作ったら `git add -N <file>` で intent-to-add してから
  `nix flake lock` / `nix build` を叩く
- フォーマッタがあれば通す（Nix なら `nix run nixpkgs#nixfmt -- --check <files>`）
- `result` などのビルド成果物が `.gitignore` から漏れていたら追加する

## 5. 検証する

**受入基準の1項目ごとに、それを満たしたことを示すコマンドと出力を1つ以上用意する。**
これがそのまま PR の `## 動作確認` になる。

### 段階を踏む

ホームや環境を書き換える操作は、**無害な段階から順に**進める。

1. 構文 / 評価（`nix flake check`、`nix eval`、`luac -p`、`sh -n` など）
2. ビルドだけ（`build`。何が配置されるかを `result/` の中身で確認する）
3. 配置先との衝突確認（2 で見えたファイルが既に存在しないか）
4. 適用（`switch` / `install`）

4 は **Issue の作業に明記されていて、かつ 3 で衝突が無いこと**を確認できたときだけ進める。
どちらかを満たさなければ、3 までの結果を添えて止めて確認を取る。

### 既存を壊していないことを示す

- 事前調査で保存した一覧と before / after を `diff` し、**増えたもの・消えたものを列挙**する
- 影響を受けうる既存ツールを実際に叩く（`--version`、`zsh -ic 'echo ok'` など）
- 新しいシェルでも効くかを確かめる（PATH 系の変更は、今のシェルの `export` では確認にならない）

### 想定と違ったこと

実装中に出た「Issue に書かれていない副作用」（空ディレクトリが作られた、警告が出た等）は
隠さず記録して、PR の Note と最後の報告に入れる。

## 6. PR を作る

`pull-request` スキルを Skill ツールで起動し、その手順に従って commit / push / PR / マージ判定まで行う。

このスキルから引き継ぐもの:

- PR 本文に `Closes #<N>`（その PR で Issue の作業が全て終わる場合）。
  一部だけなら `Refs #<N>`
- `## Why` に、手順 2 で解消した判断事項を表で残す（採用したもの / 理由）
- `## 動作確認` に、手順 5 の実測をそのまま貼る
- `## Note / 対象外` に、スコープ外にした気づきと想定外の副作用

## 7. 報告する

ユーザーには次の順で返す。

1. PR の URL と、マージ済みか保留かどうか（Issue が自動 close されたかも）
2. 受入基準ごとの結果（満たした / 満たしていない、とその根拠を1行ずつ）
3. 判断事項をどう決めたか
4. 想定外だったこと、自分のミスとその後始末（隠さない）
5. スコープ外として残したもの
6. 次に着手できる兄弟 Issue
