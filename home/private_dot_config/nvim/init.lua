-- Disable unused language providers ASAP
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Enable faster Lua module loader (Neovim >= 0.9)
pcall(function()
  if vim.loader and vim.loader.enable then
    vim.loader.enable()
  end
end)

-- -----------------------------------------------
-- Setup lazy
-- -----------------------------------------------

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },	true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- -----------------------------------------------
-- END Setup lazy
-- -----------------------------------------------

-- bootstrap lazy.nvim, AstroNvim, and user plugins
require("lazy_setup")
if not vim.g.vscode then
  require("config.options")
  require("config.autocmds")
  -- run polish file at the very end
  require("polish")
end
