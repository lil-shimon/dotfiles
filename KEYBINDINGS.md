# キーバインド一覧

## Tmux

### 基本設定
- Prefix: `Ctrl+t`

### ペイン操作
- `Prefix + |` : 縦分割
- `Prefix + -` : 横分割
- `Ctrl+h,j,k,l` : ペイン移動（prefix不要）
- `Prefix + H,J,K,L` : ペインリサイズ（5単位）
- `Prefix + m` : ペイン最大化/復元
- `Prefix + x` : ペインを閉じる
- `Prefix + Tab` : 最後のペインに移動

### ウィンドウ操作
- `Prefix + c` : 新しいウィンドウ
- `Shift+←,→` : ウィンドウ切り替え（prefix不要）
- `Prefix + Space` : 最後のウィンドウに移動
- `Prefix + &` : ウィンドウを閉じる

### コピーモード
- `Prefix + [` : コピーモードに入る
- `v` : 選択開始
- `V` : 行選択
- `Ctrl+v` : 矩形選択
- `y` : コピー（macOSクリップボードにも保存）
- `Y` : 行コピー（macOSクリップボードにも保存）
- `Prefix + Ctrl+p` : ペースト

### セッション管理
- `Prefix + s` : セッション一覧
- `Prefix + S` : 新しいセッション

### その他
- `Prefix + r` : 設定リロード

## Neovim

### バッファ操作（barbar.nvim）
- `ap` : 前のバッファ
- `an` : 次のバッファ
- `bd` : バッファを閉じる
- `Ap` : バッファをピン留め

### テスト実行（neotest）
- `<leader>tr` : 最寄りのテスト実行
- `<leader>tf` : 現在のファイルのテスト実行
- `<leader>ta` : 全テスト実行
- `<leader>to` : テスト結果を開く
- `<leader>ts` : テストサマリー表示/非表示
- `<leader>tp` : 現在のプロジェクトのテスト実行
- `<leader>tw` : ウォッチモードでテスト実行

### LSP操作
- `gd` : 定義へジャンプ
- `gr` : 参照を表示
- `K` : ホバー情報
- `<leader>rn` : リネーム
- `<leader>ca` : コードアクション

### ファイル操作
- `<leader>ff` : ファイル検索（Telescope）
- `<leader>fg` : 文字列検索（Telescope）
- `<leader>fb` : バッファ検索（Telescope）

### Git操作
- `<leader>gs` : Git status
- `<leader>gc` : Git commit
- `<leader>gp` : Git push

## 共通操作

### macOS クリップボード
- tmuxのコピーモードで `y` または `Y` でコピーした内容は、macOSのクリップボードにも保存される
- `Cmd+V` で他のアプリケーションにペースト可能