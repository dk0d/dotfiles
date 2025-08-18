-- Example customization of Null-LS sources
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  main = "null-ls",
  event = "VeryLazy",
  specs = {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
      "AstroNvim/astrolsp",
      event = "VeryLazy",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>lI"] = {
          "<Cmd>NullLsInfo<CR>",
          desc = "Null-ls information",
          cond = function()
            return vim.fn.exists(":NullLsInfo") > 0
          end,
        }
      end,
    },
  },
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      dependencies = { "williamboman/mason.nvim" },
      cmd = { "NullLsInstall", "NullLsUninstall" },
      opts_extend = { "ensure_installed" },
      event = "VeryLazy",
      opts = {
        ensure_installed = {},
        handlers = {
          biome = function(source, methods)
            local cwd = (vim.loop and vim.loop.cwd and vim.loop.cwd()) or vim.fn.getcwd()
            local has_biome = require("null-ls.utils").root_pattern("biome.json", "biome.jsonc")(cwd) ~= nil
            if has_biome then
              require("mason-null-ls").default_setup(source, methods)
            end
          end,
          prettierd = function(source, methods)
            local cwd = (vim.loop and vim.loop.cwd and vim.loop.cwd()) or vim.fn.getcwd()
            local has_pkg = require("null-ls.utils").root_pattern("package.json", "tsconfig.json", "jsconfig.json")(cwd)
              ~= nil
            local has_biome = require("null-ls.utils").root_pattern("biome.json", "biome.jsonc")(cwd) ~= nil
            local has_prettier = has_pkg and not has_biome
            if has_prettier then
              require("mason-null-ls").default_setup(source, methods)
            end
          end,
        },
        sources = {},
      },
      config = function(...)
        require("astronvim.plugins.configs.mason-null-ls")(...)
      end,
    },
  },
}
