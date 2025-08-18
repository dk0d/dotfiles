return {
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   version = "^2",
  --   dependencies = { "williamboman/mason.nvim" },
  --   cmd = { "LspInstall", "LspUninstall" },
  --   opts_extend = { "ensure_installed" },
  --   opts = {
  --     handlers = {
  --       function(server)
  --         require("astrolsp").lsp_setup(server)
  --       end,
  --     },
  --   },
  --   config = function(...)
  --     require("astronvim.plugins.configs.mason-lspconfig")(...)
  --   end,
  -- },
  {
    "mason-org/mason.nvim",
    version = "^1",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    event = "VeryLazy",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua-language-server",
          "vim-language-server",
          "stylua",
          "selene",
          "ruff",
          "pyright",
          "biome",
          "debugpy",
          "codelldb",
          "taplo",
          "tailwindcss-language-server",
          "typescript-language-server",
          "denols",
          "svelte-language-server",
          "prettierd",
        },
        run_on_start = true,
        auto_update = true,

        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
}

-- Example customization of mason plugins
---@type LazySpec
-- return {
--
-- 	-- use mason-lspconfig to configure LSP installations
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		-- overrides `require("mason-lspconfig").setup(...)`
-- 		opts = function(_, opts)
-- 			-- add more things to the ensure_installed table protecting against community packs modifying it
-- 			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
-- 				"lua_ls",
-- 				-- add more arguments for adding more language servers
-- 				"pyright",
-- 			})
-- 		end,
-- 	},
-- 	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
-- 	{
-- 		"jay-babu/mason-null-ls.nvim",
-- 		-- overrides `require("mason-null-ls").setup(...)`
-- 		opts = function(_, opts)
-- 			-- add more things to the ensure_installed table protecting against community packs modifying it
-- 			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
-- 				"prettierd",
-- 				"selene",
-- 				"stylua",
-- 				-- add more arguments for adding more null-ls sources
-- 				-- "ruff-lsp",
-- 				"ruff",
-- 				-- "rust_analyzer", -- conflicts with rustaceanvim, install with brew/cargo
-- 				-- 'shellcheck',
-- 				-- 'shfmt',
-- 				-- 'jedi-language-server',
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"jay-babu/mason-nvim-dap.nvim",
-- 		-- overrides `require("mason-nvim-dap").setup(...)`
-- 		opts = function(_, opts)
-- 			-- add more things to the ensure_installed table protecting against community packs modifying it
-- 			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
-- 				"python",
-- 				-- add more arguments for adding more debuggers
-- 				"debugpy",
-- 				"codelldb",
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"mhartington/formatter.nvim",
-- 		event = "VeryLazy",
-- 		filetypes = { "swift" },
-- 		config = function()
-- 			local augroup = vim.api.nvim_create_augroup
-- 			local autocmd = vim.api.nvim_create_autocmd
-- 			augroup("__formatter__", { clear = true })
-- 			autocmd("BufWritePost", {
-- 				group = "__formatter__",
-- 				command = ":FormatWrite",
-- 			})
-- 			require("formatter").setup({
-- 				filetype = {
-- 					swift = {
-- 						function()
-- 							return {
-- 								exe = "swiftformat",
-- 								args = {
-- 									"--wrapparameters",
-- 									"before-first",
-- 									"--wraparguments",
-- 									"before-first",
-- 									"--xcodeindentation",
-- 									"enabled",
-- 								},
-- 								stdin = true,
-- 							}
-- 						end,
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
