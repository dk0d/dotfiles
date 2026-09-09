return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  -- install jsregexp (optional!).
  -- build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function(plugin, opts)
    require("astronvim.plugins.configs.luasnip")(plugin, opts)
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
  end,
}
