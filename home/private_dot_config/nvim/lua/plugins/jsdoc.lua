return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  keys = {
    { "<leader>jd", function() require("neogen").generate() end, desc = "Generate DOCStrings" },
  },
}
