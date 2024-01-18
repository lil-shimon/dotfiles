local opt = vim.opt
local bufferOpt = vim.bo
local windowOpt = vim.wo

opt.number = true
opt.relativenumber = false
windowOpt.number = true

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

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
