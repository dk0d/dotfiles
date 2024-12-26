return {
	{
		"b0o/incline.nvim",
		-- dependencies = {
		-- 	{
		-- 		"SmiteshP/nvim-navic",
		-- 		dependencies = { "neovim/nvim-lspconfig" },
		-- 	},
		-- },
		config = function()
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
