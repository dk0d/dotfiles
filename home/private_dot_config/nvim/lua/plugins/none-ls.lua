local Has = {
  package = function(cwd)
    return require("null-ls.utils").root_pattern("package.json", "tsconfig.json", "jsconfig.json")(cwd) ~= nil
  end,
  oxlint = function(cwd)
    return require("null-ls.utils").root_pattern(".oxlintrc.json")(cwd) ~= nil
  end,
  oxfmt = function(cwd)
    return require("null-ls.utils").root_pattern(".oxfmtrc.json")(cwd) ~= nil
  end,
  oxlintfmt = function(cwd)
    return require("null-ls.utils").root_pattern(".oxfmtrc.json")(cwd) ~= nil
  end,
  biome = function(cwd)
    return require("null-ls.utils").root_pattern("biome.json", "biome.jsonc")(cwd) ~= nil
  end,
  prettier = function(cwd)
    return require("null-ls.utils").root_pattern(".prettierrc", ".prettierrc.yaml", ".prettierrc.yml")(cwd) ~= nil
  end,
}

function getCwd()
  return (vim.loop and vim.loop.cwd and vim.loop.cwd()) or vim.fn.getcwd()
end

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
      dependencies = { "mason-org/mason.nvim" },
      cmd = { "NullLsInstall", "NullLsUninstall" },
      opts_extend = { "ensure_installed" },
      event = "VeryLazy",
      opts = {
        ensure_installed = {},
        handlers = {
          oxlint = function(source, methods)
            local cwd = getCwd()
            local has_oxlint = Has.oxlint(cwd)
            if has_oxlint then
              require("mason-null-ls").default_setup(source, methods)
            end
          end,
          biome = function(source, methods)
            local cwd = getCwd()
            local has_biome = Has.biome(cwd)
            if has_biome then
              require("mason-null-ls").default_setup(source, methods)
            end
          end,
          prettierd = function(source, methods)
            local cwd = getCwd()
            local has_prettier = (Has.package(cwd) or Has.prettier(cwd))
              and (not Has.biome(cwd) and not Has.oxlintfmt(cwd))
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
