local M = {}

M.path_exists = function(filename)
  local stat = vim.uv.fs_stat(filename)
  return stat and stat.type or false
end

M.is_empty = function(s)
  return s == nil or s == ""
end

M.get_python = function()
  if not M.is_empty(os.getenv("VIRTUAL_ENV")) then
    return os.getenv("VIRTUAL_ENV") .. "/bin/python"
  elseif not M.is_empty(os.getenv("CONDA_PREFIX")) then
    return os.getenv("CONDA_PREFIX") .. "/bin/python"
  else
    return "python"
  end
end

M.get_provider_python = function()
  if not M.is_empty(os.getenv("CONDA_PYTHON_EXE")) then
    local CONDA_PYTHON_EXE = os.getenv("CONDA_PYTHON_EXE")
    if CONDA_PYTHON_EXE and vim.startswith(CONDA_PYTHON_EXE, "/apps") then
      return M.get_python()
    end
    return os.getenv("CONDA_PYTHON_EXE")
  elseif M.path_exists(os.getenv("HOME") .. "/.config/nvim/venvs/base/bin/python") then
    return os.getenv("HOME") .. "/.config/nvim/venvs/base/bin/python"
  elseif not M.is_empty(os.getenv("VIRTUAL_ENV")) then
    return os.getenv("VIRTUAL_ENV") .. "/bin/python"
  else
    return "python"
  end
end

return M
