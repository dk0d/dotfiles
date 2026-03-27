return {
  -- workspace_required = true,
  cmd = { "oxlint", "--lsp" },
  filetypes = { "javascript", "typescript" },
  single_file_support = false,
  root_dir = require("lspconfig.util").root_pattern(".oxfmtrc.json", ".oxlintrc.json"),
}
