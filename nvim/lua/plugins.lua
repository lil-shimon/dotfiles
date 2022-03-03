vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()

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
