local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

-- Lspsaga config
--
-- Keymap
--
-- Normal Mode
-- C-j to diagnostic jump next
-- K to hover doc
-- gd to lsp finder
-- gd to peek definition (like whole component definition)
-- Shift K to prefview definition
-- gr to rename
-- C-K to rename
--
-- Insert Mode
-- C-k to signature help (i.e. this works when you type useRef, then search how to use useRef)
--
-- Other
-- when open lsp finder and wanna jump to place where code
-- type o is working
saga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', ' k', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
