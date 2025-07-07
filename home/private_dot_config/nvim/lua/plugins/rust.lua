return {
	"mrcjkb/rustaceanvim",
	version = "^6", -- Recommended
	event = "VeryLazy",
	config = function()
		vim.g.rustaceanvim = function()
			local install_path = vim.fn.expand("$MASON/packages/codelldb")
			local codelldb_path = vim.fn.expand("$MASON/bin/codelldb")
			local liblldb_path = install_path .. "/extension/lldb/lib/liblldb"
			local this_os = vim.loop.os_uname().sysname
			liblldb_path = liblldb_path .. (this_os == "Darwin" and ".dylib" or ".so")
			local cfg = require("rustaceanvim.config")
			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				server = {
					default_settings = {
						["rust-analyzer"] = {
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								buildScripts = {
									enable = true,
								},
							},
							procMacro = {
								enable = true,
							},
							hint = {
								enable = true,
							},
						},
					},
					on_attach = function(_, bufnr)
						vim.keymap.set("n", "<S-k>", function()
							vim.cmd.RustLsp({ "hover", "actions" })
						end, { desc = "Rust Hover Actions", buffer = bufnr })
						vim.keymap.set("n", "<leader>la", function()
							vim.cmd.RustLsp("codeAction")
						end, { desc = "Rust Code Actions", buffer = bufnr })
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

						vim.keymap.set("n", "lr", vim.lsp.buf.rename, { desc = "Rust rename", buffer = bufnr })

						-- or
						-- vim.keymap.set(
						-- 	"n",
						-- 	"<leader>lc",
						-- 	rt.open_cargo_toml.open_cargo_toml,
						-- 	{ desc = "Rust open cargo TOML", buffer = bufnr }
						-- )
						-- vim.keymap.set("n", "<leader>lr", rt.ssr.ssr, { desc = "Structural Search/Replace", buffer = bufnr })
					end,
				},
			}
		end
	end,
}
