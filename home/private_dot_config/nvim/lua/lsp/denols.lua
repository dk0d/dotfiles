return {
	init_options = {
		lint = true,
		unstable = true,
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://cdn.nest.land"] = true,
					["https://crux.land"] = true,
				},
			},
		},
	},
	single_file_support = false,
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc", "deno.lock")(fname)
	end,
}
