return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    auto_integrations = false, -- the list below is authoritative; skips a plugin scan at startup
    transparent_background = true,
    term_colors = false,
    float = { transparent = true, solid = false },
    custom_highlights = { TreesitterContextBottom = { style = {} } }, -- no underline under the pinned scope
    integrations = {
      blink_cmp = true,
      dadbod_ui = true,
      dap = true,
      dap_ui = true,
      diffview = true,
      flash = true,
      gitsigns = true,
      harpoon = true,
      indent_blankline = { enabled = true, colored_indent_levels = true },
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = { enabled = true },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
        inlay_hints = { background = true },
      },
      neotest = true,
      neotree = true,
      noice = true,
      render_markdown = true,
      semantic_tokens = true,
      snacks = { enabled = true, indent_scope_color = "subtext0" },
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
