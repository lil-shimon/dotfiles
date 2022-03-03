local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	rainbow = {
		enable = true,
		disable = {'bash'},
	},
	incremental_selection = {
		enable = true,
		disable = {},
		keymaps = {},
	},
	refactor = {
		highlight_defintions = {
			enable = true,
		},
		smart_rename = {
			enable = false,
		},
		navigation = {
			enable = false,
		}
	},
	textobjects = {
		enable = true,
		disable = {},
		keymaps = {}
	},
	ensure_installed = 'all'
}
