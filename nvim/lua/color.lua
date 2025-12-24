---@type fluoromachine
local fm = require 'fluoromachine'

-- https://github.com/maxmx03/fluoromachine.nvim
fm.setup {
  glow = true,
  transparent = true,
  overrides = {
       ['@type'] = { italic = true, bold = false },
       ['@function'] = { italic = false, bold = false },
       ['@comment'] = { italic = true },
       ['@keyword'] = { italic = false },
       ['@constant'] = { italic = false, bold = true },
       ['@variable'] = { italic = true },
       ['@field'] = { italic = true },
       ['@parameter'] = { italic = true },
  }
  -- overrides = overrides
}

vim.cmd.colorscheme('ayu-mirage')

-- sign_defineはp-diagnostic.luaに移動（新しいAPI使用）
