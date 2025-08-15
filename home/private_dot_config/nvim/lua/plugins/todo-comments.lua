return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIXME<cr>", desc = "Find TODOs and FIXMEs" },
    { "<leader>fF", "<cmd>TodoTelescope keywords=FIXME<cr>", desc = "Find TODOs and FIXMEs" },
  },
  config = function()
    require("todo-comments").setup({
      signs = true,
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" },
          -- alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" },
          -- signs = false,
        },
        DONE = {
          icon = " ",
          color = "done",
          alt = { "DONE", "COMPLETE" },
          -- signs = false,
        },
        MAYBE = {
          icon = " ",
          color = "warning",
          alt = { "MAYBE", "PERHAPS", "POSSIBLY" },
          -- signs = false,
        },
        TODO = {
          icon = "󰦕 ",
          color = "info",
          alt = { "TODO" },
          -- signs = false,
        },
        HACK = {
          icon = " ",
          color = "warning",
          alt = { "HACK", "TRICK", "HACKY", "HACKED" },
          -- signs = false,
        },
        WARN = {
          icon = " ",
          color = "warning",
          alt = { "WARNING", "WARN", "WTF" },
          -- signs = false,
        },
        PERF = {
          icon = " ",
          color = "warning",
          alt = { "PERF", "OPTIM", "OPTIMIZE", "PERFORMANCE", "OPTIMISE" },
          -- signs = false,
        },
        NOTE = {
          icon = " ",
          color = "hint",
          alt = { "NOTE" },
          -- signs = false,
        },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },

      colors = {
        done = { "DiagnosticOk", "#10B981" },
      },

      -- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      -- warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
      -- info = { "DiagnosticInfo", "#2563EB" },
      -- hint = { "DiagnosticHint", "#10B981" },
      -- default = { "Identifier", "#7C3AED" },
      -- test = { "Identifier", "#FF00FF" },

      highlight = {
        multiline = true,
        multiline_context = 10,
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "wide" or "italic" or "bold" or "bold italic"
        after = "fg", -- "fg" or "bg" or empty
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    })
  end,
}
