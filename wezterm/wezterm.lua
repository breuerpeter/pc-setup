local wezterm = require 'wezterm'
local mux = wezterm.mux

config = wezterm.config_builder()
config = {
	enable_tab_bar = false,
	font_size = 11,
	color_scheme = "Night Owl (Gogh)",
	window_background_opacity = 0.9,
	window_decorations = "RESIZE",
	default_cursor_style = "SteadyBar",
}
--config.wsl_domains = {
--	{
--		-- Unique identifier
--		name = "WSL:Ubuntu22",
--		-- Must match a valid distro from 'wsl -l -v'
--		distribution = "Ubuntu-22.04",
--	}
--}
--config.default_domain = "Ubuntu-22.04"

-- Maximize window on startup
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
