return {
  -- mason-lspconfig is optional; keep it event/cmd gated if enabled later
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   version = "^2",
  --   dependencies = { "mason-org/mason.nvim" },
  --   event = { "BufReadPre", "BufNewFile" },
  --   cmd = { "LspInstall", "LspUninstall" },
  --   opts = { ensure_installed = {}, automatic_installation = false },
  --   config = function(_, opts) require("mason-lspconfig").setup(opts) end,
  -- },

  -- Mason core: cmd-only; do not load on startup
  {
    "mason-org/mason.nvim",
    version = "^1",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
  },

  -- Mason Tool Installer: defer and avoid auto work at boot
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua-language-server",
          "vim-language-server",
          "stylua",
          "selene",
          "ruff",
          "pyright",
          "biome",
          "debugpy",
          "codelldb",
          "taplo",
          "jsonls",
          "tailwindcss-language-server",
          "typescript-language-server",
          "denols",
          "svelte-language-server",
          "prettierd",
        },
        -- Optimize startup: manual installs/updates unless invoked
        run_on_start = false,
        auto_update = false,
      })
    end,
  },
}

-- Example customization of mason plugins
---@type LazySpec
-- return {
--   {
--     "williamboman/mason-lspconfig.nvim",
--     opts = function(_, opts)
--       opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
--         "lua_ls",
--         "pyright",
--       })
--     end,
--   },
-- }
