local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- UI
config.color_scheme = 'ayu'
config.font_size = 14
config.font = wezterm.font("Monaspace Neon", { weight = "Regular", stretch = "Normal", style = "Normal" })

-- window padding
-- https://medium.com/@yusuke_h/%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E3%81%8C%E3%83%80%E3%82%B5%E3%81%84%E3%81%A8%E3%83%A2%E3%83%86%E3%81%AA%E3%81%84-wezterm%E7%B4%B9%E4%BB%8B%E7%B7%A8-11306091722a
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- keybindings
local act = wezterm.action

local keys = {
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  -- copy
  { key = 'c', mods = 'LEADER', action = act.CopyTo 'ClipboardAndPrimarySelection' },
  -- past
  { key = 'v', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
  --  CTRL + SHIFT + tで新しいタブを開く
  {
    key = "t",
    mods = "SHIFT|CTRL",
    action = act.SpawnTab "CurrentPaneDomain"
  },
  -- Command+Wを無効化 (ウィンドウを閉じないようにする)
  {
    key = "w",
    mods = "CMD",
    action = act.Nop
  }
}

local mouse_bindings = {
  -- paste from mouse
  -- https://dev.classmethod.jp/articles/wezterm-get-started/
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom "Clipboard"
  }
}
-- keybindの設定
config.leader = { key = ',', mods = "CMD|CTRL", timeout_milliseconds = 2000 }
config.keys = keys
config.mouse_bindings = mouse_bindings


return config
