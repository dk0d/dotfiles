if true then
	return {}
end

return {
	"simrat39/rust-tools.nvim",
	event = "VeryLazy",
	filetype = "rust",
	dependencies = "neovim/nvim-lspconfig",
	config = function()
		local rt = require("rust-tools")
		local install_path = require("mason-registry").get_package("codelldb"):get_install_path()
		local codelldb_path = install_path .. "/codelldb"
		-- local liblldb_path = install_path .. "/extension/lldb/liblldb.dylib"
		local liblldb_path = install_path .. "/extension/lldb/lib/liblldb"
		local this_os = vim.loop.os_uname().sysname
		liblldb_path = liblldb_path .. (this_os == "Darwin" and ".dylib" or ".so")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		rt.setup({
			dap = {
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			},
			server = {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
				on_attach = function(_, bufnr)
					vim.keymap.set(
						"n",
						"<S-k>",
						rt.hover_actions.hover_actions,
						{ desc = "Rust Hover Actions", buffer = bufnr }
					)
					vim.keymap.set(
						"n",
						"<leader>la",
						rt.code_action_group.code_action_group,
						{ desc = "Rust Code Actions", buffer = bufnr }
					)
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ desc = "Rust go to definition", buffer = bufnr }
					)
					vim.keymap.set(
						"n",
						"gr",
						vim.lsp.buf.references,
						{ desc = "Rust go to references", buffer = bufnr }
					)
					vim.keymap.set(
						"n",
						"<leader>lc",
						rt.open_cargo_toml.open_cargo_toml,
						{ desc = "Rust open cargo TOML", buffer = bufnr }
					)
					vim.keymap.set(
						"n",
						"<leader>lr",
						rt.ssr.ssr,
						{ desc = "Structural Search/Replace", buffer = bufnr }
					)
				end,
			},
			tools = {
				runnables = {
					use_telescope = true,
				},
				inlay_hints = {
					auto = true,
					show_parameter_hints = true,
					-- parameter_hints_prefix = ' 󰰥 ',
					-- other_hints_prefix = ' 󰰥 ',
					parameter_hints_prefix = "  : ",
					other_hints_prefix = "  : ",
				},
				hover_actions = {
					auto_focus = true,
				},
			},
		})
	end,
}
