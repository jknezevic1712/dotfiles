local wezterm = require 'wezterm'
local commands = require 'commands'
local constants = require 'constants'

local config = wezterm.config_builder()

-- Shell settings
config.default_prog = { 'powershell.exe', '-NoLogo' }

-- Font settings
config.font_size = 10
config.line_height = 1.5
config.font = wezterm.font('Fira Code', { italic = true, weight = 700 })

-- Colors
config.color_scheme = 'Catppuccin Mocha'

-- Appearance
config.cursor_blink_rate = 0
config.window_decorations = 'RESIZE'
-- config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 15,
  right = 15,
  top = 10,
  bottom = 10,
}
config.macos_window_background_blur = 40
config.window_background_opacity = 0.9
config.window_background_image = constants.bg_image
config.tab_bar_at_bottom = true

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

-- Custom commands
wezterm.on('augment-command-palette', function()
  return commands
end)

-- Load keybinds
local keybinds = require 'keybinds'
keybinds.apply_to_config(config)

return config
