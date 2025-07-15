return {
  workspace_required = true,
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
  end,
}
