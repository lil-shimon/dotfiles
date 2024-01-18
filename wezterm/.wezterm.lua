local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- UI
config.color_scheme = 'ayu'
config.font_size = 16
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })

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
}
-- keybindの設定
local keybind = keys.keys
-- Leaderキーの設定
config.leader = { key = ',', mods = "CTRL", timeout_milliseconds = 2000 }
config.keybind = keybind

-- Tab
config.use_fancy_tab_bar = false

return config
