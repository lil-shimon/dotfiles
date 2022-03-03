vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()


	-- LSP client
	use 'neovim/nvim-lspconfig'

	-- LSP client installer
	use 'williamboman/nvim-lsp-installer'

	-- LSP 補完プラグイン
	use 'hrsh7th/nvim-cmp'
	use "hrsh7th/cmp-nvim-lsp"

	-- command line 補完プラグイン
	use 'hrsh7th/cmp-buffer'

	use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

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

    	use {'nvim-treesitter/nvim-treesitter', after='nvim-ts-rainbow', config='require"treesitter"'}
end)
