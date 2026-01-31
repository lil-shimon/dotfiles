-- bufferline.nvim設定
-- シンプルな透過スタイル + 文字色で区別

-- Tokyo Nightカラーパレット
local colors = {
  active = "#bb9af7",     -- Tokyo Night紫（アクティブタブ）
  inactive = "#565f89",   -- 暗めの文字色（非アクティブタブ）
  separator = "#3b4261",  -- セパレーター色
}

require("bufferline").setup({
  options = {
    mode = "buffers",

    -- シンプルなセパレーター
    separator_style = "thin",

    -- タブ番号表示
    numbers = "ordinal",

    -- 閉じるボタン完全非表示
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    show_buffer_close_buttons = false,
    show_close_icon = false,
    close_icon = "",
    buffer_close_icon = "",

    -- アイコン表示
    show_buffer_icons = true,

    -- バッファ1つの時は非表示
    always_show_bufferline = false,

    -- サイドバーオフセット
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center", separator = true },
      { filetype = "neo-tree", text = "File Explorer", text_align = "center", separator = true },
      { filetype = "oil", text = "Oil", text_align = "center", separator = true },
    },

    diagnostics = false,

    max_name_length = 30,
    max_prefix_length = 15,
    truncate_names = true,

    modified_icon = "●",

    indicator = {
      icon = "▎",
      style = "icon",
    },
  },

  -- ハイライト: 全て透過背景、文字色のみで区別
  highlights = {
    fill = { bg = "NONE" },

    background = { fg = colors.inactive, bg = "NONE" },
    buffer_visible = { fg = colors.inactive, bg = "NONE" },
    buffer_selected = { fg = colors.active, bg = "NONE", bold = true },

    close_button = { fg = colors.inactive, bg = "NONE" },
    close_button_visible = { fg = colors.inactive, bg = "NONE" },
    close_button_selected = { fg = colors.active, bg = "NONE" },

    numbers = { fg = colors.inactive, bg = "NONE" },
    numbers_visible = { fg = colors.inactive, bg = "NONE" },
    numbers_selected = { fg = colors.active, bg = "NONE", bold = true },

    modified = { fg = colors.inactive, bg = "NONE" },
    modified_visible = { fg = colors.inactive, bg = "NONE" },
    modified_selected = { fg = colors.active, bg = "NONE" },

    duplicate = { fg = colors.inactive, bg = "NONE", italic = true },
    duplicate_visible = { fg = colors.inactive, bg = "NONE", italic = true },
    duplicate_selected = { fg = colors.active, bg = "NONE", italic = true },

    separator = { fg = colors.separator, bg = "NONE" },
    separator_visible = { fg = colors.separator, bg = "NONE" },
    separator_selected = { fg = colors.separator, bg = "NONE" },

    indicator_visible = { fg = colors.inactive, bg = "NONE" },
    indicator_selected = { fg = colors.active, bg = "NONE" },

    pick = { fg = "#ff0000", bg = "NONE", bold = true },
    pick_visible = { fg = "#ff0000", bg = "NONE", bold = true },
    pick_selected = { fg = "#ff0000", bg = "NONE", bold = true },

    tab = { fg = colors.inactive, bg = "NONE" },
    tab_selected = { fg = colors.active, bg = "NONE", bold = true },
    tab_separator = { fg = colors.separator, bg = "NONE" },
    tab_separator_selected = { fg = colors.separator, bg = "NONE" },
    tab_close = { fg = colors.inactive, bg = "NONE" },

    trunc_marker = { fg = colors.inactive, bg = "NONE" },
    offset_separator = { fg = colors.separator, bg = "NONE" },
  },
})
