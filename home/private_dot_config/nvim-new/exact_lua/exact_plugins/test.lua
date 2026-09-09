return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },
  keys = {
    {
      "<leader>tm",
      function()
        require("neotest").run.run()
      end,
      desc = "Test nearest",
    },
    {
      "<leader>tM",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Test nearest (dap)",
    },
    {
      "<leader>tc",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Test file",
    },
    {
      "<leader>tC",
      function()
        require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
      end,
      desc = "Test file (dap)",
    },
    {
      "<leader>tS",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Test summary",
    },
    {
      "<leader>tP",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Test output panel",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Test output",
    },
  },
  opts = function()
    return {
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false, console = "integratedTerminal" },
          args = { "--log-level", "DEBUG", "--quiet", "-s" },
          runner = "pytest",
        }),
        require("neotest-rust")({ args = { "--nocapture" } }),
      },
      summary = { animated = true, expand_errors = true, follow = true, open = "topleft vsplit | vertical resize 50" },
    }
  end,
}
