vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()


	-- LSP client
	use 'neovim/nvim-lspconfig'

	-- LSP client installer
	use 'williamboman/nvim-lsp-installer'

	-- jjでescしてくれるプラグイン
	use {
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup{
				mapping = {"jj"},
				keys = "<ESC>",
			}
		end,
	}
  
end)
