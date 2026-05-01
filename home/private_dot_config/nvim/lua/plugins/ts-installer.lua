return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      -- Default Options
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "rust",
        -- "swift", -- remove on linux
        "markdown",
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
        "jsonc",
        "toml",
        "zig",
        "csv",
        "go",
        "fish",
        "yaml",
        "dockerfile",
        "fga",
      }, -- list of parsers to install at the start of a neovim session
      -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
      -- auto_install = false, -- if enabled, install missing parsers when editing a new file
      -- highlight = true, -- treesitter highlighting is enabled by default
      languages = {
        fga = {
          install_info = {
            url = "https://github.com/matoous/tree-sitter-fga/",
            branch = "main",
            use_repo_queries = true,
          },
        },
      }, -- override or add new parser sources
      -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
      -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
    })
  end,
}
