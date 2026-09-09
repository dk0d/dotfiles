local config = {
  filetypes = { "python" },
  cmd = { "ty", "server" },
  settings = {
    ty = {
      diagnosticMode = "workspace",
    },
  },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
}
return config
