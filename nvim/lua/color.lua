-- GitHub Dark
require('github-theme').setup({})
vim.cmd('colorscheme github_dark')

-- Diff highlights（diffview用）
vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewDiffBufWinEnter',
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, 'DiffviewDiffAdd',    { bg = '#12261e' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { bg = '#25171c' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffChange', { bg = '#152238' })
      vim.api.nvim_set_hl(0, 'DiffviewDiffText',   { bg = '#1d572d' })
    end, 100)
  end,
})
