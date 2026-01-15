local opt = vim.opt
local bufferOpt = vim.bo
local windowOpt = vim.wo

opt.number = true
opt.relativenumber = true
windowOpt.number = true

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

-- マウス有効
opt.mouse = 'a'
opt.clipboard:append('unnamedplus')

opt.title = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.ignorecase = true
opt.smartcase = true

--スワップファイルを生成しない
opt.swapfile = false
opt.autoread = true
bufferOpt.autoread = true

-- 外部でファイルが変更された場合に自動で再読み込み
-- FocusGained: ターミナル/ウィンドウにフォーカスが戻った時
-- BufEnter: バッファに入った時（ファイル切り替えなど）
-- CursorHold: カーソルが一定時間（updatetime）動かなかった時
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime",
})

-- バックアップファイルを生成しない
opt.backup = false

-- あまりよくわからない設定
-- 全角文字を半角文字として扱う
-- Vimだと'double'がよい
opt.ambiwidth = 'single'

-- 行数表示の横に余白を追加
opt.signcolumn = 'yes'
opt.list = true

opt.cursorline = true
opt.termguicolors = true

opt.updatetime = 300
opt.timeoutlen = 500

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- 端までコードが届いたら折り返す
opt.wrap = true

opt.helplang = 'ja'

-- フロートウィンドウなどを若干透明に
opt.winblend = 5

-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
windowOpt.foldlevel = 99
