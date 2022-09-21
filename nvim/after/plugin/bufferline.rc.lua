local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

-- BufferLine config
--
-- color: Solarized
--
-- Keymaps
--
-- Normal Mode
-- Tab to next buffer
-- S-Tab to prev buffer
-- te to create buffer
bufferline.setup {
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icon = false,
    show_close_icon = false,
    color_icons = true
  },
  -- Solarized colors
  highlights = {
    separator = {
      fg = "#073642",
      bg = "#002b36"
    },
    separator_selected = {
      fg = "#073642",
    },
    background = {
      fg = "#657b83",
      bg = "#002b36"
    },
    buffer_selected = {
      fg = "#fdf6e3",
      _ = 'bold'
    },
    fill = {
      bg = '#073642'
    }
  }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
