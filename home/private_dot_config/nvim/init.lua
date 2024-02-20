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
