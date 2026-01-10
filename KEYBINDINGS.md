# キーバインド一覧

## Tmux

### 基本設定
- Prefix: `Ctrl+t`

### ペイン操作
- `Prefix + h,j,k,l` : ペイン移動
- `Ctrl+h,j,k,l` : ペイン移動（prefix不要）
- `Prefix + H,J,K,L` : ペインリサイズ（5単位）
- `Prefix + |` : 縦分割（現在のディレクトリで）
- `Prefix + -` : 横分割（現在のディレクトリで）
- `Prefix + x` : ペインを閉じる

### ウィンドウ操作
- `Prefix + c` : 新しいウィンドウ（現在のディレクトリで）
- `Shift+←,→` : ウィンドウ切り替え（prefix不要）

### コピーモード
- `Prefix + [` : コピーモードに入る
- `v` : 選択開始
- `V` : 行選択
- `Ctrl+v` : 矩形選択
- `y` : コピー（macOSクリップボードにも保存）
- `Y` : 行コピー（macOSクリップボードにも保存）
- `Prefix + Ctrl+p` : ペースト
- マウスドラッグ選択でもクリップボードにコピー

### セッション管理
- `Prefix + s` : セッション一覧

### その他
- `Prefix + r` : 設定リロード

## Neovim

### 基本操作
- `<leader>` : スペースキー
- `<leader>q` : 閉じる (:q)
- `<leader>w` : 保存 (:w)
- `<leader>x` : 保存して閉じる (:x)
- `jj` : ノーマルモードに戻る（insert/terminal）
- `Ctrl+a` : 全選択
- `H` : 行頭へ移動
- `L` : 行末へ移動
- `x` : 削除（ヤンクしない）

### ウィンドウ操作
- `ss` : 水平分割
- `sv` : 垂直分割
- `sh,sj,sk,sl` : ウィンドウ移動
- `Ctrl+h,j,k,l` : ウィンドウ移動
- `<leader>h,j,l` : ウィンドウ移動

### タブ操作
- `te` : 新しいタブ
- `tn` : 次のタブ
- `tp` : 前のタブ
- `tq` : タブを閉じる

### バッファ操作（barbar.nvim）
- `ap` : 前のバッファ
- `an` : 次のバッファ
- `Ap` : バッファをピン留め
- `bd` : バッファを閉じる

### ファイル操作（Oil/Telescope）
- `Ctrl+e` : Oil（現在のバッファのディレクトリ）
- `Ctrl+f` : Oil（カレントディレクトリ）
- `<leader>f` : ファイル検索（Telescope）
- `<leader>r` : 文字列検索（Telescope live_grep）
- `<leader>d` : 診断一覧（Telescope）
- `<leader><leader>` : ファイルブラウザ（Telescope）

### LSP操作（Lspsaga）
- `gd` : 定義へジャンプ
- `pd` : 定義をプレビュー
- `K` : ホバー情報
- `D` : 行の診断を表示
- `V` : コードアクション
- `Ctrl+r` : リネーム
- `<leader>o` : アウトライン表示
- `[d` / `]d` : 前/次の診断へジャンプ
- `[e` / `]e` : 前/次のエラーへジャンプ
- `<leader>e` : カーソル位置のエラーをフロートで表示
- `Ctrl+k` : シグネチャヘルプ（insertモード）

### テスト実行（neotest）
- `<leader>tr` : 最寄りのテスト実行
- `<leader>tf` : 現在のファイルのテスト実行
- `<leader>ta` : 全テスト実行
- `<leader>to` : テスト結果を開く
- `<leader>ts` : テストサマリー表示/非表示
- `<leader>tp` : 現在のNxプロジェクトのテスト実行
- `<leader>tw` : ウォッチモードでテスト実行

### Git操作
- `,s` : DiffviewOpen（差分表示）
- `,a` : DiffviewClose（差分を閉じる）
- `<leader>gb` : Git blame
- `<leader>go` : GitリポジトリをブラウザでOpen

### モーション
- `w,e,b,ge` : smartword対応（CamelCase考慮）
- `f` / `F` : eft（前方/後方へ文字検索）
- `ff` : jumpcursor（ジャンプ）

### Claude Code
- `<leader>cc` : Claude Codeを開く/閉じる
- `<leader>cf` : Claude Codeにフォーカス
- `<leader>cs` : 選択範囲をClaude Codeに送信（visual mode）
- `<leader>cb` : 現在のファイルをClaude Codeに追加

## WezTerm

### 基本設定
- Leader: `Ctrl+t`

### コピー/ペースト
- `Leader + [` : コピーモードに入る
- `y` : コピー（コピーモード中）
- `Leader + v` : ペースト
- マウスドラッグ選択でもクリップボードにコピー

### タブ操作
- `Leader + c` : 新しいタブ
- `Leader + q` : タブを閉じる
- `Leader + p` : 前のタブ
- `Leader + n` : 次のタブ
- `Shift+←,→` : タブ切り替え

### ペイン操作
- `Leader + |` : 縦分割
- `Leader + -` : 横分割
- `Leader + h,j,k,l` : ペイン移動
- `Leader + H,J,K,L` : ペインリサイズ（5単位）
- `Leader + x` : ペインを閉じる

### その他
- `Ctrl+Shift+o` : 透明度トグル（ブラウザ見ながら作業用）
- `Ctrl+h,j,k,l` : Neovimウィンドウ移動（Claude Code対応）

## AeroSpace（ウィンドウマネージャ）

### フォーカス/移動
- `Alt + h,j,k,l` : ウィンドウフォーカス移動
- `Alt + Shift + h,j,k,l` : ウィンドウ移動

### ワークスペース
- `Alt + 1-9` : ワークスペース切り替え
- `Alt + a-z` : ワークスペース切り替え（アルファベット）
- `Alt + Shift + 1-9` : ウィンドウをワークスペースに移動
- `Alt + Shift + a-z` : ウィンドウをワークスペースに移動
- `Alt + Tab` : 前のワークスペースに戻る
- `Alt + Shift + Tab` : ワークスペースを次のモニターに移動

### レイアウト
- `Alt + /` : タイル/アコーディオンレイアウト切り替え
- `Alt + ,` : アコーディオンレイアウト
- `Alt + -` : リサイズ（縮小）
- `Alt + =` : リサイズ（拡大）

### サービスモード（`Alt + Shift + ;` で入る）
- `Esc` : 設定リロードして終了
- `r` : レイアウトリセット
- `f` : フローティング/タイリング切り替え
- `Backspace` : 他のウィンドウを全て閉じる

## 共通操作

### macOS クリップボード
- WezTerm/tmuxのコピーモードでコピーした内容は、macOSのクリップボードにも保存される
- `Cmd+V` で他のアプリケーションにペースト可能
