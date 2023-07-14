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
--
-- old (before break change)
-- saga.init_lsp_saga {
--   server_filetype_map = {}
-- }

saga.setup {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
keymap('n', ' k', '<Cmd>Lspsaga lsp_finder<cr>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
keymap('n', '<C-k>', '<Cmd>Lspsaga rename<cr>', opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
