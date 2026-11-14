vim.keymap.set({ 'n', 'x', 'o' }, "H", '^')
vim.keymap.set({ 'n', 'x', 'o' }, "L", '$')

-- lsp config
vim.lsp.config['intelephense'] = {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { 'composer.json', '.git' },
}

-- lsp enable
vim.lsp.enable('intelephense')
