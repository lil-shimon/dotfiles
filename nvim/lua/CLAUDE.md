# lua/ ディレクトリの構成

`base.lua`
Neovimの基本設定（オプション、エンコーディング等）

`color.lua`
カラースキーム関連の設定

`maps.lua`
キーマップの設定

`text.lua`
テキスト処理関連の設定

`log-sync.lua`
log リポジトリの日記を保存したときに `log-daily-sync`（nix/home.nix で定義）で commit・push する設定

`p-*.lua`
各プラグインの設定ファイル（例: `p-lsp.lua`, `p-telescope.lua`）

