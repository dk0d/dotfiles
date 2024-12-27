-- add telescope-fzf-native
return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"nvim-telescope/telescope-bibtex.nvim",
		},
	},

	config = function(plugin, opts)
		require("telescope.themes")
		opts = vim.tbl_deep_extend("force", opts, {
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "  ",
				entry_prefix = " ",
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
				},
				theme = "ivy",
				sorting_strategy = "ascending",
				layout_strategy = "bottom_pane",
				layout_config = {
					horizontal = { prompt_position = "bottom" },
					height = 0.5,
				},
				border = true,
				borderchars = {
					prompt = { "─", " ", "─", " ", " ", " ", "─", "─" },
					results = { "─", " ", " ", " ", "─", "─", " ", " " },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
				-- layout_config = {
				-- 	horizontal = { prompt_position = "bottom", preview_width = 0.52 },
				-- vertical = { mirror = false },
				-- width = 0.85,
				-- height = 0.75,
				-- preview_cutoff = 120,
				-- },
			},
			extensions = {
				bibtex = {
					-- Depth for the *.bib file
					depth = 2,
					-- Custom format for citation label
					custom_formats = {},
					-- Format to use for citation label.
					-- Try to match the filetype by default, or use 'plain'
					format = "",
					-- Path to global bibliographies (placed outside of the project)
					global_files = { "~/Library/texmf/bibtex/bib/zotero/zotero.bib", "~/texmf/bibtex/bib/zotero.bib" },
					-- Define the search keys to use in the picker
					search_keys = { "author", "year", "title" },
					-- Template for the formatted citation
					citation_format = "{{author}} ({{year}}), {{title}}.",
					-- Only use initials for the authors first name
					citation_trim_firstname = true,
					-- Max number of authors to write in the formatted citation
					-- following authors will be replaced by "et al."
					citation_max_auth = 2,
					-- Context awareness disabled by default
					context = false,
					-- Fallback to global/directory .bib files if context not found
					-- This setting has no effect if context = false
					context_fallback = true,
					-- Wrapping in the preview window is disabled by default
					wrap = false,
				},
			},
		})

		-- load astronvim default config stuff
		require("astronvim.plugins.configs.telescope")(plugin, opts)

		-- load telescope extensions
		local telescope = require("telescope")
		telescope.load_extension("harpoon")
		telescope.load_extension("bibtex")
	end,

	keys = {
		{
			"<leader>ff",
			function()
				require("utils.telescope").smart_find_files()
			end,
			desc = "Search git tracked files (falls back to find_files without git repo)",
		},
		{
			"<leader>fa",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Find all files",
		},
		{
			"<leader>fp",
			function()
				require("utils.telescope").multigrep({ hidden = true })
			end,
			desc = "GREP & Glob",
		},
		{
			"<leader>fA",
			function()
				require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
			end,
			desc = "Find all files (hidden and ignored)",
		},
		{
			"<leader>fi",
			function()
				require("telescope.builtin").find_files({ no_ignore = true })
			end,
			desc = "Search all files (and ignored)",
		},
		{
			"<leader>fe",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "Find themes",
		},
		{
			"<leader>fH",
			function()
				require("telescope.builtin").highlights()
			end,
			desc = "Search Highlights",
		},
		{
			"<leader>fo",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Search open buffers",
		},
		{
			"<leader>fO",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Search old files",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "Search workspace symbols",
		},
	},
}
