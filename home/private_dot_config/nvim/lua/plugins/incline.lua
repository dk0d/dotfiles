return {
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	-- optional, but required for fuzzy finder support
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 		build = "make",
	-- 	},
	-- 	config = function()
	-- 		local dropbar_api = require("dropbar.api")
	-- 		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
	-- 		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
	-- 		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
	-- 	end,
	-- },
	{
		"b0o/incline.nvim",
		dependencies = {
			{
				"SmiteshP/nvim-navic",
				dependencies = { "neovim/nvim-lspconfig" },
			},
		},
		config = function()
			-- require("incline").setup({
			-- 	window = {
			-- 		padding = 0,
			-- 		margin = { horizontal = 0, vertical = 0 },
			-- 	},
			-- 	render = function(props)
			-- 		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			-- 		if filename == "" then
			-- 			filename = "[No Name]"
			-- 		end
			-- 		local ft_icon, ft_color = devicons.get_icon_color(filename)
			-- 		local modified = vim.bo[props.buf].modified
			-- 		local res = {
			-- 			ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
			-- 				or "",
			-- 			" ",
			-- 			{ filename, gui = modified and "bold,italic" or "bold" },
			-- 			guibg = "#44406e",
			-- 		}
			-- 		if props.focused then
			-- 			for _, item in ipairs(navic.get_data(props.buf) or {}) do
			-- 				table.insert(res, {
			-- 					{ " > ", group = "NavicSeparator" },
			-- 					{ item.icon, group = "NavicIcons" .. item.type },
			-- 					{ item.name, group = "NavicText" },
			-- 				})
			-- 			end
			-- 		end
			-- 		table.insert(res, " ")
			-- 		return res
			-- 	end,
			-- })

			-- NOTE: Filename only
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = "#45475a", guifg = "#bac2de" },
						InclineNormalNC = { guibg = "none", guifg = "#bac2de" },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = { cursorline = true, only_win = true },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[*]" .. filename
					end
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},
}
