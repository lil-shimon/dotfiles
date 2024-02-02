local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- UI
config.color_scheme = 'ayu'
config.font_size = 16
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
-- config.font = wezterm.font_with_fallback {
--   {
--     family = 'Monaspace Neon',
--     harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'calt', 'dlig' },
--   },
-- }

-- keybindings
-- デフォルトの設定を無効化
config.disable_default_key_bindings = true
local act = wezterm.action
-- `keybindings.lua`を読み込み
local keys = {
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  -- copy
  { key = 'c', mods = 'LEADER', action = act.CopyTo 'ClipboardAndPrimarySelection' },
  -- past
  { key = 'v', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
}
-- keybindの設定
local keybind = keys.keys
-- Leaderキーの設定
config.leader = { key = ',', mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keybind

return config
