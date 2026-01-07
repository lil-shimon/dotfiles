local keymap = vim.keymap.set
local builtin = require('telescope.builtin')
keymap('n', '<leader>f', builtin.find_files, {})
keymap('n', '<leader>g', builtin.live_grep, {})

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

local actions = require('telescope.actions')

require('nvim-web-devicons').setup({
  override = {},
  default = true
})

require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    }
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    file_ignore_patterns = { "node_modules", "yarn.lock", "%.git/", "dist", "build", ".next", "coverage", "__screenshots__" },
    dynamic_preview_title = true,
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      },
    }
  }
}


require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', ' f', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>',
  opts)
vim.keymap.set('n', ' r', '<cmd>lua require("telescope.builtin").live_grep()<cr>',
  opts)
vim.keymap.set('n', ' d', '<cmd>lua require("telescope.builtin").diagnostics()<cr>',
  opts)
vim.keymap.set('n', '  ',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cmd = telescope_buffer_dir(), respect_git_ignore = true, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 } } )<cr>'
  ,
  opts)
