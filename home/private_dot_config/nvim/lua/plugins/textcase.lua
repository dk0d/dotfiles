return {
  "johmsalas/text-case.nvim",
  event = "VeryLazy",
  config = function()
    require("textcase").setup({})
    -- require("telescope").load_extension("textcase")
    vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
    vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
  end,
  keys = {
    {
      "gac",
      ":lua require('textcase').current_word('to_camel_case')<cr>",
      desc = "Current word to camel case",
      mode = "n",
    },
    {
      "gaC",
      ":lua require('textcase').lsp_rename('to_camel_case')<cr>",
      desc = "Operator to camel case",
      mode = "n",
    },
    -- { "gtc", ":lua require('textcase').operator('to_camel_case')<cr>", desc = "operator to camel case", mode = "n" },
    {
      "gas",
      ":lua require('textcase').current_word('to_snake_case')<cr>",
      desc = "Current word to snake case",
      mode = "n",
    },
    {
      "gaS",
      ":lua require('textcase').lsp_rename('to_snake_case')<cr>",
      desc = "Operator to snake case",
      mode = "n",
    },
    -- { "gts", ":lua require('textcase').operator('to_snake_case')<cr>", desc = "operator to camel case", mode = "n" },
  },
}
