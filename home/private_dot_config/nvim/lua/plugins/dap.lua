local resolve_python = function(dap)
	local GetPython = require("utils").get_python
	dap = dap or require("dap")
	for k, c in pairs(dap.configurations) do
		if k == "python" then
			for i, v in ipairs(c) do
				if v.python then
					dap.configurations[k][i].python = GetPython()
				else
					dap.configurations[k][i].pythonPath = GetPython()
					-- P(v)
				end
				dap.configurations[k][i].console = "integratedTerminal"
				-- v.pythonPath = GetPython()
			end
		end
	end
end

local dapuiconfig = {
	icons = { expanded = "", collapsed = "", circular = "" },
	-- icons = { expanded = '▾', collapsed = '▸', circular = '' },
	--
	-- mappings = {
	--   -- Use a table to apply multiple mappings
	--   expand = { '<CR>', '<2-LeftMouse>' },
	--   open = 'o',
	--   remove = 'd',
	--   edit = 'e',
	--   repl = 'r',
	--   toggle = 't',
	-- },
	-- Use this to override mappings for specific elements
	element_mappings = {},
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
		{
			elements = {
				{ id = "console", size = 0.70 },
				{ id = "repl", size = 0.30 },
			},
			size = 0.15,
			position = "bottom",
		},
	},
	-- controls = {
	--   enabled = true,
	--   -- Display controls in this element
	--   element = 'repl',
	--   icons = {
	--     pause = '',
	--     play = '',
	--     step_into = '',
	--     step_over = '',
	--     step_out = '',
	--     step_back = '',
	--     run_last = '',
	--     terminate = '',
	--   },
	-- },
	floating = {
		max_height = 0.9,
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		border = "rounded",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
}

return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		after = "nvim-dap",
		dependencies = {
			{ "nvim-neotest/nvim-nio" },
		},
		opts = dapuiconfig,
		-- config = function(plugin, opts)
		--   -- set config from above
		--   opts = vim.tbl_deep_extend('force', opts, dapuiconfig)
		--
		--   -- run default astronvim config function
		--   -- require 'plugins.configs.nvim-dap-ui'(plugin, opts)
		--
		--   local dap = require 'dap'
		--   -- dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
		--   dap.listeners.before.event_terminated['dapui_config'] = nil
		--   dap.listeners.before.event_exited['dapui_config'] = nil
		-- end,
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			-- 'jbyuki/one-small-step-for-vimkind',
			-- 'mfussenegger/nvim-dap-python',
			"nvim-neotest/neotest",
			"nvim-neotest/neotest-python",
		},
		keys = {
			{
				"<leader>dv",
				function()
					require("dap.ext.vscode").load_launchjs()
					resolve_python()
				end,
				desc = "Load vscode launch.json",
			},
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
				desc = "Run Last",
			},
			{
				"<leader>df",
				function()
					require("dap").restart_frame()
				end,
				desc = "Restart",
			},
			{
				"<leader>dc",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			{
				"<leader>dk",
				function()
					require("dap").step_back()
				end,
				desc = "Step Back",
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
				desc = "Get Session",
			},
			{
				"<leader>dj",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dp",
				function()
					require("dap").pause.toggle()
				end,
				desc = "Pause",
			},
			{
				"<leader>dq",
				function()
					require("dap").close()
				end,
				desc = "Quit",
			},
			{
				"<leader>dR",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").clear_breakpoints()
				end,
				desc = "Clear Breakpoints",
			},
			{
				"<leader>dC",
				function()
					require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
				end,
				desc = "Conditional Breakpoint",
			},
			{
				"<leader>dQ",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>st",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
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
				"<leader>dh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Hover Variables",
			},
			-- { '<leader>dS', function() require('dap.ui.widgets').scopes() end, desc = 'Scopes' },
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle UI",
			},
		},
		opts = {
			setup = {},
		},
		config = function(plugin, opts)
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			require("dap.ext.vscode").load_launchjs()

			local dap = require("dap")
			local sign = vim.fn.sign_define

			-- catppuccin
			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

			-- set up debugger
			for k, _ in pairs(opts.setup) do
				opts.setup[k](plugin, opts)
			end

			-- local install_path = require("mason-registry").get_package("codelldb"):get_install_path()
			-- local codelldb_path = install_path .. "/extension/adapter/codelldb"
			-- local liblldb_path = install_path .. "/extension/lldb/liblldb.dylib"
			--

			local mason_path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"

			dap.adapters = {
				python = {
					type = "executable",
					command = require("utils").get_provider_python(),
					args = { "-m", "debugpy.adapter" },
				},
				--   rt_lldb = {
				--     type = 'server',
				--     port = '${port}',
				--     host = '127.0.0.1',
				--     attach = {
				--       pidProperty = 'pid',
				--       pidSelect = 'ask',
				--     },
				--     executable = {
				--       command = codelldb_path,
				--       args = { '--liblldb', liblldb_path, '--port', '${port}' },
				--     },
				--   },
			}

			if pcall(require, "dap-python") then
				local dp = require("dap-python")
				dp.setup(mason_path)
				dp.resolve_python = require("utils").get_python
				dp.test_runner = "pytest"
			end

			resolve_python(dap)
			return opts
		end,
	},
}
