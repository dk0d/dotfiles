return {
  build = {
    args = {
      "-X",
      "compile",
      "%f",
      "--synctex",
      "--keep-logs",
      "--keep-intermediates",
    },
    executable = "tectonic",
    -- onSave = true,
    -- outputDirectory = nil,
    -- options = {
    --   executable = "latexmk",
    --   args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
    --   onSave = true,
    --   outputDirectory = nil,
    -- },
  },
}
