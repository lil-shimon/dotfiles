local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.automatically_reload_config = true

-- UI
config.color_scheme = "Tokyo Night"

-- 通常テキストを暖色系に変更（目に優しい）
config.colors = {
  split = "#bb9af7",    -- Split pane border (Tokyo Night purple)
  cursor_bg = "#bb9af7", -- カーソル背景色（紫）
  cursor_fg = "#1a1b26", -- カーソル上の文字色
  tab_bar = {
    inactive_tab_edge = "none",
  },
}
config.default_cursor_style = "SteadyBlock"
config.inactive_pane_hsb = {
  saturation = 0.5, -- 非アクティブpaneの彩度を下げる
  brightness = 0.5, -- 非アクティブpaneをかなり暗く
}
config.font_size = 16
config.font = wezterm.font_with_fallback({
  {
    -- family = "MesloLGLDZ Nerd Font Mono",
    family = "JetBrains Mono",
    weight = "Bold",
  },
  {
    family = "UDEV Gothic NF",
    weight = "Bold",
  },
})
config.use_ime = true
config.line_height = 1.0

-- 背景を半透明 + ぼかし（macOS）
local opacity_normal = 0.75
local opacity_seethrough = 0.15 -- 透過モード（ブラウザが見えるレベル）
local opacity_opaque = 1.0
config.window_background_opacity = opacity_normal
config.macos_window_background_blur = 20

-- 透明度トグル用のイベント
local opacity_state = 0 -- 0:normal, 1:seethrough, 2:opaque
wezterm.on("toggle-opacity", function(window, pane)
  opacity_state = (opacity_state + 1) % 3
  local overrides = window:get_config_overrides() or {}
  if opacity_state == 0 then
    overrides.window_background_opacity = opacity_normal
    overrides.macos_window_background_blur = 20
  elseif opacity_state == 1 then
    overrides.window_background_opacity = opacity_seethrough
    overrides.macos_window_background_blur = 0
  else
    overrides.window_background_opacity = opacity_opaque
    overrides.macos_window_background_blur = 0
  end
  window:set_config_overrides(overrides)
end)

-- window padding
-- https://medium.com/@yusuke_h/%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E3%81%8C%E3%83%80%E3%82%B5%E3%81%84%E3%81%A8%E3%83%A2%E3%83%86%E3%81%AA%E3%81%84-wezterm%E7%B4%B9%E4%BB%8B%E7%B7%A8-11306091722a
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- title bar, tab 周りのUI設定
-- タイトルバーを非表示にする
config.window_decorations = "RESIZE"

-- tabが一つの時は非表示にする
config.hide_tab_bar_if_only_one_tab = true

-- タイトルバーの背景を透明にする
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
  font = wezterm.font_with_fallback({
    { family = "MesloLGLDZ Nerd Font Mono", weight = "Bold" },
    {
      family = "UDEV Gothic NF",
      weight = "Bold",
    },
  }),
  font_size = 14,
}

-- tabの新規作成ボタンを非表示にする
config.show_new_tab_button_in_tab_bar = false

-- Tokyo Night背景色でウィンドウにグラデーションをつける
config.window_background_gradient = {
  colors = {
    "#1a1b26", -- 中央（Tokyo Night背景色）
  },
}

-- tabの閉じるボタンを非表示にする
-- nightlyのみでサポート(2025/12/30時点)
config.show_close_tab_button_in_tabs = false

-- カプセル（ピル）形状のタブ用グリフ
local LEFT_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
local RIGHT_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

-- Tokyo Night カラーでカプセル形状タブをフォーマット
wezterm.on("format-tab-title", function(tab)
  local edge_background = "none"

  -- 左側セグメント（プロセス名）の色
  local left_bg = "#3b4261" -- 暗い背景色
  local left_fg = "#a9b1d6" -- Tokyo Night前景色

  -- 右側セグメント（タブ番号）の色
  local right_bg = "#5c6d74" -- 非アクティブ時
  local right_fg = "#ffffff"

  if tab.is_active then
    right_bg = "#bb9af7" -- アクティブタブ背景（Tokyo Night紫）
    right_fg = "#16161e" -- アクティブタブ前景（暗い背景色）
    left_fg = "#c0caf5" -- アクティブ時は少し明るく
  end

  -- タブタイトル（長すぎる場合は切り詰め、日本語対応）
  local max_title_length = 15
  local raw_title = tab.active_pane.title
  raw_title = wezterm.truncate_right(raw_title, max_title_length)
  local title = " " .. raw_title .. " "

  -- タブ番号
  local tab_number = " " .. tostring(tab.tab_index + 1) .. " "

  return {
    -- 左端の半円（カプセル左側）
    { Background = { Color = edge_background } },
    { Foreground = { Color = left_bg } },
    { Text = LEFT_CIRCLE },

    -- 左側セグメント（プロセス名）
    { Background = { Color = left_bg } },
    { Foreground = { Color = left_fg } },
    { Text = title },

    -- 右側セグメント（タブ番号）- 左側と直接つなげる
    { Background = { Color = right_bg } },
    { Foreground = { Color = right_fg } },
    { Text = tab_number },

    -- 右端の半円（カプセル右側）
    { Background = { Color = edge_background } },
    { Foreground = { Color = right_bg } },
    { Text = RIGHT_CIRCLE },
  }
end)

-- keybindings
local act = wezterm.action

-- Claude Code対応: Ctrl+\ → Ctrl+n → Ctrl+h/j/k/l を送信
-- https://zenn.dev/moneyforward/articles/cf771d9a51857d
local function send_key_with_esc(key)
  return act.Multiple({
    act.SendKey({ key = "\\", mods = "CTRL" }),
    act.SendKey({ key = "n", mods = "CTRL" }),
    act.SendKey({ key = key, mods = "CTRL" }),
  })
end

local keys = {
  -- 透明度トグル（ブラウザを見ながら作業）
  { key = "o", mods = "CTRL|SHIFT", action = act.EmitEvent("toggle-opacity") },
  -- Ctrl+h/j/k/l: Neovimウィンドウ移動（Claude Code対応）
  { key = "h", mods = "CTRL",       action = send_key_with_esc("h") },
  { key = "j", mods = "CTRL",       action = send_key_with_esc("j") },
  { key = "k", mods = "CTRL",       action = send_key_with_esc("k") },
  { key = "l", mods = "CTRL",       action = send_key_with_esc("l") },

  -- copy mode (tmux風: LEADER + [ でコピーモード、y でコピー)
  { key = "[", mods = "LEADER",     action = act.ActivateCopyMode },
  -- copy
  { key = "y", mods = "LEADER",     action = act.CopyTo("ClipboardAndPrimarySelection") },
  -- paste
  { key = "v", mods = "LEADER",     action = act.PasteFrom("Clipboard") },
  -- QuickSelect（URLやパスを素早くコピー）
  { key = "s", mods = "LEADER",     action = act.QuickSelect },

  -- Tab関連
  --
  -- 新しいタブを開く
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  -- 新しいウィンドウを開く
  {
    key = "N",
    mods = "LEADER",
    action = act.SpawnWindow,
  },
  {
    key = "q",
    mods = "LEADER",
    action = act.CloseCurrentTab({ confirm = true }),
  },
  {
    key = "p",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1),
  },
  {
    key = "n",
    mods = "LEADER",
    action = act.ActivateTabRelative(1),
  },
  {
    key = "LeftArrow",
    mods = "SHIFT",
    action = act.ActivateTabRelative(-1),
  },
  {
    key = "RightArrow",
    mods = "SHIFT",
    action = act.ActivateTabRelative(1),
  },
  -- Tab番号で直接ジャンプ (LEADER + 数字)
  { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = act.ActivateTab(8) },

  -- Pane関連
  {
    key = "|",
    mods = "LEADER",
    action = act.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
  -- Leader + h/j/k/l: WezTermペイン移動
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  -- Paneのサイズ変更
  {
    key = "H",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "J",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Down", 5 }),
  },
  { key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
  {
    key = "L",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Right", 5 }),
  },

  -- Command+Wを無効化 (ウィンドウを閉じないようにする)
  {
    key = "w",
    mods = "CMD",
    action = act.Nop,
  },
}

local mouse_bindings = {
  -- paste from mouse
  -- https://dev.classmethod.jp/articles/wezterm-get-started/
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom("Clipboard"),
  },
}
-- keybindの設定
-- Leaderキーの設定. Tmuxと同じにしてる
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keys
config.mouse_bindings = mouse_bindings

return config
