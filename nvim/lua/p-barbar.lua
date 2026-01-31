-- barbar.nvim設定
-- WeztermのタブバーデザインをNeovimで再現
-- 参照: wezterm/.wezterm.lua のformat-tab-titleセクション

-- Nerd Font半円グリフ（Weztermと同じ）
local LEFT_CIRCLE = ""  -- ple_left_half_circle_thick
local RIGHT_CIRCLE = "" -- ple_right_half_circle_thick

-- Tokyo Nightカラーパレット（Weztermから抽出）
local colors = {
  -- アクティブタブ
  active_bg = "#bb9af7",    -- Tokyo Night紫
  active_fg = "#16161e",    -- 暗い背景色
  -- 非アクティブタブ
  inactive_bg = "#3b4261",  -- 暗い背景色
  inactive_fg = "#a9b1d6",  -- Tokyo Night前景色
  -- タブ番号背景（非アクティブ時）
  index_bg = "#5c6d74",
  index_fg = "#ffffff",
}

-- ハイライトグループの設定
local function setup_highlights()
  local hl = vim.api.nvim_set_hl

  -- 透過背景（none）
  hl(0, "BufferTabpageFill", { bg = "NONE" })

  -- アクティブタブ
  hl(0, "BufferCurrent", { fg = colors.active_fg, bg = colors.active_bg, bold = true })
  hl(0, "BufferCurrentIndex", { fg = colors.active_fg, bg = colors.active_bg, bold = true })
  hl(0, "BufferCurrentMod", { fg = colors.active_fg, bg = colors.active_bg, bold = true })
  hl(0, "BufferCurrentSign", { fg = colors.active_bg, bg = "NONE" })
  hl(0, "BufferCurrentSignRight", { fg = colors.active_bg, bg = "NONE" })
  hl(0, "BufferCurrentIcon", { fg = colors.active_fg, bg = colors.active_bg })
  hl(0, "BufferCurrentTarget", { fg = colors.active_fg, bg = colors.active_bg, bold = true })

  -- 非アクティブタブ
  hl(0, "BufferInactive", { fg = colors.inactive_fg, bg = colors.inactive_bg })
  hl(0, "BufferInactiveIndex", { fg = colors.index_fg, bg = colors.index_bg })
  hl(0, "BufferInactiveMod", { fg = colors.inactive_fg, bg = colors.inactive_bg })
  hl(0, "BufferInactiveSign", { fg = colors.inactive_bg, bg = "NONE" })
  hl(0, "BufferInactiveSignRight", { fg = colors.inactive_bg, bg = "NONE" })
  hl(0, "BufferInactiveIcon", { fg = colors.inactive_fg, bg = colors.inactive_bg })
  hl(0, "BufferInactiveTarget", { fg = colors.inactive_fg, bg = colors.inactive_bg })

  -- 可視タブ（フォーカスされていないウィンドウのアクティブバッファ）
  hl(0, "BufferVisible", { fg = colors.inactive_fg, bg = colors.inactive_bg })
  hl(0, "BufferVisibleIndex", { fg = colors.index_fg, bg = colors.index_bg })
  hl(0, "BufferVisibleMod", { fg = colors.inactive_fg, bg = colors.inactive_bg })
  hl(0, "BufferVisibleSign", { fg = colors.inactive_bg, bg = "NONE" })
  hl(0, "BufferVisibleSignRight", { fg = colors.inactive_bg, bg = "NONE" })
  hl(0, "BufferVisibleIcon", { fg = colors.inactive_fg, bg = colors.inactive_bg })
  hl(0, "BufferVisibleTarget", { fg = colors.inactive_fg, bg = colors.inactive_bg })

  -- オフセット（ファイルツリー等）
  hl(0, "BufferOffset", { fg = colors.inactive_fg, bg = "NONE" })
end

-- barbar.nvim設定
require("barbar").setup({
  -- アニメーション有効
  animation = true,

  -- 自動非表示（バッファが1つの時は非表示）
  auto_hide = 1,

  -- tabpageインジケータ有効
  tabpages = true,

  -- クリック可能
  clickable = true,

  -- 閉じるボタン非表示
  icons = {
    buffer_index = true,  -- タブ番号表示
    buffer_number = false,
    button = "",          -- 閉じるボタン非表示（空文字）
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = false },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = false },
    },
    gitsigns = {
      added = { enabled = false },
      changed = { enabled = false },
      deleted = { enabled = false },
    },
    filetype = {
      enabled = true,     -- アイコン表示（devicons連携）
      custom_colors = false,
    },
    separator = { left = LEFT_CIRCLE, right = RIGHT_CIRCLE },
    separator_at_end = true,
    modified = { button = "" },  -- 変更インジケータの閉じるボタン非表示
    pinned = { button = "", filename = true },
    preset = "default",
    alternate = { filetype = { enabled = false } },
    current = { buffer_index = true },
    inactive = { button = "" },
    visible = { button = "" },
  },

  -- タブ番号を表示
  insert_at_end = false,
  insert_at_start = false,

  -- 最大パディング
  maximum_padding = 1,
  minimum_padding = 1,

  -- 最大長
  maximum_length = 30,

  -- セマンティックレター（ジャンプ用）
  semantic_letters = true,

  -- サイドオフセット（NvimTreeなど用）
  sidebar_filetypes = {
    NvimTree = true,
    ["neo-tree"] = { event = "BufWipeout" },
    oil = true,
  },

  -- ソート不要
  no_name_title = "[No Name]",
})

-- ハイライト設定適用
setup_highlights()

-- カラースキーム変更時にハイライトを再適用
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = setup_highlights,
})
