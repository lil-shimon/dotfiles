vim.g.mapleader = ' '
local keymap = vim.keymap
local opts = { noremap = true, silent = true}

-- Save and Quit
keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', '<c-a>', 'ggVG')

keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

keymap.set('n', "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Insert/Terminal to Normal
keymap.set('i', 'jj', '<esc>')
keymap.set('t', 'jj', '<C-\\><C-n>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Next tab
keymap.set('n', 'tn', ':tabnext<Return>', { silent = true })
-- Previous tab
keymap.set('n', 'tp', ':tabprevious<Return>', { silent = true })
-- Close tab
keymap.set('n', 'tq', ':tabclose<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', ' j', '<C-w>j')
keymap.set('', ' h', '<C-w>h')
keymap.set('', ' l', '<C-w>l')
-- Ctrl+h/j/k/l: ウィンドウ移動（Claude Code対応）
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all ( just in case )
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Oil ( file tree plugin ) keymap settings
keymap.set("n", "<c-e>", "<CMD>Oil<CR>", { desc = "Oil current buffer's directory"})
keymap.set("n", "<c-f>", function()
  require("oil").open(".")
end, { desc = "Oil ." })

-- Barbar (tab plugin) keymap settings
keymap.set('n', 'ap', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', 'an', '<Cmd>BufferNext<CR>', opts)
keymap.set('n', 'Ap', '<Cmd>BufferPin<CR>', opts)
keymap.set('n', 'bd', '<Cmd>BufferClose<CR>', opts)

-- diffview (git diff view) keymap settings
keymap.set('n', ',s', "<cmd>DiffviewOpen HEAD~1<CR>")
