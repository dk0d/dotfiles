return {
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      ---@diagnostic disable: missing-fields
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = {
              justMyCode = false,
              console = "integratedTerminal",
            },
            args = { "--log-level", "DEBUG", "--quiet", "-s" },
            runner = "pytest",
          }),
          require("neotest-rust")({
            -- dap_adapter = "rt_lldb",
            args = { "--nocapture" },
          }),
        },
        summary = {
          animated = true,
          enabled = true,
          expand_errors = true,
          follow = true,
          open = "topleft vsplit | vertical resize 50",
        },
      })
    end,
    keys = {
      {
        "<leader>tm",
        function()
          require("neotest").run.run()
        end,
        desc = "Test Method",
      },
      {
        "<leader>tM",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Test Method DAP",
      },
      {
        "<leader>tc",
        function()
          require("neotest").run.run({ vim.fn.expand("%") })
        end,
        desc = "Test Class",
      },
      {
        "<leader>tC",
        function()
          require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end,
        desc = "Test Class DAP",
      },
      {
        "<leader>tS",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test Summary",
      },
      {
        "<leader>tP",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Test Output Panel",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Test Output",
      },
    },
  },
}
