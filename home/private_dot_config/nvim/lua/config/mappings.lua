-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim for Colemak
if vim.g.use_colemak then
	map("", "n", "j", { desc = "Move cursor down" })
	map("", "e", "k", { desc = "Move cursor up" })
	map("", "i", "l", { desc = "Move cursor right" })
	map("", "l", "i", {})
	map("", "k", "n", {})
	map("", "l", "i", {})
	map("", "K", "N", {})
	map("", "N", "5j", {})
	map("", "E", "5k", {})
	map("", "L", "I", {})
	map("", "H", "0", {})
	map("", "I", "$", {})
end

-- " map <Leader>s to start IPython
--
-- nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
--
-- " map <Leader>r to run script
-- nnoremap <Leader>r :IPythonCellRun<CR>
--
-- " map <Leader>R to run script and time the execution
-- nnoremap <Leader>R :IPythonCellRunTime<CR>
--
-- " map <Leader>c to execute the current cell
-- nnoremap <Leader>c :IPythonCellExecuteCell<CR>
--
-- " map <Leader>C to execute the current cell and jump to the next cell
-- nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>
--
-- " map <Leader>l to clear IPython screen
-- nnoremap <Leader>l :IPythonCellClear<CR>
--
-- " map <Leader>x to close all Matplotlib figure windows
-- nnoremap <Leader>x :IPythonCellClose<CR>
--
-- " map [c and ]c to jump to the previous and next cell header
-- nnoremap [c :IPythonCellPrevCell<CR>
-- nnoremap ]c :IPythonCellNextCell<CR>
--
--

local get_icon = require("astroui").get_icon

return {
	v = {
		["J"] = { "<cmd> m '>+1<cr>gv=gv", desc = "Move line down" },
		["K"] = { "<cmd> m '<-2<cr>gv=gv", desc = "Move line up" },
	},
	-- first key is the mode
	n = {

		["<leader>rp"] = {
			function()
				-- local p = require("nio").ui.input({ prompt = "Package Name: " })
				vim.ui.input({ prompt = "Package Name: " }, function(input)
					if input then
						require("lazy").reload({ plugins = { input } })
					end
				end)
			end,
			desc = "Reload a package",
		},

		["<leader>pt"] = {
			"<Plug>PlenaryTestFile",
			desc = "Plenary test file",
		},

		["<Esc>"] = { "<cmd>nohl<cr>", desc = "Clear search" },

		["<leader>L"] = { "<cmd>Lazy<cr>", desc = "Lazy" },
		["<leader>uh"] = {
			function()
				if vim.version().minor >= 10 then
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					vim.notify("Inlay Hints: " .. tostring(vim.lsp.inlay_hint.is_enabled()))
				end
			end,
			desc = "Toggle inlay hints",
		},

		["<C-q>"] = { "<cmd>xall<cr>", desc = "save and quit all" },

		-- disable tabline navigation
		-- ["<leader>b"] = false,
		["<leader>bb"] = false,
		["<leader>bd"] = false,
		["<leader>b\\"] = false,
		["<leader>b|"] = false,

		["<M-,>"] = { "<c-w>5>", desc = "Shift split left 5" },
		["<M-.>"] = { "<c-w>5<", desc = "Shift split right 5" },
		["<M-k>"] = { "<C-W>+", desc = "Shift split up" },
		["<M-j>"] = { "<C-W>-", desc = "Shift split down" },

		-- Oil
		["<leader>o"] = {
			function()
				require("oil").open()
			end,
			desc = "Open Oil",
		},

		-- ipython
		["<leader>pr"] = { ":SlimeSend1 ipython --matplotlib<cr>", desc = "start ipython repl " },
		["<leader>pc"] = { ":IPythonCellExecuteCell<cr>", desc = "Execute Python Cell" },
		["<leader>pj"] = { ":IPythonCellExecuteCellJump<cr>zz", desc = "Execute Python Cell Jump and recenter" },
		["<leader>pe"] = {
			":SlimeSend1 %load_ext autoreload<cr>:SlimeSend1 %autoreload 2<cr>",
			desc = "Autoreload magic for ipython",
		},
		["]c"] = { ":IPythonCellNextCell<cr>zt", desc = "Next IPython Cell and recenter" },
		["[c"] = { ":IPythonCellPrevCell<cr>zt", desc = "Previous IPython Cell and recenter" },
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader>bD"] = {
			function()
				require("astroui.status.heirline").buffer_picker(function(bufnr)
					require("astronvim.utils.buffer").close(bufnr)
				end)
			end,
			desc = "Pick to close",
		},

		-- Scrolling
		["<c-d>"] = { "<c-d>zz", desc = "scroll and center" },
		["<c-u>"] = { "<c-u>zz", desc = "scroll and center" },
		-- quick save
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

		["<leader>fd"] = {
			function()
				vim.lsp.buf.format(require("astrolsp").format_opts)
			end,
			desc = "Format code",
		},
		["<leader>si"] = {
			function()
				vim.lsp.buf.sort_imports()
			end,
			desc = "Sort Imports",
		},

		-- Vimtex
		-- ["<leader>fc"] = { "<cmd>Telescope bibtex<cr>", desc = "Search Citations" },
		["<leader>vc"] = { "<cmd>update<cr><cmd>VimtexCompile<cr>", desc = "Vimtex Compile Continuous" },
		["<leader>vs"] = { "<cmd>update<cr><cmd>VimtexCompileSS<cr>", desc = "Vimtex Compile Single Shot" },
		["<leader>vx"] = {
			function()
				require("user.utils.vimtex").compiler_xelatex()
			end,
			desc = "Set VimTex Compiler to XeLaTex",
		},
		["<leader>vl"] = {
			function()
				require("user.utils.vimtex").compiler_pdflatex()
			end,
			desc = "Set VimTex Compiler to pdflatex",
		},
		["<leader>vt"] = {
			function()
				require("user.utils.vimtex").status()
			end,
			desc = "get compiler status",
		},

		-- Override AstroNvim Neotree mappings
		["<leader>e"] = { false, desc = get_icon("Session", 1, true) .. "Neotree" },

		-- Override find themes
		-- ["<leader>fe"] = {
		-- 	function()
		-- 		require("telescope.builtin").colorscheme({ enable_preview = true })
		-- 	end,
		-- 	desc = "Find themes",
		-- },

		-- Selection
		["<leader>va"] = { "ggVG", desc = "Select all in buffer" },

		-- ToggleTerm
		["<leader>vv"] = { "<cmd> ToggleTerm direction='vertical' size=64<cr>", desc = "Vertical Terminal" },
		["<C-\\>"] = { "<cmd> ToggleTerm direction='float'<cr>", desc = "Float Terminal" },

		-- Jupyter.nvim
		["<leader>jqt"] = { "<cmd>JupyterConnect<cr>", desc = "Connect to QtConsole" },
		["<leader>jf"] = { "<cmd>JupyterRunFile<cr>", desc = "Run Current File" },
		["<leader>jc"] = { "<cmd>JupyterSendCell<cr>", desc = "Run Current Cell" },
		["<leader>jd"] = { "<cmd>JupyterSendCell<cr>]czz", desc = "Run Current Cell and move to next cell" },
		["<leader>jo"] = { "<cmd><Plug>JupyterRunTextObj<cr>", desc = "Run Text Object" },
		["<leader>jv"] = { "<cmd><Plug>JupyterRunVisual<cr>", desc = "Run Visual" },

		-- Diagnostics
		["ge"] = {
			-- "<cmd> lua vim.diagnostic.goto_next()<cr>",
			function()
				vim.diagnostic.goto_next({ wrap = true, float = true })
			end,
			desc = "Diagnostic goto next",
		},
		["gE"] = {
			-- "<cmd> lua vim.diagnostic.goto_next()<cr>",
			function()
				vim.diagnostic.goto_prev({ wrap = true, float = true })
			end,
			desc = "Diagnostic goto previous",
		},

		-- trigger dashboard
		["<leader>ad"] = {
			"<cmd>Alpha<cr>",
			desc = "Open Alpha Dashboard",
		},

		-- Harpoon
		-- ['<leader>h'] = false, -- remove default

		-- LSP
		-- ["<leader>lW"] = {
		-- 	function()
		-- 		require("telescope.builtin").diagnostics()
		-- 	end,
		-- 	desc = "Search workspace diagnostics",
		-- },
		-- ["<leader>lD"] = {
		-- 	function()
		-- 		require("telescope.builtin").diagnostics({ bufnr = 0 })
		-- 	end,
		-- 	desc = "Search current buffer diagnostics",
		-- },
		["<leader>lL"] = {
			"<cmd>LspRestart<cr>",
			desc = "Restart LSP",
		},
		["<leader>gd"] = {
			"<cmd>DiffviewOpen<cr>",
			desc = "Open DiffView",
		},
		["<leader>gf"] = {
			"<cmd>DiffviewFileHistory<cr>",
			desc = "Open DiffView File History",
		},
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
	},
}
