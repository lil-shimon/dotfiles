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

vim.cmd.colorscheme('fluoromachine')

-- Diff highlights（diffview用）
vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewDiffBufWinEnter',
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'DiffviewDiffAdd', { bg = '#2a5834' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = '#6b2c3a' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffChange', { bg = '#3a3a2d' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffText', { bg = '#5a5a3d' })
      print('Diff highlights applied')
    end, 100)
  end,
})

-- sign_defineはp-diagnostic.luaに移動（新しいAPI使用）
