-- statusline modelled on AstroNvim's heirline layout:
-- mode | branch  file  diff  diagnostics | macro / search | lsp  venv  treesitter | position | scrollbar

local function lsp_clients()
  local names = {}
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if c.name ~= "null-ls" then
      names[#names + 1] = c.name
    end
  end
  return #names > 0 and (" " .. table.concat(names, " ")) or ""
end

local function venv()
  local v = vim.env.VIRTUAL_ENV or vim.env.CONDA_DEFAULT_ENV
  return v and (" " .. vim.fn.fnamemodify(v, ":t")) or ""
end

local function treesitter()
  return vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] and " TS" or ""
end

local function recording()
  local r = vim.fn.reg_recording()
  return r ~= "" and (" @" .. r) or ""
end

local function scrollbar()
  local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁" } -- full at top of file, empty at bottom
  local cur, total = vim.api.nvim_win_get_cursor(0)[1], vim.api.nvim_buf_line_count(0)
  local i = math.floor((cur - 1) / total * #chars) + 1
  return chars[i]:rep(2)
end

local function gitsigns_diff()
  local s = vim.b.gitsigns_status_dict
  return s and { added = s.added, modified = s.changed, removed = s.removed } or nil
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local C = require("catppuccin.palettes").get_palette("mocha")
    return {
      options = {
        theme = "catppuccin-mocha",
        globalstatus = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function()
              return " "
            end,
            padding = 0,
          },
        }, -- coloured block, no text
        lualine_b = {
          { "branch", icon = "", color = { fg = C.mauve, gui = "bold" } },
          { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
          { "filename", path = 1, file_status = false, color = { fg = C.text, gui = "bold" } },
          {
            "diff",
            source = gitsigns_diff,
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = { added = { fg = C.green }, modified = { fg = C.yellow }, removed = { fg = C.red } },
          },
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            diagnostics_color = {
              error = { fg = C.red },
              warn = { fg = C.yellow },
              info = { fg = C.sky },
              hint = { fg = C.teal },
            },
          },
        },
        lualine_c = { -- centered like heirline's cmd_info
          "%=",
          { recording, color = { fg = C.red, gui = "bold" } },
          { "searchcount", color = { fg = C.peach } },
          { "%S", color = { fg = C.overlay1 } },
        },
        lualine_x = {
          { lsp_clients, color = { fg = C.blue } },
          { venv, color = { fg = C.yellow } },
          { treesitter, color = { fg = C.green } },
        },
        lualine_y = {
          { "location", icon = "", color = { fg = C.lavender } },
          { "progress", color = { fg = C.subtext0 } },
        },
        lualine_z = { { scrollbar, padding = 0 } },
      },
      inactive_sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
      },
    }
  end,
}
