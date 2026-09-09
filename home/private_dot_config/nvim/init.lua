vim.loader.enable()

-- order matters: options before plugins (leader), lsp after plugins (mason puts servers on PATH)
require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = { colorscheme = { "catppuccin-mocha" } },
  ui = { backdrop = 100 },
  checker = { enabled = false },
  change_detection = { notify = false },
  performance = {
    rtp = { disabled_plugins = { "gzip", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin" } },
  },
})

require("keymaps")
require("autocmds")
require("lsp")
