-- bufferline.nvim設定
-- WeztermのタブバーデザインをNeovimで再現
-- 参照: wezterm/.wezterm.lua のformat-tab-titleセクション

-- Tokyo Nightカラーパレット（Weztermから抽出）
local colors = {
  -- アクティブタブ
  active_bg = "#bb9af7",    -- Tokyo Night紫
  active_fg = "#16161e",    -- 暗い背景色
  -- 非アクティブタブ
  inactive_bg = "#3b4261",  -- 暗い背景色
  inactive_fg = "#a9b1d6",  -- Tokyo Night前景色
}

require("bufferline").setup({
  options = {
    -- モード: buffers（バッファ管理）
    mode = "buffers",

    -- スタイル: slantでカプセル形状に近づける
    style_preset = require("bufferline").style_preset.default,
    separator_style = "slant",

    -- タブ番号表示（ordinal: 1, 2, 3...）
    numbers = "ordinal",

    -- 閉じるボタン非表示
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    show_buffer_close_buttons = false,
    show_close_icon = false,

    -- アイコン表示（devicons連携）
    show_buffer_icons = true,
    show_buffer_default_icon = true,

    -- バッファ1つの時は非表示
    always_show_bufferline = false,

    -- サイドバーオフセット（oil, NvimTree対応）
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
      {
        filetype = "oil",
        text = "Oil",
        text_align = "center",
        separator = true,
      },
    },

    -- 診断情報非表示
    diagnostics = false,

    -- カスタムフィルター
    custom_filter = function(buf_number)
      -- 特定のファイルタイプを除外
      local ft = vim.bo[buf_number].filetype
      if ft == "qf" or ft == "fugitive" then
        return false
      end
      return true
    end,

    -- タブ名の最大長
    max_name_length = 30,
    max_prefix_length = 15,
    truncate_names = true,

    -- タブページ表示
    show_tab_indicators = true,

    -- 変更インジケータ
    modified_icon = "",

    -- インジケータアイコン
    indicator = {
      icon = "",
      style = "none",
    },

    -- バッファ名にパスを含めない
    name_formatter = function(buf)
      return buf.name
    end,
  },

  -- ハイライト設定（Tokyo Night配色）
  highlights = {
    -- 全体背景（透過）
    fill = {
      bg = "NONE",
    },

    -- 背景（タブ間のスペース）
    background = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },

    -- 非アクティブタブ
    buffer_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    buffer_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
      bold = true,
      italic = false,
    },

    -- 閉じるボタン（非表示だが念のため）
    close_button = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    close_button_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    close_button_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- タブ番号
    numbers = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    numbers_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    numbers_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
      bold = true,
      italic = false,
    },

    -- 診断（非表示だが念のため）
    diagnostic = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    diagnostic_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    diagnostic_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- ヒント
    hint = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    hint_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    hint_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- 情報
    info = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    info_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    info_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- 警告
    warning = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    warning_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    warning_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- エラー
    error = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    error_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    error_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- 変更マーク
    modified = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    modified_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    modified_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
    },

    -- 複製マーク
    duplicate = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
      italic = true,
    },
    duplicate_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
      italic = true,
    },
    duplicate_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
      italic = true,
    },

    -- セパレーター（slantスタイル用）
    separator = {
      fg = "NONE",
      bg = colors.inactive_bg,
    },
    separator_visible = {
      fg = "NONE",
      bg = colors.inactive_bg,
    },
    separator_selected = {
      fg = "NONE",
      bg = colors.active_bg,
    },

    -- インジケーター
    indicator_visible = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    indicator_selected = {
      fg = colors.active_bg,
      bg = colors.active_bg,
    },

    -- ピック（バッファ選択モード）
    pick = {
      fg = "#ff0000",
      bg = colors.inactive_bg,
      bold = true,
    },
    pick_visible = {
      fg = "#ff0000",
      bg = colors.inactive_bg,
      bold = true,
    },
    pick_selected = {
      fg = "#ff0000",
      bg = colors.active_bg,
      bold = true,
    },

    -- オフセット（サイドバー）
    offset_separator = {
      fg = colors.inactive_fg,
      bg = "NONE",
    },

    -- タブページ
    tab = {
      fg = colors.inactive_fg,
      bg = colors.inactive_bg,
    },
    tab_selected = {
      fg = colors.active_fg,
      bg = colors.active_bg,
      bold = true,
    },
    tab_separator = {
      fg = "NONE",
      bg = colors.inactive_bg,
    },
    tab_separator_selected = {
      fg = "NONE",
      bg = colors.active_bg,
    },
    tab_close = {
      fg = colors.inactive_fg,
      bg = "NONE",
    },

    -- トランケーション（...）
    trunc_marker = {
      fg = colors.inactive_fg,
      bg = "NONE",
    },
  },
})
