-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here

vim.cmd [[colorscheme kanagawa]]

vim.opt.relativenumber = true -- sets vim.opt.relativenumber
vim.opt.number = true -- sets vim.opt.number
vim.opt.spell = false -- sets vim.opt.spell
vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
vim.opt.wrap = false -- sets vim.opt.wrap
vim.opt.winbar = "%=%m %f"
vim.opt.foldcolumn = "0"
vim.opt.hidden = false
vim.opt.autowriteall = true
vim.opt.showtabline = 0

vim.g.resession_enabled = true -- use resession to save and load sessions - disables neovim-session-manager
vim.g.sonokai_style = "shusia"
vim.g.mapleader = " " -- sets vim.g.mapleader
vim.g.autoformat_enabled = false -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
vim.g.cmp_enabled = true -- enable completion at start
vim.g.autopairs_enabled = true -- enable autopairs at start
vim.g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
vim.g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
vim.g.ui_notifications_enabled = true -- disable notifications when toggling UI elements
vim.g.status_diagnostics_enabled = true -- enable diagnostics in statusline
vim.g.ipy_celldef = "^#\\s*%%"
vim.g.python3_host_prog = require("utils").get_provider_python()

vim.g.use_colemak = false
vim.g.mapleader = " " -- sets vim.g.mapleader
-- vim.g.icons_enabled = false -- disable icons in the UI (disable if no nerd font is available)
--
vim.diagnostic.config {
  underline = true,
  virtual_text = true,
  -- signs = true,
  -- update_in_insert = false,
}
