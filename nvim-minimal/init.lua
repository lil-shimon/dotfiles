-- leader config
vim.g.mapleader = " "

-- keymap config
local map = vim.keymap
map.set({ 'n', 'x', 'o' }, "H", '^')
map.set({ 'n', 'x', 'o' }, "L", '$')
map.set('n', "sv", ":vsplit<cr>")
map.set('i', 'jj', "<esc>")

-- restart nvim
map.set('n', "<leader>r", ":restart<cr>")

map.set('n', "<leader>w", ":w<cr>")
map.set('n', "<leader>q", ":q<cr>")

-- lsp config
vim.lsp.config['intelephense'] = {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
}

-- lsp enable
vim.lsp.enable('intelephense')

--netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
