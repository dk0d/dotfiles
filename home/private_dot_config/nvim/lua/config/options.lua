-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here

vim.cmd([[colorscheme catppuccin-mocha]])

vim.g.mapleader = " "

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.spell = false
vim.opt.signcolumn = "yes:1" -- less jumping around
vim.opt.wrap = false
-- vim.opt.winbar = "%=%m %f"
vim.opt.foldcolumn = "0"
vim.opt.hidden = false
vim.opt.autowriteall = true
vim.opt.showtabline = 0
vim.opt.expandtab = 1
vim.opt.smartindent = 1
-- vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.completeopt = "menu,menuone,noinsert"

vim.g.resession_enabled = true -- use resession to save and load sessions - disables neovim-session-manager
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
-- vim.g.icons_enabled = false -- disable icons in the UI (disable if no nerd font is available)
--
vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	-- signs = true,
	-- update_in_insert = false,
})
