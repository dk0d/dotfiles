return {

  -- Mason Tool Installer: defer and avoid auto work at boot
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    -- event = "VeryLazy",
    -- lazy = true,
    opts = {
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
      },
      -- Optimize startup: manual installs/updates unless invoked
      run_on_start = false,
      auto_update = false,
    },
  },
}
