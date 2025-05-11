-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

local dark = wezterm.gui.get_appearance():find("Dark")

-- my coolnight colorscheme
config.colors = {
	foreground = dark and "#CBE0F0" or "#1c1917",
	background = dark and "#1c1917" or "#e7e5e4",
	cursor_bg = "#7dd3fc",
	cursor_border = "#7dd3fc",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#4ade80", "#FFE073", "#38bdf8", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#4ade80", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 25

-- and finally, return the configuration to wezterm
return config
