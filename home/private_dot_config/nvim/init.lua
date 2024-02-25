-- -----------------------------------------------
-- Setup lazy
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or vim.loop.fs_stat(lazypath)) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local lazy_loaded, lazy = pcall(require, "lazy") -- validate that lazy is available
if not lazy_loaded then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

--- Open a URL under the cursor with the current operating system (Supports Mac OS X and *nix)
-- @param path the path of the file to open with the system opener
function SystemOpen(path)
  path = path or vim.fn.expand "<cfile>"
  if vim.fn.has "mac" == 1 then
    -- if mac use the open command
    vim.fn.jobstart({ "open", path }, { detach = true })
  elseif vim.fn.has "unix" == 1 then
    -- if unix then use xdg-open
    vim.fn.jobstart({ "xdg-open", path }, { detach = true })
  else
    -- if any other operating system notify the user that there is currently no support
    vim.notify("System open is not supported on this OS!", "error")
  end
end
-- Setup lazy
-- -----------------------------------------------

-- bootstrap lazy.nvim, AstroNvim, and user plugins
require "config.lazy"
require "config.options"

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  local m = require("plenary.reload").reload_module(...)
  return m
end

R = function(name)
  RELOAD(name)
  return require(name)
end


-- run polish file at the very end
pcall(require, "config.polish")
