--- load plugins
require'plugins'
require'lsconfig'
require'nullls'

--- 自動コンパイル設定
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
