local aug = function(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end
local au = vim.api.nvim_create_autocmd

au("TextYankPost", {
  group = aug("yank"),
  callback = function()
    vim.hl.on_yank()
  end,
})

au({ "FocusGained", "TermClose", "TermLeave" }, { group = aug("checktime"), command = "checktime" })

-- nvim 0.12 shows "[Process exited N]" as virtual text in terminal buffers; snacks can't strip it (it scans
-- buffer lines), so it lingers in dashboard terminal sections. Neovim's documented off switch (:h terminal-config).
vim.api.nvim_clear_autocmds({ group = "nvim.terminal", event = "TermClose" })

au("FileType", {
  group = aug("q_close"),
  pattern = { "help", "qf", "man", "checkhealth", "notify", "lspinfo", "startuptime" },
  callback = function(ev)
    vim.bo[ev.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = ev.buf, silent = true })
  end,
})

-- filetypes / treesitter aliases
vim.filetype.add({
  extension = { pcss = "pcss", mdx = "mdx", handlebars = "handlebars", fga = "fga" },
  pattern = { ["%.env%..*"] = "dotenv" },
})
vim.treesitter.language.register("fga", "fga")
vim.treesitter.language.register("css", "pcss")
vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("bash", "dotenv")
vim.treesitter.language.register("html", "handlebars")
