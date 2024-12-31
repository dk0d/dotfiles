local wezterm = require("wezterm")
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.disable_default_key_bindings = false

-- >= % & <= .= :- |= /= -> => >= <= != == === !== $ a g r !~ @ %
local JETBRAINS_MONO = {
	family = "Jetbrains Mono",
	weight = "Regular",
	-- l 0
	harfbuzz_features = {
		-- "calt=0",
		-- "zero",
		-- "ss02",
		-- "cv05",
		-- "ss20",
		-- "cv15",
		-- "cv14",
	},
}

local FIRA_CODE = {
	family = "Fira Code",
	-- weight = "Regular",
	harfbuzz_features = {
		"zero",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss07",
		"ss09",
		"cv02",
		"cv18",
		"cv25",
		"cv28",
		"cv32",
		"cv26",
	},
}

local CASCADIA_CODE = {
	family = "Cascadia Code",
	weight = "Light",
	harfbuzz_features = { "zero", "ss01=0", "ss02", "ss03", "ss20" },
}

local TWILIO = {
	family = "Twilio Sans Mono",
	harfbuzz_features = { "zero" },
}

config.font = wezterm.font_with_fallback({
	JETBRAINS_MONO,
	FIRA_CODE,
	CASCADIA_CODE,
	TWILIO,
	-- fallbacks
	"Menlo",
	-- symbols
	"Symbols Nerd Font Mono",
})

config.font_size = 12
config.line_height = 1.1
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.native_macos_fullscreen_mode = true
config.tab_max_width = 80
config.cursor_thickness = "1pt"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 800

-- config.foreground_text_hsb = {
-- 	brightness = 1.0,
-- 	-- saturation = 1.0,
-- }

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.window_padding = {
	left = 4.,
	right = 4.,
	top = 4.,
	bottom = 4.,
}

-- removes the title bar
config.window_decorations = "RESIZE"

config.keys = {
	{
		key = "=",
		mods = "CMD",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "0",
		mods = "CMD",
		action = wezterm.action.ResetFontSize,
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "f",
		mods = "CTRL|CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "q",
		mods = "CMD",
		action = wezterm.action.QuitApplication,
	},
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.HideApplication,
	},
	{
		key = "P",
		mods = "CMD",
		action = wezterm.action.ActivateCommandPalette,
	},
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
}

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Hack", weight = "Regular" }),

	-- The size of the font in the tab bar.
	-- Default to 10. on Windows but 12.0 on other systems
	font_size = 9.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#111111",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#000000",
}

-- config.force_reverse_video_cursor = true

-- config.colors = {
--
-- 	-- foreground = "#dcd7ba",
-- 	background = "#050512",
-- 	selection_fg = "none", -- use text color
-- 	selection_bg = "rgb(50%, 50%, 50%, 50%)",
-- 	scrollbar_thumb = "#16161d",
-- 	split = "#16161d",
-- 	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
-- 	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
-- 	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
-- 	cursor_bg = "#c34043",
-- 	cursor_fg = "black",
-- 	cursor_border = "#c8c093",
-- 	copy_mode_active_highlight_bg = { Color = "#000000" },
-- 	copy_mode_active_highlight_fg = { AnsiColor = "Black" },
-- 	copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
-- 	copy_mode_inactive_highlight_fg = { AnsiColor = "White" },
-- 	tab_bar = {
-- 		background = "rgb(0, 0, 0, 90%)",
-- 		active_tab = {
-- 			bg_color = "#111111",
-- 			fg_color = "#bbbbbb",
-- 			underline = "None",
-- 		},
-- 		inactive_tab = {
-- 			bg_color = "#000000",
-- 			fg_color = "#444444",
-- 			italic = true,
-- 			strikethrough = false,
-- 			intensity = "Half",
-- 		},
-- 		new_tab = {
-- 			bg_color = "#223344",
-- 			fg_color = "silver",
-- 		},
-- 	},
-- }
--
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"
custom.tab_bar.active_tab.bg_color = "#74c7ec"
config.color_schemes = {
	["OLEDpuccin"] = custom,
}
config.color_scheme = "OLEDpuccin"

-- recommended settings for macos
config.max_fps = 244
config.prefer_egl = true

-- background
config.window_background_opacity = 0.6
config.macos_window_background_blur = 70
-- config.background = {
-- { source = { Color = "black" }, opacity = 0.2 },
-- { source = { Color = "#444444" }, opacity = 0.9 },
-- {
-- 	source = { File = os.getenv("HOME") .. "/.config/wezterm/background.jpg" },
-- 	hsb = { brightness = 0.02, saturation = 0.7 },
-- },
-- }

return config
