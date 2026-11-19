-- Oxfmt can format standalone Markdown too; use the file's directory when no
-- project config gives the LSP a root.
return {
  filetypes = { "markdown", "markdown.mdx" },
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
  end,
}
