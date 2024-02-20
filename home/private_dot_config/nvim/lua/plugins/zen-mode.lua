return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  config = function() require("zen-mode").setup {} end,
  opts = {
    window = {
      width = 400,
    },
    -- plugins = {
    -- 	wezterm = {
    -- 		enabled = true,
    -- 		font = "+4",
    -- 	},
    -- },
  },
  keys = {
    {
      "<leader>zm",
      function() require("zen-mode").toggle {} end,
      desc = "Zen Mode",
    },
  },
}
