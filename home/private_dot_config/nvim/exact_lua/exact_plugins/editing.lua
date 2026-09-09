return {
  { "nvim-mini/mini.ai", event = "VeryLazy", opts = {} },
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "ma",
        delete = "md",
        find = "mf",
        find_left = "mF",
        highlight = "mh",
        replace = "mr",
        update_n_lines = "mn",
        suffix_last = "l",
        suffix_next = "n",
      },
    },
  },
  { "nvim-mini/mini.align", event = "VeryLazy", opts = { mappings = { start = "gm", start_with_preview = "gM" } } },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    -- jk / jj to escape without timeoutlen lag; off in terminal mode so lazygit/shells never eat a fast "jk"
    opts = {
      default_mappings = false, -- the defaults include terminal mode; a mode table can't be disabled once present
      mappings = {
        i = { j = { k = "<Esc>", j = "<Esc>" } },
        v = { j = { k = "<Esc>" } },
        s = { j = { k = "<Esc>" } },
      },
    },
  },
  { "NMAC427/guess-indent.nvim", event = { "BufReadPost", "BufNewFile" }, opts = {} },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  { "yorickpeterse/nvim-pqf", event = "VeryLazy", opts = {} },
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
    keys = { { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Toggle split/join" } },
    opts = { use_default_keymaps = false },
  },
  {
    "johmsalas/text-case.nvim",
    keys = {
      {
        "gac",
        function()
          require("textcase").current_word("to_camel_case")
        end,
        desc = "Word to camelCase",
      },
      {
        "gaC",
        function()
          require("textcase").lsp_rename("to_camel_case")
        end,
        desc = "Rename to camelCase",
      },
      {
        "gas",
        function()
          require("textcase").current_word("to_snake_case")
        end,
        desc = "Word to snake_case",
      },
      {
        "gaS",
        function()
          require("textcase").lsp_rename("to_snake_case")
        end,
        desc = "Rename to snake_case",
      },
    },
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { search = { enabled = false }, remote_op = { restore = false, motion = false } },
    keys = {
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash treesitter search",
      },
      {
        "<leader>uo",
        function()
          require("flash").toggle()
        end,
        desc = "Toggle flash search",
      },
    },
  },
  {
    "danymat/neogen",
    opts = {},
    keys = {
      {
        "<leader>Dc",
        function()
          require("neogen").generate({ type = "class" })
        end,
        desc = "Class docstring",
      },
      {
        "<leader>Df",
        function()
          require("neogen").generate({ type = "func" })
        end,
        desc = "Function docstring",
      },
      {
        "<leader>Dt",
        function()
          require("neogen").generate({ type = "type" })
        end,
        desc = "Type docstring",
      },
      {
        "<leader>Dl",
        function()
          require("neogen").generate({ type = "file" })
        end,
        desc = "File docstring",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        DONE = { icon = " ", color = "done", alt = { "COMPLETE" } },
        MAYBE = { icon = " ", color = "warning", alt = { "PERHAPS", "POSSIBLY" } },
        TODO = { icon = "󰦕 ", color = "info" },
        HACK = { icon = " ", color = "warning", alt = { "TRICK", "HACKY", "HACKED" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "WTF" } },
        PERF = { icon = " ", color = "warning", alt = { "OPTIM", "OPTIMIZE", "PERFORMANCE", "OPTIMISE" } },
        NOTE = { icon = " ", color = "hint" },
        ponytail = { icon = " ", color = "warning", alt = { "PONYTAIL" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      colors = { done = { "DiagnosticOk", "#10B981" } },
      highlight = { multiline = true, multiline_context = 10, keyword = "wide", after = "fg" },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "InsertEnter",
    opts = { render = "background", enable_named_colors = true, enable_tailwind = true },
  },
}
