return {
  {
    "stevearc/resession.nvim",
    -- enabled = false,
  },
  {
    "folke/persistence.nvim",
    enabled = false,
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>S.", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>Sd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
