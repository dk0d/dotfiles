if true then return {} end
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function() require "utils.evil_lualine" end,
}
