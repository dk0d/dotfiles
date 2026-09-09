---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = { large_buf = { enabled = false } },
    options = {
      opt = {
        updatetime = 250,
        timeoutlen = 400,
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes:1", -- less jumping around
        wrap = false,
        foldcolumn = "0",
        hidden = false,
        autowriteall = true,
        showtabline = 0,
        expandtab = true,
        smartindent = true,
        smartcase = true,
        ignorecase = true,
        completeopt = "menu,menuone,noinsert",
        conceallevel = 1,
      },
      g = {
        ipy_celldef = "^#\\s*%%",
        python3_host_prog = require("utils").get_provider_python(),
      },
    },
    mappings = require("config.mappings"),
  },
}
