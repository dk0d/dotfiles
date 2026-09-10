return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = { { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" } },
    init = function()
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  { "zadirion/Unreal.nvim", ft = "cpp", dependencies = { "tpope/vim-dispatch" } },
}
