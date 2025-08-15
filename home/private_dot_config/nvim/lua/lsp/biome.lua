return {
  -- workspace_required = true,
  -- root_markers = { "biome.json", "biome.jsonc" },
  single_file_support = false,
  root_dir = require("lspconfig.util").root_pattern("biome.json", "biome.jsonc"),
}
