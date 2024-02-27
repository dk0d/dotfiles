return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		opts = vim.tbl_deep_extend("force", opts or {}, {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"lua",
				"python",
				"rust",
				-- "markdown", # causes issues on startup in  linux VMs
				-- "markdown_inline",
			},
			ident = { enable = true },
			rainbow = {
				enabled = true,
				extended_mode = true,
				max_file_lines = nil,
			},
			textobjects = {
				move = {
					goto_next_start = {
						["]s"] = { query = "@class.outer", desc = "Next class start" },
					},
					goto_previous_start = {
						["[s"] = { query = "@class.outer", desc = "Previous class start" },
					},
				},
			},
		})
		return opts
	end,
}
