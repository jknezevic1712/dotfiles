local wezterm = require 'wezterm'

local command = {
  brief = 'Open work environment',
  icon = 'md_window_maximize',
  action = wezterm.action_callback(function(window, pane)
    local home = os.getenv 'HOME'
    local wezterm_bin = '/Applications/WezTerm.app/Contents/MacOS/wezterm'

    -- Get the unique ID of the window you are currently looking at
    local current_window_id = tostring(window:window_id())

    -- 1. Spawn the first tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC',
    }

    -- 2. Spawn the second tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC/server/GSCLite',
    }

    -- 3. Spawn the third tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC/web-workspace',
    }

    -- 4. Spawn the fourth tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC',
    }
  end),
}

return command
