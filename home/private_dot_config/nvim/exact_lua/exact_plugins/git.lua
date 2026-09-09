return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end
        map("n", "]g", function()
          gs.nav_hunk("next")
        end, "Next hunk")
        map("n", "[g", function()
          gs.nav_hunk("prev")
        end, "Previous hunk")
        map("n", "]G", function()
          gs.nav_hunk("last")
        end, "Last hunk")
        map("n", "[G", function()
          gs.nav_hunk("first")
        end, "First hunk")
        map("n", "<leader>gl", gs.blame_line, "Blame line")
        map("n", "<leader>gL", function()
          gs.blame_line({ full = true })
        end, "Blame line (full)")
        map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>gs", gs.stage_hunk, "Stage/unstage hunk")
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>gD", gs.diffthis, "Diff this")
        map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", "inside hunk")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
      { "<leader>gf", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
    },
  },
}
