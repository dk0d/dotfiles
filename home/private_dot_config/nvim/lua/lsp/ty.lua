local config = {
  filetypes = { "python" },
  cmd = { "ty", "server" },
  settings = {
    ty = {
      diagnosticsMode = "workspace",
    },
  },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
}
vim.lsp.config("ty", config)
vim.lsp.enable("ty")
return config
