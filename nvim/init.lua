--- load plugins
require'plugins'

--- 自動コンパイル設定
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
