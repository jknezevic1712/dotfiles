local wezterm = require 'wezterm'

local command = {
  brief = 'Open work environment',
  icon = 'md_window_maximize',
  action = wezterm.action_callback(function(window, pane)
    local wezterm_bin = 'wezterm.exe'
    local current_window_id = tostring(window:window_id())

    -- First tab
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      'E:\\Personal_projects',
    }

    -- Second tab
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      'E:\\Personal_projects',
    }
  end),
}

return command
