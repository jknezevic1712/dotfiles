local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
  config.keys = {
    -- Global keybind: Clear scrollback and viewport anywhere in WezTerm
    {
      key = 'k',
      mods = 'CMD',
      action = act.Multiple {
        act.ClearScrollback 'ScrollbackAndViewport',
        act.SendKey { key = 'l', mods = 'CTRL' }, -- Cleanly redraws your Zsh prompt
      },
    },
  }
end

return M
