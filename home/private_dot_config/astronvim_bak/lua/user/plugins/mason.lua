-- customize mason plugins
return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				-- 'shellcheck',
				-- 'shfmt',
				"rust_analyzer",
				'ruff',
				"pyright",
				-- 'jedi-language-server',
				"ruff-lsp",
				"debugpy",
				"codelldb",

				-- C++
				-- clangd,
			},
		},
	},

	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			-- ensure_installed = { "lua_ls" },
		},
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- "nvimtools/none-ls.nvim",
		-- overrides `require("mason-null-ls").setup(...)`
		opts = {
			-- ensure_installed = { "prettier", "stylua",  },
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- overrides `require("mason-nvim-dap").setup(...)`
		opts = {
			-- ensure_installed = { "python" },
		},
	},
}
