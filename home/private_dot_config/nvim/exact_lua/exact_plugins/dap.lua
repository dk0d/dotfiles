local ui_layout = {
  icons = { expanded = "", collapsed = "", circular = "" },
  expand_lines = true,
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.15,
      position = "left",
    },
    { elements = { { id = "console", size = 0.70 }, { id = "repl", size = 0.30 } }, size = 0.15, position = "bottom" },
  },
  floating = { max_height = 0.9, max_width = 0.5, border = "rounded", mappings = { close = { "q", "<Esc>" } } },
  render = { max_value_lines = 100 },
}

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" }, opts = ui_layout },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      {
        "<leader>dd",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run last",
      },
      {
        "<leader>df",
        function()
          require("dap").restart_frame()
        end,
        desc = "Restart frame",
      },
      {
        "<leader>dc",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to cursor",
      },
      {
        "<leader>dk",
        function()
          require("dap").step_back()
        end,
        desc = "Step back",
      },
      {
        "<leader>dj",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dq",
        function()
          require("dap").close()
        end,
        desc = "Close",
      },
      {
        "<leader>dQ",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dD",
        function()
          require("dap").disconnect()
        end,
        desc = "Disconnect",
      },
      {
        "<leader>dS",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dR",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ab",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").clear_breakpoints()
        end,
        desc = "Clear breakpoints",
      },
      {
        "<leader>dC",
        function()
          require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
        end,
        desc = "Conditional breakpoint",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        mode = { "n", "v" },
        desc = "Evaluate",
      },
      {
        "<leader>dE",
        function()
          require("dapui").eval(vim.fn.input("[Expression] > "))
        end,
        desc = "Evaluate input",
      },
      {
        "<leader>dE",
        function()
          require("dapui").eval()
        end,
        mode = { "v", "x" },
        desc = "Evaluate selection",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>ds",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to cursor",
      },
      {
        "<leader>dr",
        function()
          require("dap").restart()
        end,
        desc = "Restart",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Hover variables",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle UI",
      },
    },
    config = function()
      local dap = require("dap")
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint" })

      local get_python = require("utils").get_python
      local adapter = vim.fn.expand("$MASON/bin/debugpy-adapter")
      dap.adapters.python = {
        type = "executable",
        command = adapter,
        args = { "-m", "debugpy.adapter" },
        options = { source_filetype = "python" },
      }
      local dp = require("dap-python")
      dp.setup(adapter)
      dp.resolve_python = get_python
      dp.test_runner = "pytest"
      for _, c in ipairs(dap.configurations.python or {}) do
        if c.python then
          c.python = get_python()
        else
          c.pythonPath = get_python()
        end
        c.console = "integratedTerminal"
      end
    end,
  },
}
