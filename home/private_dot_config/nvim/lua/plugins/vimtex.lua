return {
  "lervag/vimtex",
  config = function()
    -- PDF Viewer:
    -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
    -- vim.g.vimtex_view_method = "zathura"

    vim.g.vimtex_quickfix_mode = 0

    -- Ignore mappings
    vim.g.vimtex_mappings_enabled = 1

    -- Auto Indent
    vim.g.vimtex_indent_enabled = 1

    -- Syntax highlighting - handled by treesitter
    vim.g.vimtex_syntax_enabled = 0

    -- Error suppression:
    -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }

    require("utils.vimtex").compiler_tectonic()
    -- vim.g.vimtex_context_pdf_viewer = 'okular'
    -- vim.g.vimtex_complete_enabled = 1
    -- vim.g.vimtex_compiler_progname = 'nvr'
    -- vim.g.vimtex_complete_close_braces = 1
  end,
  ft = { "latex", "tex" },
  opts = {
    syntax = true,
  },
  keys = {
    {
      "<leader>fc",
      "<cmd>Telescope bibtex<cr>",
      desc = "Search Citations",
    },
    {
      "<leader>vc",
      "<cmd>update<cr><cmd>VimtexCompile<cr>",
      desc = "Vimtex Compile Continuous",
    },
    {
      "<leader>vs",
      "<cmd>update<cr><cmd>VimtexCompileSS<cr>",
      desc = "Vimtex Compile Single Shot",
    },
    {
      "<leader>vx",
      function()
        require("user.utils.vimtex").compiler_xelatex()
      end,
      desc = "Set VimTex Compiler to XeLaTex",
    },
    {
      "<leader>vl",
      function()
        require("user.utils.vimtex").compiler_pdflatex()
      end,
      desc = "Set VimTex Compiler to pdflatex",
    },
    {
      "<leader>vt",
      function()
        require("user.utils.vimtex").status()
      end,
      desc = "get compiler status",
    },
  },
}
