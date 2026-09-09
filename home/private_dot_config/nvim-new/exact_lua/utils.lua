local M = {}

M.path_exists = function(path)
  local stat = vim.uv.fs_stat(path)
  return stat and stat.type or false
end

M.is_empty = function(s)
  return s == nil or s == ""
end

-- python for the *project* (venv/conda), used by dap and neotest
M.get_python = function()
  if not M.is_empty(vim.env.VIRTUAL_ENV) then
    return vim.env.VIRTUAL_ENV .. "/bin/python"
  elseif not M.is_empty(vim.env.CONDA_PREFIX) then
    return vim.env.CONDA_PREFIX .. "/bin/python"
  end
  return "python"
end

-- python for the neovim provider (pynvim); the base venv is shared with ~/.config/nvim
M.get_provider_python = function()
  local base = vim.fn.expand("~/.config/nvim/venvs/base/bin/python")
  if not M.is_empty(vim.env.CONDA_PYTHON_EXE) then
    if vim.startswith(vim.env.CONDA_PYTHON_EXE, "/apps") then
      return M.get_python()
    end
    return vim.env.CONDA_PYTHON_EXE
  elseif M.path_exists(base) then
    return base
  elseif not M.is_empty(vim.env.VIRTUAL_ENV) then
    return vim.env.VIRTUAL_ENV .. "/bin/python"
  end
  return "python"
end

return M
