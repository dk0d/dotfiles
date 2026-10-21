return {
  { "neovim/nvim-lspconfig", lazy = false }, -- ships lsp/*.lua defaults; enabling happens in lua/lsp.lua
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
  },
  {
    "mason-org/mason.nvim",
    lazy = false, -- must run before the first LspAttach so its bin dir is on PATH
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    opts = {
      run_on_start = false,
      auto_update = false,
      ensure_installed = {
        "lua-language-server",
        "vim-language-server",
        "stylua",
        "selene",
        "ruff",
        "ty",
        "biome",
        "debugpy",
        "codelldb",
        "taplo",
        "json-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
        "deno",
        "svelte-language-server",
        "prettierd",
        "tree-sitter-cli", -- parser builds for tree-sitter-manager
        "markdown-oxide",
        "tinymist",
        "postgres-language-server",
        "oxfmt",
        "astro-language-server",
        "terraform-ls",
      },
    },
  },
  {
    -- formatters/linters not exposed as LSPs; per-project detection decides which attach
    "nvimtools/none-ls.nvim",
    main = "null-ls",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      local root = require("null-ls.utils").root_pattern
      return {
        sources = {
          null_ls.builtins.formatting.prettierd.with({
            -- Markdown belongs to the oxfmt LSP (after/lsp/oxfmt.lua); claiming it here would
            -- attach null-ls and `format()` would then filter the oxfmt client out.
            disabled_filetypes = { "markdown", "markdown.mdx" },
            -- prettier only if the buffer has a prettier-ish root. biome/oxfmt projects are
            -- handled by their LSPs, which outrank null-ls in `format()`'s priority list, so
            -- we don't need to detect them here.
            runtime_condition = function(params)
              local path = params.bufname
              return (
                root("package.json", "tsconfig.json", "jsconfig.json")(path)
                or root(".prettierrc", ".prettierrc.yaml", ".prettierrc.yml")(path)
              ) ~= nil
            end,
          }),
        },
      }
    end,
    keys = { { "<leader>lI", "<cmd>NullLsInfo<cr>", desc = "None-ls info" } },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = true, -- pulled in by none-ls
    -- everything else installed via mason gets auto-registered (stylua, selene, ...).
    -- these three are opted out: biome/oxlint ship LSPs that outrank null-ls in
    -- `format()`, and prettierd is registered above with its own runtime_condition.
    opts = {
      handlers = {
        biome = function() end,
        oxlint = function() end,
        prettierd = function() end,
      },
    },
  },
}
