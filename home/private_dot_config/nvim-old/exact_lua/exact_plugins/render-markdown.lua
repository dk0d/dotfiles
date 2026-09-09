return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
  filetypes = { "markdown" },
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  keys = {
    { "<leader>Mt", "<cmd>RenderMarkdown toggle<cr>", desc = "Render Markdown Toggle" },
    { "<leader>Me", "<cmd>RenderMarkdown enable<cr>", desc = "Render Markdown Enable" },
  },
  config = function()
    require("render-markdown").setup({})
  end,
}
