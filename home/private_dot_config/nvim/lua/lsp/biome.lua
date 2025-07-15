return {
  workspace_required = true,
  -- root_markers = { "biome.json", "biome.jsonc" },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern("biome.json", "biome.jsonc")(fname)
  end,
}
