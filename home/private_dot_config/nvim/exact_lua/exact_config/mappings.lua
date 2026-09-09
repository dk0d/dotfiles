-- astrocore mappings; plugin-specific keys live in their plugin spec (`keys = {}`)
return {
  v = {
    ["J"] = { "<cmd> m '>+1<cr>gv=gv", desc = "Move line down" },
    ["K"] = { "<cmd> m '<-2<cr>gv=gv", desc = "Move line up" },
    ["<"] = { "<gv", desc = "Indent left" },
    [">"] = { ">gv", desc = "Indent right" },
  },
  n = {
    -- recenter after jumps
    ["n"] = { "nzzzv", desc = "Search next and recenter" },
    ["N"] = { "Nzzzv", desc = "Search previous and recenter" },
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll down and recenter" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll up and recenter" },
    ["<C-o>"] = { "<C-o>zz", desc = "Go to previous location and center" },
    ["<C-i>"] = { "<C-i>zz", desc = "Go to next location and center" },

    -- windows
    ["<A-Left>"] = { "<cmd>vertical resize +2<cr>", desc = "Resize window left" },
    ["<A-Right>"] = { "<cmd>vertical resize -2<cr>", desc = "Resize window right" },
    ["<M-,>"] = { "<c-w>5>", desc = "Shift split left 5" },
    ["<M-.>"] = { "<c-w>5<", desc = "Shift split right 5" },
    ["<M-k>"] = { "<C-W>+", desc = "Shift split up" },
    ["<M-j>"] = { "<C-W>-", desc = "Shift split down" },

    ["<leader><leader>"] = { "<cmd>nohl<cr>", desc = "Clear search" },
    ["<leader>L"] = { "<cmd>Lazy<cr>", desc = "Lazy" },
    ["<C-q>"] = { "<cmd>xall<cr>", desc = "save and quit all" },
    ["<leader>pt"] = { "<Plug>PlenaryTestFile", desc = "Plenary test file" },
    ["<leader>va"] = { "ggVG", desc = "Select all in buffer" },
    ["<leader>uh"] = {
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        vim.notify("Inlay Hints: " .. tostring(vim.lsp.inlay_hint.is_enabled()))
      end,
      desc = "Toggle inlay hints",
    },

    -- buffers / tabs
    ["<leader>bb"] = false,
    ["<leader>bd"] = false,
    ["<leader>b\\"] = false,
    ["<leader>b|"] = false,
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astroui.status.heirline").buffer_picker(function(bufnr)
          require("astrocore.buffer").close(bufnr)
        end)
      end,
      desc = "Pick to close",
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

    -- jupyter.nvim
    ["<leader>jqt"] = { "<cmd>JupyterConnect<cr>", desc = "Connect to QtConsole" },
    ["<leader>jf"] = { "<cmd>JupyterRunFile<cr>", desc = "Run Current File" },
    ["<leader>jc"] = { "<cmd>JupyterSendCell<cr>", desc = "Run Current Cell" },
    ["<leader>jg"] = { "<cmd>JupyterSendCell<cr>]czz", desc = "Run Current Cell and move to next cell" },
    ["<leader>jo"] = { "<cmd><Plug>JupyterRunTextObj<cr>", desc = "Run Text Object" },
    ["<leader>jv"] = { "<cmd><Plug>JupyterRunVisual<cr>", desc = "Run Visual" },

    -- lsp / diagnostics
    ["<leader>fd"] = {
      function()
        vim.lsp.buf.format(require("astrolsp").format_opts)
      end,
      desc = "Format code",
    },
    ["<leader>fi"] = {
      function()
        vim.lsp.buf.code_action({ context = { only = { "source.fixAll" }, diagnostics = {} }, apply = true })
      end,
      desc = "Fix all code actions",
    },
    ["<leader>lL"] = { "<cmd>LspRestart<cr>", desc = "Restart LSP" },
    ["ge"] = {
      function()
        vim.diagnostic.jump({ count = 1, float = true, wrap = true })
      end,
      desc = "Diagnostic goto next",
    },
    ["gE"] = {
      function()
        vim.diagnostic.jump({ count = -1, float = true, wrap = true })
      end,
      desc = "Diagnostic goto previous",
    },

    -- terminal
    ["<leader>vv"] = { "<cmd> ToggleTerm direction='vertical' size=64<cr>", desc = "Vertical Terminal" },
    ["<C-\\>"] = { "<cmd> ToggleTerm direction='float'<cr>", desc = "Float Terminal" },

    -- git
    ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
    ["<leader>gf"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Open DiffView File History" },
  },
}
