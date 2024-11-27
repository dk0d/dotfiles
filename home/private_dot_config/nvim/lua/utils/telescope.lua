local M = {}

M.is_git_dir = function()
  vim.fn.system "git rev-parse --is-inside-work-tree"
  return vim.v.shell_error == 0
end

M.smart_find_files = function(opts)
  -- if M.is_git_dir() then
  -- opts = vim.tbl_deep_extend("force", opts or {}, { git_command = "fd --type file" })
  -- require("telescope.builtin").find_files(opts)
  -- require("telescope.builtin").git_files(opts)
  -- else
  require("telescope.builtin").find_files(opts)
  -- end
end

return M
