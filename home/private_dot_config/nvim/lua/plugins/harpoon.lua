return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        -- save_on_change = true,
      },
    }
    require("telescope").load_extension "harpoon"
  end,
  keys = {
    { "<leader>k", desc = "Harpoon" },
    {
      "<leader>ka",
      function()
        local harpoon = require "harpoon"
        harpoon:list():append()
      end,
      desc = "Harpoon mark",
    },
    {
      "<leader>ks",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon UI",
    },
    {
      "<leader>k1",
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(1)
      end,
      desc = "Harpoon File 1",
    },
    {
      "<leader>k2",
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(2)
      end,
      desc = "Harpoon File 2",
    },
    {
      "<leader>k3",
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(3)
      end,
      desc = "Harpoon File 3",
    },
    {
      "<leader>k4",
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(4)
      end,
      desc = "Harpoon File 4",
    },
    {
      "<leader>k5",
      function()
        local harpoon = require "harpoon"
        harpoon:list():select(5)
      end,
      desc = "Harpoon File 5",
    },
  },
}
