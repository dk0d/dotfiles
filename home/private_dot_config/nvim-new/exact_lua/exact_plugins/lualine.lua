local function lsp_clients()
  local names = {}
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    names[#names + 1] = c.name
  end
  return table.concat(names, " ")
end

local function venv()
  local v = vim.env.VIRTUAL_ENV or vim.env.CONDA_DEFAULT_ENV
  return v and (" " .. vim.fn.fnamemodify(v, ":t")) or ""
end

local function recording()
  local r = vim.fn.reg_recording()
  return r ~= "" and ("󰑊 @" .. r) or ""
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = { theme = "catppuccin", globalstatus = true, section_separators = "", component_separators = "│" },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { recording, "searchcount", lsp_clients, venv },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
