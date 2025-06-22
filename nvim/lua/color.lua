---@type fluoromachine
local fm = require 'fluoromachine'

-- function overrides(c,color)
--     local darken = color.darken
--     local lighten = color.lighten
--     local blend = color.blend
--     local shade = color.shade
--     local tint = color.tint
--     return {
--      TelescopeResultsBorder = { fg = c.bgdark, bg = c.bgdark },
--      TelescopeResultsNormal = { bg = c.bgdark },
--      TelescopePreviewNormal = { bg = c.bg },
--      TelescopePromptBorder = { fg = c.bgdark, bg = c.bgdark },
--      TelescopeTitle = { fg = c.red, bg = shade(c.red,5) },
--      TelescopePromptPrefix = { fg = c.purple },
--     }
-- end

-- https://github.com/maxmx03/fluoromachine.nvim
fm.setup {
  glow = true,
  transparent = false,
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

vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine',
  },
  {
    name = 'DiagnosticSignWarn',
    text = '',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarningLine',
  },
  {
    name = 'DiagnosticSignInfo',
    text = '',
    texthl = 'DiagnosticSignInfo',
    linehl = 'InfoLine',
  },
  {
    name = 'DiagnosticSignHint',
    text = '',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine',
  },
})
