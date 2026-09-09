return {
  cmd = { "oxlint", "--lsp" },
  filetypes = { "javascript", "typescript" },
  root_markers = { ".oxfmtrc.json", ".oxlintrc.json" },
  workspace_required = true,
}
