return {
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    ft = { "qf" },
    dependencies = {
      "junegunn/fzf",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "yorickpeterse/nvim-pqf",
    event = "VeryLazy",
    config = function(_, opts) require("pqf").setup(opts) end,
  },
}
