return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {
							ui = { bg_gutter = "none" },
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					-- local makeDiagnosticColor = function(color)
					-- 	local c = require("kanagawa.lib.color")
					-- 	return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
					-- end
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						-- DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
						-- DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
						-- DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
						-- DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
					}
				end,
				theme = "wave", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- custom_highlights = function(colors)
				-- 	local bg = colors.lavender
				-- 	local fg = colors.base
				--
				-- 	local secondary_bg = colors.blue
				-- 	local secondary_fg = colors.base
				--
				-- 	local muted_bg = colors.overlay0
				-- 	local muted_fg = colors.base
				-- 	return {
				--
				-- 		-- NormalFloat = { bg = "none" },
				-- 		-- FloatBorder = { fg = "none" },
				-- 		-- FloatTitle = { bg = "none" },
				-- 		-- Save an hlgroup with dark background and dimmed foreground
				-- 		-- so that you can use it where your still want darker windows.
				-- 		-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
				-- 		-- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
				--
				-- 		-- Popular plugins that open floats will link to NormalFloat by default;
				-- 		-- set their background accordingly if you wish to keep them dark and borderless
				-- 		-- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				--
				-- 		MasonHeader = { fg = fg, bg = bg, style = { "bold" } },
				-- 		MasonHeaderSecondary = { fg = secondary_fg, bg = secondary_bg, style = { "bold" } },
				--
				-- 		MasonHighlight = { fg = colors.green },
				-- 		MasonHighlightBlock = {
				-- 			bg = colors.green,
				-- 			fg = colors.base,
				-- 		},
				-- 		MasonHighlightBlockBold = { bg = secondary_bg, fg = secondary_fg, bold = true },
				--
				-- 		MasonHighlightSecondary = { fg = colors.mauve },
				-- 		MasonHighlightBlockSecondary = { fg = secondary_fg, bg = secondary_bg },
				-- 		MasonHighlightBlockBoldSecondary = { fg = fg, bg = bg, bold = true },
				--
				-- 		MasonMuted = { fg = colors.overlay0 },
				-- 		MasonMutedBlock = { bg = muted_bg, fg = muted_fg },
				-- 		MasonMutedBlockBold = { bg = colors.yellow, fg = colors.base, bold = true },
				--
				-- 		MasonError = { fg = colors.red },
				--
				-- 		MasonHeading = { fg = colors.lavender, bold = true },
				--
				-- 		-- even if background is transparent
				-- 		-- TelescopeBorder = {
				-- 		-- 	fg = "none", -- colors.text,
				-- 		-- 	bg = "none", -- colors.mantle,
				-- 		-- },
				-- 		TelescopeMatching = { fg = colors.blue },
				-- 		-- TelescopeNormal = {
				-- 		-- 	bg = "none",
				-- 		-- },
				-- 		-- TelescopePromptBorder = {
				-- 		-- 	fg = "none", -- colors.text,
				-- 		-- 	bg = "none", -- colors.surface0,
				-- 		-- },
				-- 		TelescopePromptNormal = {
				-- 			fg = colors.sky,
				-- 			bg = "none", --colors.surface0,
				-- 		},
				-- 		TelescopePromptPrefix = {
				-- 			fg = colors.flamingo,
				-- 			bg = "none", -- colors.surface0,
				-- 		},
				-- 		TelescopePreviewTitle = {
				-- 			fg = colors.green,
				-- 			bg = "none", -- colors.green,
				-- 		},
				-- 		TelescopePromptTitle = {
				-- 			fg = colors.red,
				-- 			bg = "none", -- colors.red,
				-- 		},
				-- 		-- TelescopeResultsTitle = {
				-- 		-- 	fg = colors.lavender,
				-- 		-- 	bg = "none", -- colors.lavender,
				-- 		-- },
				-- 		TelescopeSelection = {
				-- 			fg = colors.flamingo,
				-- 			bg = colors.mantle, -- colors.surface0,
				-- 			style = { "bold" },
				-- 		},
				-- 		-- TelescopeSelectioncolorsaret = { fg = colors.flamingo },
				--
				-- 		Pmenu = { fg = colors.flamingo, bg = colors.base }, -- add `blend = vim.o.pumblend` to enable transparency
				-- 		PmenuSel = { fg = "none", bg = colors.overlay0 },
				-- 		PmenuSbar = { bg = colors.overlay0 },
				-- 		PmenuThumb = { bg = colors.overlay1 },
				-- 	}
				-- end,
				transparent_background = true,
				-- dim_inactive = {
				-- 	enabled = false, -- dims the background color of inactive window
				-- 	shade = "dark",
				-- 	percentage = 0.15, -- percentage of the shade to apply to the inactive window
				-- },
				term_colors = false,
				integrations = {
					alpha = true,
					blink_cmp = true,
					dashboard = true,
					dap = true,
					dap_ui = true,
					harpoon = true,
					diffview = true,
					flash = true,
					gitsigns = true,
					illuminate = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = true,
					},
					lsp_trouble = true,
					markdown = true,
					mason = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
						inlay_hints = {
							background = true,
						},
					},
					mini = {
						enabled = true,
						indentscope_color = "lavender",
					},
					neotree = true,
					neotest = true,
					noice = true,
					notify = true,
					snacks = {
						enabled = true,
						indent_scope_color = "text",
					},
					semantic_tokens = true,
					telescope = {
						enabled = true,
						-- style = "nvchad",
					},
					treesitter_context = true,
					treesitter = true,
					which_key = true,
				},
			})
		end,
	},
}
