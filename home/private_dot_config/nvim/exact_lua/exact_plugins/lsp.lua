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
        "marksman",
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
    opts = { sources = {} },
    keys = { { "<leader>lI", "<cmd>NullLsInfo<cr>", desc = "None-ls info" } },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    lazy = true, -- pulled in by none-ls
    opts = function()
      local root = function(...)
        local p = require("null-ls.utils").root_pattern(...)
        return function()
          return p(vim.uv.cwd()) ~= nil
        end
      end
      local has = {
        package = root("package.json", "tsconfig.json", "jsconfig.json"),
        oxlint = root(".oxlintrc.json"),
        oxfmt = root(".oxfmtrc.json"),
        biome = root("biome.json", "biome.jsonc"),
        prettier = root(".prettierrc", ".prettierrc.yaml", ".prettierrc.yml"),
      }
      local when = function(pred)
        return function(source, methods)
          if pred() then
            require("mason-null-ls").default_setup(source, methods)
          end
        end
      end
      return {
        handlers = {
          oxfmt = when(has.oxfmt),
          oxlint = when(has.oxlint),
          biome = when(has.biome),
          prettierd = when(function()
            return (has.package() or has.prettier()) and not has.biome() and not has.oxfmt()
          end),
        },
      }
    end,
  },
}
