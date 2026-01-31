vim.g.mapleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save and Quit
keymap("n", "<leader>q", "<cmd>q<cr>")
keymap("n", "<leader>w", "<cmd>w<cr>")
keymap("n", "<leader>x", "<cmd>x<cr>")

keymap("n", "H", "^")
keymap("n", "L", "$")

keymap("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Insert/Terminal to Normal
keymap("i", "jj", "<esc>")
keymap("t", "jj", "<C-\\><C-n>")

-- New tab
keymap("n", "te", ":tabedit<Return>", { silent = true })
-- Next tab
keymap("n", "tn", ":tabnext<Return>", { silent = true })
-- Previous tab
keymap("n", "tp", ":tabprevious<Return>", { silent = true })
-- Close tab
keymap("n", "tq", ":tabclose<Return>", { silent = true })

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move window
keymap("", "sh", "<C-w>h")
keymap("", "sk", "<C-w>k")
keymap("", "sj", "<C-w>j")
keymap("", "sl", "<C-w>l")
keymap("", " j", "<C-w>j")
keymap("", " k", "<C-w>k")
keymap("", " h", "<C-w>h")
keymap("", " l", "<C-w>l")
-- Ctrl+h/j/k/l: ウィンドウ移動（Claude Code対応）
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Select all ( just in case )
keymap("n", "<C-a>", "gg<S-v>G")

-- Do not yank with x
keymap("n", "x", '"_x')

-- Oil ( file tree plugin ) keymaptings
keymap("n", "<c-e>", "<CMD>Oil<CR>", { desc = "Oil current buffer's directory" })
keymap("n", "<c-f>", function()
	require("oil").open(".")
end, { desc = "Oil ." })

-- Bufferline (tab plugin) keymaptings
keymap("n", "ap", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "an", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "Ap", "<Cmd>BufferLineTogglePin<CR>", opts)
keymap("n", "bd", "<Cmd>bdelete<CR>", opts)

-- diffview (git diff view) keymaptings
keymap("n", ",s", "<cmd>DiffviewOpen<CR>")
keymap("n", ",a", "<cmd>DiffviewClose<CR>")

-- diagnostic keymaptings
keymap("n", "<leader>e", vim.diagnostic.open_float, opts) -- カーソル位置のエラーをフロートで表示
keymap("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts) -- エラーのみジャンプ
keymap("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts) -- エラーのみジャンプ

-- jump cursor
keymap("n", "ff", "<Plug>(jumpcursor-jump)", opts)

-- eft
-- move to forward
keymap("n", "f", "<Plug>(eft-f)")
keymap("x", "f", "<Plug>(eft-f)")
keymap("o", "f", "<Plug>(eft-f)")

-- move to backward
keymap("n", "F", "<Plug>(eft-F)")
keymap("o", "F", "<Plug>(eft-F)")
keymap("x", "F", "<Plug>(eft-F)")

-- Lspsaga
-- hover_doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- エラーを表示
-- TODO: エラーになるので、確認する
-- コマンド直打ちでは機能している
keymap("n", "D", "<cmd>Lspsaga show_line_diagnostic<CR>", opts)
keymap("i", "<C-k>", "<Cmd>Lspsaga signature_help<cr>", opts)

-- コードアクション
keymap("n", "V", "<cmd>Lspsaga code_action<CR>", opts)

keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
keymap("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
keymap("n", "pd", "<cmd>Lspsaga peek_definition<CR>", opts)

keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

keymap("n", "<C-r>", "<cmd>Lspsaga rename<CR>", opts)

keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

-- Neotest
-- Neotestのキーマップは`p-neotest.lua`

-- Gitのkeymapは`p-git.lua`

-- smartword keymaps
keymap("n", "w", "<Plug>(smartword-w)", opts)
keymap("n", "e", "<Plug>(smartword-e)", opts)
keymap("n", "b", "<Plug>(smartword-b)", opts)
keymap("n", "ge", "<Plug>(smartword-ge)", opts)

-- ファイルパスをコピー（Claude Code用）
keymap("n", "<leader>yc", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", "@" .. path)
	print("Copied: @" .. path)
end, { desc = "Copy @filepath for Claude" })

-- カーソル下のファイルパスをQuick Lookでプレビュー (macOS)
keymap("n", "<leader>ip", function()
	local path = vim.fn.expand("<cfile>")
	-- エスケープされたスペースを処理
	path = path:gsub("\\%s", " ")
	-- ~をホームディレクトリに展開
	path = path:gsub("^~", vim.fn.expand("$HOME"))
	if vim.fn.filereadable(path) == 1 then
		vim.fn.jobstart({ "qlmanage", "-p", path }, { detach = true })
	else
		vim.notify("File not found: " .. path, vim.log.levels.WARN)
	end
end, { desc = "Preview file with Quick Look" })
