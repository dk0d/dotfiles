local function latexmk(engine)
  return function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      engine = engine,
      options = { "-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode" },
      continuous = 1,
      executable = "latexmk",
    }
    vim.notify("vimtex compiler set to latexmk " .. engine)
  end
end

return {
  "lervag/vimtex",
  ft = { "latex", "tex" },
  init = function()
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_mappings_enabled = 1
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_log_ignore = { "Underfull", "Overfull", "specifier changed to", "Token not allowed in a PDF string" }
    vim.g.vimtex_compiler_method = "tectonic"
    vim.g.vimtex_compiler_tectonic =
      { options = { "-X", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir build" } }
  end,
  keys = {
    { "<leader>vc", "<cmd>update<cr><cmd>VimtexCompile<cr>", desc = "Vimtex compile (continuous)" },
    { "<leader>vs", "<cmd>update<cr><cmd>VimtexCompileSS<cr>", desc = "Vimtex compile (single shot)" },
    { "<leader>vx", latexmk("-xelatex"), desc = "Compiler: xelatex" },
    { "<leader>vl", latexmk("-pdf"), desc = "Compiler: pdflatex" },
    {
      "<leader>vt",
      function()
        vim.notify("Vimtex compiler: " .. vim.g.vimtex_compiler_method)
      end,
      desc = "Compiler status",
    },
  },
}
