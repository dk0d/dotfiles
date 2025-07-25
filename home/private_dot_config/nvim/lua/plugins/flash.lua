return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      enabled = false,
    },
    remote_op = {
      restore = false,
      motion = false,
    },
  },
  keys = {
    -- {
    --   "s",
    --   mode = { "n", "x", "o" },
    --   function()
    --     require("flash").jump()
    --   end,
    --   desc = "Flash",
    -- },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
    {
      "<leader>uo",
      mode = { "n" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
