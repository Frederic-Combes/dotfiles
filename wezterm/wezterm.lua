local wezterm = require("wezterm")

local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.font = wezterm.font("0xProto Nerd Font Mono")
config.audible_bell = "Disabled"
config.color_scheme = "catppuccin-mocha"
config.enable_kitty_keyboard = true

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true


return config
