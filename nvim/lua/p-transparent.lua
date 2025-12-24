-- 背景透過設定
-- https://github.com/xiyaowong/transparent.nvim
require("transparent").setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'NormalFloat', 'FloatBorder',
  },
  extra_groups = {
    -- NvimTree
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    -- Telescope
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",
    -- Floating windows
    "NormalFloat",
    "FloatBorder",
    "Pmenu",
    "PmenuSel",
    "PmenuSbar",
    -- Noice
    "NoicePopup",
    "NoicePopupBorder",
    "NoiceCmdlinePopup",
    "NoiceCmdlinePopupBorder",
  },
})
