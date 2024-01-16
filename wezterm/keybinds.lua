local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'UP' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
  }
}
