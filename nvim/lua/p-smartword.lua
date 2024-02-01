local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', 'w', '<Plug>(smartword-w)', opts)
keymap('n', 'e', '<Plug>(smartword-e)', opts)
keymap('n', 'b', '<Plug>(smartword-b)', opts)
keymap('n', 'ge', '<Plug>(smartword-ge)', opts)
