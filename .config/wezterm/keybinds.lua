local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
  config.keys = {
    -- Clear scrollback and viewport
    {
      key = 'k',
      mods = 'CMD',
      action = act.Multiple {
        act.ClearScrollback 'ScrollbackAndViewport',
        act.SendKey { key = 'l', mods = 'CTRL' },
      },
    },

    -- Copy Neovim's Visual selection, or the terminal selection
    {
      key = 'c',
      mods = 'CMD',
      action = wezterm.action_callback(function(window, pane)
        local process = pane:get_foreground_process_name() or ''

        if process:match '([^/]+)$' == 'nvim' then
          window:perform_action(act.SendKey { key = 'F13' }, pane)
        else
          window:perform_action(act.CopyTo 'Clipboard', pane)
        end
      end),
    },

    -- Paste from the system clipboard
    {
      key = 'v',
      mods = 'CMD',
      action = act.PasteFrom 'Clipboard',
    },
  }
end

return M
