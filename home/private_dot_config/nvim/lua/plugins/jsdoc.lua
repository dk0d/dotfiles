return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  keys = {
    {
      "<leader>Dc",
      function()
        require("neogen").generate({ type = "class" })
      end,
      desc = "Generate class docstring",
    },
    {
      "<leader>Df",
      function()
        require("neogen").generate({ type = "func" })
      end,
      desc = "Generate func docstring",
    },
    {
      "<leader>Dt",
      function()
        require("neogen").generate({ type = "type" })
      end,
      desc = "Generate type docstring",
    },
    {
      "<leader>Dl",
      function()
        require("neogen").generate({ type = "file" })
      end,
      desc = "Generate file docstring",
    },
  },
}
