-- return {
--   "github/copilot.vim",
--   event = "VeryLazy",
--   after = "nvim-cmp",
--   keys = {
--     { "<C-)>", "<Plug>(copilot-next)", desc = "copilot next", mode = "i" },
--     { "<C-(>", "<Plug>(copilot-prev)", desc = "copilot prev", mode = "i" },
--     { "<C-i>", "<Plug>(copilot-suggest)", desc = "copilot prev", mode = "i" },
--   },
--   config = function()
--     require("copilot").setup {
--       panel = {
--         enabled = true,
--       },
--     }
--   end,
--   config = function(_, opts)
--     vim.cmd [[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]]
--     -- vim.keymap.set("i", "<C-l>", 'copilot#Accept("<cr>")', { silent = true, expr = true })
--     vim.g.copilot_no_tab_map = true
--     -- vim.g.copilot_no_default_key_mappings = true
--     -- vim.g.copilot_assumed_mapped = true
--   end,
--   ft = { "python", "rust", "typescript", "javascript" },
-- }

-- disable copilot
-- if true then
-- 	return {}
-- end

return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				accept = "<CR>",
			},
			suggestion = {
				auto_trigger = true,
				enabled = true,
				keymap = {
					accept = "<A-l>",
					prev = "<C-[>",
					next = "<C-]>",
					dismiss = "<C-]>",
				},
			},
		})
	end,
}

-- return {
-- 	"yetone/avante.nvim",
-- 	event = "VeryLazy",
-- 	lazy = false,
-- 	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
-- 	opts = {
-- 		provider = "openapi",
-- 		auto_suggestions_provider = "openapi", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
-- 		openai = {
-- 			endpoint = "http://localhost:4321",
-- 			model = "deepseek-r1",
-- 			timeout = 30000, -- Timeout in milliseconds
-- 			temperature = 0,
-- 			max_tokens = 4096,
-- 			-- optional
-- 			-- api_key_name = "OPENAI_API_KEY", -- default OPENAI_API_KEY if not set
-- 		},
-- 	},
-- 	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
-- 	build = "make",
-- 	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
-- 	dependencies = {
-- 		"nvim-treesitter/nvim-treesitter",
-- 		"stevearc/dressing.nvim",
-- 		"nvim-lua/plenary.nvim",
-- 		"MunifTanjim/nui.nvim",
-- 		--- The below dependencies are optional,
-- 		-- "echasnovski/mini.pick", -- for file_selector provider mini.pick
-- 		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
-- 		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
-- 		-- "ibhagwan/fzf-lua", -- for file_selector provider fzf
-- 		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
-- 		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
-- 		{
-- 			-- support for image pasting
-- 			"HakonHarnes/img-clip.nvim",
-- 			event = "VeryLazy",
-- 			opts = {
-- 				-- recommended settings
-- 				default = {
-- 					embed_image_as_base64 = false,
-- 					prompt_for_file_name = false,
-- 					drag_and_drop = {
-- 						insert_mode = true,
-- 					},
-- 					-- required for Windows users
-- 					use_absolute_path = true,
-- 				},
-- 			},
-- 		},
-- 		{
-- 			-- Make sure to set this up properly if you have lazy=true
-- 			"MeanderingProgrammer/render-markdown.nvim",
-- 			opts = {
-- 				file_types = { "markdown", "Avante" },
-- 			},
-- 			ft = { "markdown", "Avante" },
-- 		},
-- 	},
-- }

-- return {
-- 	"jacob411/Ollama-Copilot",
-- 	-- opts = {
-- 	--
-- 	-- },
-- 	config = function()
-- 		require("OllamaCopilot").setup({
-- 			model_name = "deepseek-coder:6.7b",
-- 			stream_suggestion = true,
-- 			python_command = require("utils").get_python(),
-- 			filetypes = { "python", "lua", "vim", "markdown" },
-- 			ollama_model_opts = {
-- 				num_predict = 40,
-- 				temperature = 0.1,
-- 			},
-- 			keymaps = {
--
-- 				insert_accept = "<A-l>",
-- 				-- 					prev = "<C-[>",
-- 				-- 					next = "<C-]>",
-- 				-- 					dismiss = "<C-]>",
-- 				-- suggestion = "<leader>os",
-- 				reject = "<C-]>",
-- 			},
-- 		})
-- 	end,
-- }
