local wezterm = require 'wezterm'

local command = {
  brief = 'Open GSC work environment tabs',
  icon = 'md_window_maximize',
  action = wezterm.action_callback(function(window, pane)
    local home = os.getenv 'HOME'
    local wezterm_bin = '/Applications/WezTerm.app/Contents/MacOS/wezterm'
    
    -- Get the unique ID of the window you are currently looking at
    local current_window_id = tostring(window:window_id())

    -- 1. Spawn the GSC tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC',
    }

    -- 2. Spawn the GSCLite tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC/server/GSCLite',
    }

    -- 3. Spawn the web-workspace tab into the current window
    wezterm.run_child_process {
      wezterm_bin,
      'cli',
      'spawn',
      '--window-id',
      current_window_id,
      '--cwd',
      home .. '/Work/GSC/web-workspace',
    }
  end),
}

return command
