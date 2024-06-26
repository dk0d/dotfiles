return {
	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},
	{
		"smoka7/multicursors.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			vim.g.multi_cursor_use_default_mapping = 0
			vim.g.multi_cursor_start_word_key = "<C-m>"
			vim.g.multi_cursor_select_all_word_key = "<A-m>"
			vim.g.multi_cursor_start_key = "g<C-m>"
			vim.g.multi_cursor_select_all_key = "g<A-m>"
			vim.g.multi_cursor_next_key = "<C-m>"
			vim.g.multi_cursor_prev_key = "<C-p>"
			vim.g.multi_cursor_skip_key = "<C-x>"
			vim.g.multi_cursor_quit_key = "<Esc>"
		end,
	},
}
