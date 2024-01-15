local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'AdventureTime'
config.font_size = 16
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })

return config
