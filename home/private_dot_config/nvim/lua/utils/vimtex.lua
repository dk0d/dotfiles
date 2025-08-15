local M = {}

function M.compiler_xelatex()
  vim.g.vimtex_compiler_method = "latexmk"
  vim.g.vimtex_compiler_latexmk = {
    build_dir = "build",
    engine = "-xelatex",
    options = { "-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode" },
    continuous = 1,
    executable = "latexmk",
  }
  vim.notify("vimtex compiler set to xelatex")
end

function M.compiler_pdflatex()
  vim.g.vimtex_compiler_method = "latexmk"
  vim.g.vimtex_compiler_latexmk = {
    build_dir = "build",
    engine = "-pdf",
    options = { "-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode" },
    continuous = 1,
    executable = "latexmk",
  }
  vim.notify("vimtex compiler set to pdflatex")
end

function M.compiler_tectonic()
  vim.g.vimtex_compiler_method = "tectonic"
  vim.g.vimtex_compiler_latexmk = {
    build_dir = "build",
    engine = "-pdf",
    options = { "-X", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir build" },
    continuous = 1,
    executable = "tectonic",
  }
  vim.notify("vimtex compiler set to tectonic")
end

function M.status()
  local status = "Vimtex Compiler: "
    .. vim.g.vimtex_compiler_method
    .. "("
    .. vim.g.vimtex_compiler_latexmk.engine
    .. ")"
  vim.notify(status)
end

return M
