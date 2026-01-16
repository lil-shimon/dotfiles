local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")

-- Telescope keymaps
keymap("n", "<leader>f", function()
	builtin.find_files({ no_ignore = false, hidden = true })
end, opts)
keymap("n", "<leader>r", builtin.live_grep, opts)
keymap("n", "<leader>d", builtin.diagnostics, opts)
keymap("n", "<leader>b", builtin.buffers, opts)

function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

local actions = require("telescope.actions")

require("nvim-web-devicons").setup({
	override = {},
	default = true,
})

require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true,
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_ignore_patterns = {
			"node_modules",
			"yarn.lock",
			"%.git/",
			"dist",
			"build",
			".next",
			"coverage",
			"__screenshots__",
		},
		dynamic_preview_title = true,
		path_display = { "smart" },
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	layout_config = {
		horizontal = {
			preview_cutoff = 100,
			preview_width = 0.6,
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw add use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")

-- file_browser keymap (extensions読み込み後に設定)
keymap("n", "<leader><leader>", function()
	require("telescope").extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_git_ignore = true,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end, opts)
