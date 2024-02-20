return {
	n = {
		["<leader>lD"] = {
			function()
				require("telescope.builtin").diagnostics({ bufnr = 0 })
			end,
			desc = "Search current buffer diagnostics",
		},
		["<leader>lL"] = {
			"<cmd>LspRestart<cr>",
			desc = "Restart LSP",
		},
	},
}
