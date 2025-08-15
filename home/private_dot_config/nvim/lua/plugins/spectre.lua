return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },
  build = false,
  cmd = "Spectre",
  config = {
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = {
          "-i",
          "",
          "-E",
        },
      },
    },
  },
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    {
      "<leader>sp",
      function()
        require("spectre").toggle()
      end,
      desc = "Toggle Spectre (Find & Replace)",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Spectre Search Current Word",
    },

    {
      "<leader>sf",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Spectre Search Current Word, Current File",
    },
  },
}
