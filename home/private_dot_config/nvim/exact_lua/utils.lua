local M = {}

M.path_exists = function(path)
  local stat = vim.uv.fs_stat(path)
  return stat and stat.type or false
end

M.is_empty = function(s)
  return s == nil or s == ""
end

-- Shared by Neo-tree and Snacks Explorer.
M.copy_path = function(filepath)
  local modify = vim.fn.fnamemodify
  local filename = modify(filepath, ":t")
  local vals = {
    ["BASENAME"] = modify(filename, ":r"),
    ["EXTENSION"] = modify(filename, ":e"),
    ["FILENAME"] = filename,
    ["PATH (CWD)"] = modify(filepath, ":."),
    ["PATH (HOME)"] = modify(filepath, ":~"),
    ["PATH"] = filepath,
    ["URI"] = vim.uri_from_fname(filepath),
  }
  local options = vim.tbl_filter(function(k)
    return vals[k] ~= ""
  end, vim.tbl_keys(vals))
  table.sort(options)
  vim.ui.select(options, {
    prompt = "Copy to clipboard:",
    format_item = function(k)
      return ("%s: %s"):format(k, vals[k])
    end,
  }, function(choice)
    if choice and vals[choice] then
      vim.fn.setreg("+", vals[choice])
      vim.notify(("Copied: `%s`"):format(vals[choice]))
    end
  end)
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
  local uv_pynvim = vim.fn.expand("~/.local/share/uv/tools/pynvim/bin/python")
  if M.path_exists(uv_pynvim) then
    return uv_pynvim
  elseif not M.is_empty(vim.env.CONDA_PYTHON_EXE) then
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
