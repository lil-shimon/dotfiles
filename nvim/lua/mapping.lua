-- vimコマンドを実行するため e.g.cmd('pwd')
local cmd = vim.cmd

cmd 'nnoremap <C-p> <cmd>Telescope find_files<CR>'
