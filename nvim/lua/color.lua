-- Ubuntu setup (aubergine + Tango パレット)
require('mini.base16').setup({
  palette = {
    base00 = '#300a24', base01 = '#3e1133', base02 = '#5e2750', base03 = '#888a85',
    base04 = '#babdb6', base05 = '#eeeeec', base06 = '#d3d7cf', base07 = '#ffffff',
    base08 = '#ef2929', base09 = '#e95420', base0A = '#fce94f', base0B = '#8ae234',
    base0C = '#34e2e2', base0D = '#729fcf', base0E = '#ad7fa8', base0F = '#cc0000',
  },
})

-- Diff highlights（diffview用）
vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewDiffBufWinEnter',
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'DiffviewDiffAdd',    { bg = '#3c4a3e' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = '#4c3743' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffChange', { bg = '#3d4841' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffText',   { bg = '#4a5a40' })
    end, 100)
  end,
})
