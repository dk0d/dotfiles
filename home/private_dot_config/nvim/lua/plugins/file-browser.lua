return {
	"nvim-telescope/telescope-file-browser.nvim",
	enabled = false,
	keys = {
		{
			"<leader>sb",
			":Telescope file_browser path=%:p:h=%:p:h select_buffer=true<cr>",
			desc = "Browse Files Current Buffer Path",
		},
		{
			"<leader>sB",
			":Telescope file_browser<cr>",
			desc = "Browse Files Workspace Directory",
		},
		{
			"<leader>bf",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Search Buffers",
		},
	},
	config = function()
		require("telescope").load_extension("file_browser")
	end,
}
