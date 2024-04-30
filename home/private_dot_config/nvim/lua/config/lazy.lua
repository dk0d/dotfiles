---@type LazyConfig
require("lazy").setup({
	{
		"AstroNvim/AstroNvim",
		version = "^4",
		import = "astronvim.plugins",
		opts = {
			mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
			maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
			icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
			pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/fal
		},
	},
	{ import = "plugins" },
} --[[@as LazySpec]], {
	install = { colorscheme = { "astrodark", "habamax" } },
	-- dev = { path = "~/projects", fallback = false },
	ui = { backdrop = 100 },
	performance = {
		rtp = {
			-- disable some rtp plugins, add more to your liking
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
} --[[@as LazyConfig]])
