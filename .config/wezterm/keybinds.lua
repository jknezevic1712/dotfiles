local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
  config.keys = {
    -- Clear scrollback
    {
      key = 'k',
      mods = 'CTRL',
      action = act.Multiple {
        act.ClearScrollback 'ScrollbackAndViewport',
        act.SendKey { key = 'l', mods = 'CTRL' },
      },
    },

    -- Switch tabs with Ctrl+1, Ctrl+2, Ctrl+3...
    {
      key = '1',
      mods = 'CTRL',
      action = act.ActivateTab(0),
    },
    {
      key = '2',
      mods = 'CTRL',
      action = act.ActivateTab(1),
    },
    {
      key = '3',
      mods = 'CTRL',
      action = act.ActivateTab(2),
    },
    {
      key = '4',
      mods = 'CTRL',
      action = act.ActivateTab(3),
    },
    {
      key = '5',
      mods = 'CTRL',
      action = act.ActivateTab(4),
    },
    {
      key = '6',
      mods = 'CTRL',
      action = act.ActivateTab(5),
    },
    {
      key = '7',
      mods = 'CTRL',
      action = act.ActivateTab(6),
    },
    {
      key = '8',
      mods = 'CTRL',
      action = act.ActivateTab(7),
    },
    {
      key = '9',
      mods = 'CTRL',
      action = act.ActivateTab(8),
    },

    {
      key = 'Space',
      mods = 'CTRL',
      action = act.SendKey {
        key = 'Space',
        mods = 'CTRL',
      },
    },

    {
      key = 'c',
      mods = 'CTRL',
      action = act.SendKey {
        key = 'c',
        mods = 'CTRL',
      },
    },
    {
      key = 'v',
      mods = 'CTRL',
      action = act.SendKey {
        key = 'v',
        mods = 'CTRL',
      },
    },
  }
end

return M
