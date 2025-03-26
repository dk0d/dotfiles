-- TODO: Adjust this with blink.nvim
if true then
	return {}
end

local cmdPath = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"

if not require("utils").path_exists(cmdPath) then
	return {}
end

local util = require("lspconfig.util")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	opts.buffer = bufnr

	opts.desc = "Show line diagnostics"
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Show documentation for what is under cursor"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- add LSP code actions
	-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
end

return {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "swift", "objective-c", "objective-cpp" },
	cmd = {
		cmdPath,
	},
	root_dir = function(filename, _)
		return util.root_pattern("buildServer.json")(filename)
			or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
			or util.find_git_ancestor(filename)
			or util.root_pattern("Package.swift")(filename)
	end,
}
