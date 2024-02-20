-- stable version
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<leader>zp", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" },
  },
  config = function()
    require("no-neck-pain").setup {
      width = 220,
      colors = {
        blend = -0.1,
      },
      buffers = {
        -- backgroundColor = "onedark",
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          fileName = "notes",
          -- set to `nil` to default
          -- to current working directory
          location = nil,
        },
        bo = {
          filetype = "md",
        },
      },
    }
  end,
}
