-- telescope.luaのファイル名にするとloop or previous error loading module 'telescope'
-- -> _telescopeにしている

local telescope = require('telescope')

-- setup
telescope.setup {
	defaults = {
		prompt_position = 'bottom',
		file_ignore_patterns = { 'build.*/.*' },
	}
}

-- key bind
local map_telescope = function(keymap, picker, config)
  config = config or {} -- set default options to be a table if the user gives none
  local config_string = ''

  local opts = { noremap = true, silent = true }

  for k,v in pairs(config) do config_string = config_string .. string.format('%s = %q, ', k, v) end
  local right_hand_side = string.format(":lua require('telescope.builtin').%s{%s}<cr>", picker, config_string)
  vim.api.nvim_set_keymap('n', keymap, right_hand_side, opts)
end

-- telescope builtins mappings
local rowselect_opts = { selection_strategy = 'row', hidden = true }

map_telescope('<leader>d', "file_browser", rowselect_opts)
map_telescope('<C-f>', "find_files", {hidden = true})
map_telescope('<leader>f', "find_files", {hidden = true})
map_telescope('<leader>l', "live_grep")
