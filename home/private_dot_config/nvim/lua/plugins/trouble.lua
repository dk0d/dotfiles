local prefix = "<leader>t"
return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    {
      prefix .. "X",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Workspace Diagnostics",
    },
    {
      prefix .. "x",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Document Diagnostics",
    },
    {
      prefix .. "x",
      "<cmd>TroubleToggle quickfix<cr>",
      desc = "Quickfix list (Trouble)",
    },
  },
  opts = {
    use_diagnostics_signs = true,
    action_keys = {
      close = { "q", "<esc>" },
      cancel = "<c-e>",
    },
  },
}
