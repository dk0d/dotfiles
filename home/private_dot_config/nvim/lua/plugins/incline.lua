local detect_project_file = function()
  local files = {
    "svelte.config.ts",
    "svelte.config.js",
  }
  local workingdir = vim.fn.getcwd()
  for _, cfile in ipairs(files) do
    if require("utils").path_exists(workingdir .. "/" .. cfile) then
      return true
    end
  end
  return false
end

local derive_filename = function(bufnr)
  local fullfilename = vim.api.nvim_buf_get_name(bufnr)
  local filename = vim.fn.fnamemodify(fullfilename, ":t")

  -- if in svelte/remix project, return relative to routes
  if detect_project_file() then
    local routesIdx = string.find(fullfilename, "routes")
    if routesIdx then
      filename = string.sub(fullfilename, routesIdx + string.len("routes") + 1)
    end
  end
  if vim.bo[bufnr].modified then
    filename = "[*]" .. filename
  end
  return filename
end

return {
  {
    "b0o/incline.nvim",
    -- dependencies = {
    -- 	{
    -- 		"SmiteshP/nvim-navic",
    -- 		dependencies = { "neovim/nvim-lspconfig" },
    -- 	},
    -- },
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#45475a", guifg = "#bac2de" },
            InclineNormalNC = { guibg = "none", guifg = "#bac2de" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true, only_win = true },
        render = function(props)
          local filename = derive_filename(props.buf)
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
