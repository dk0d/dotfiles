return {
	single_file_support = false,
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
	end,
}
