-- return {
--   "github/copilot.vim",
--   event = "VeryLazy",
--   after = "nvim-cmp",
--   keys = {
--     { "<C-)>", "<Plug>(copilot-next)", desc = "copilot next", mode = "i" },
--     { "<C-(>", "<Plug>(copilot-prev)", desc = "copilot prev", mode = "i" },
--     { "<C-i>", "<Plug>(copilot-suggest)", desc = "copilot prev", mode = "i" },
--   },
--   config = function()
--     require("copilot").setup {
--       panel = {
--         enabled = true,
--       },
--     }
--   end,
--   config = function(_, opts)
--     vim.cmd [[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]]
--     -- vim.keymap.set("i", "<C-l>", 'copilot#Accept("<cr>")', { silent = true, expr = true })
--     vim.g.copilot_no_tab_map = true
--     -- vim.g.copilot_no_default_key_mappings = true
--     -- vim.g.copilot_assumed_mapped = true
--   end,
--   ft = { "python", "rust", "typescript", "javascript" },
-- }

return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
        accept = "<CR>",
      },
      suggestion = {
        auto_trigger = true,
        enabled = true,
        keymap = {
          accept = "<A-l>",
          prev = "<C-[>",
          next = "<C-]>",
          dismiss = "<C-]>",
        },
      },
    })
  end,
}
