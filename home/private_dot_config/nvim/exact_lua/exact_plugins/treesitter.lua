return {
  {
    "romus204/tree-sitter-manager.nvim", -- needs the tree-sitter CLI (mason: tree-sitter-cli)
    lazy = false,
    opts = {
      highlight = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "rust",
        "markdown",
        "markdown_inline",
        "typescript",
        "javascript",
        "svelte",
        "sql",
        "html",
        "tsx",
        "bash",
        "css",
        "jsdoc",
        "json",
        "toml",
        "zig",
        "csv",
        "go",
        "fish",
        "yaml",
        "dockerfile",
        "fga",
      },
      languages = {
        fga = {
          install_info = { url = "https://github.com/dk0d/tree-sitter-fga/", branch = "main", use_repo_queries = true },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = { max_lines = 3, multiline_threshold = 20, trim_scope = "outer", mode = "cursor", separator = "-" },
  },
  { "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
}
