-- core keymaps; plugin keys live in their spec's `keys = {}`, LSP keys in lua/lsp.lua
local map = vim.keymap.set

-- files / quit
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qall<cr>", { desc = "Quit all" })
map("n", "<C-q>", "<cmd>xall<cr>", { desc = "Save and quit all" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force save" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<leader><leader>", "<cmd>nohl<cr>", { desc = "Clear search" })
map("n", "<leader>va", "ggVG", { desc = "Select all" })

-- buffers / tabs
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>tabnew<cr>", { desc = "New tab" })
local function close_side(cmp)
  local cur = vim.api.nvim_get_current_buf()
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[b].buflisted and cmp(b, cur) then
      Snacks.bufdelete(b)
    end
  end
end
map("n", "<leader>bl", function()
  close_side(function(b, c)
    return b < c
  end)
end, { desc = "Close buffers to the left" })
map("n", "<leader>br", function()
  close_side(function(b, c)
    return b > c
  end)
end, { desc = "Close buffers to the right" })
map("n", "<leader>R", function()
  Snacks.rename.rename_file()
end, { desc = "Rename file" })

-- windows
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<A-Left>", "<cmd>vertical resize +2<cr>", { desc = "Resize window left" })
map("n", "<A-Right>", "<cmd>vertical resize -2<cr>", { desc = "Resize window right" })
map("n", "<M-,>", "<c-w>5>", { desc = "Shift split left 5" })
map("n", "<M-.>", "<c-w>5<", { desc = "Shift split right 5" })
map("n", "<M-k>", "<C-W>+", { desc = "Shift split up" })
map("n", "<M-j>", "<C-W>-", { desc = "Shift split down" })

-- motion: recenter after jumps
map("n", "n", "nzzzv", { desc = "Search next and recenter" })
map("n", "N", "Nzzzv", { desc = "Search previous and recenter" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and recenter" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and recenter" })
map("n", "<C-o>", "<C-o>zz", { desc = "Jump back and recenter" })
map("n", "<C-i>", "<C-i>zz", { desc = "Jump forward and recenter" })

-- editing
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })

-- diagnostics
map("n", "ge", function()
  vim.diagnostic.jump({ count = 1, float = true, wrap = true })
end, { desc = "Next diagnostic" })
map("n", "gE", function()
  vim.diagnostic.jump({ count = -1, float = true, wrap = true })
end, { desc = "Previous diagnostic" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Hover diagnostics" })

-- packages
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>ps", "<cmd>Lazy home<cr>", { desc = "Plugins status" })
map("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Plugins install" })
map("n", "<leader>pS", "<cmd>Lazy sync<cr>", { desc = "Plugins sync" })
map("n", "<leader>pu", "<cmd>Lazy check<cr>", { desc = "Plugins check updates" })
map("n", "<leader>pU", "<cmd>Lazy update<cr>", { desc = "Plugins update" })
map("n", "<leader>pm", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<leader>pM", "<cmd>MasonToolsUpdate<cr>", { desc = "Mason tools update" })
map("n", "<leader>pa", function()
  require("lazy").update()
  vim.cmd("MasonToolsUpdate")
end, { desc = "Update Lazy and Mason" })
map("n", "<leader>pt", "<Plug>PlenaryTestFile", { desc = "Plenary test file" })

-- ipython (vim-slime / vim-ipython-cell)
map("n", "<leader>pr", ":SlimeSend1 ipython --matplotlib<cr>", { desc = "Start ipython repl" })
map("n", "<leader>pc", ":IPythonCellExecuteCell<cr>", { desc = "Execute cell" })
map("n", "<leader>pj", ":IPythonCellExecuteCellJump<cr>zz", { desc = "Execute cell and jump" })
map(
  "n",
  "<leader>pe",
  ":SlimeSend1 %load_ext autoreload<cr>:SlimeSend1 %autoreload 2<cr>",
  { desc = "Autoreload magic" }
)
map("n", "]c", ":IPythonCellNextCell<cr>zt", { desc = "Next cell" })
map("n", "[c", ":IPythonCellPrevCell<cr>zt", { desc = "Previous cell" })

-- jupyter-vim
map("n", "<leader>jqt", "<cmd>JupyterConnect<cr>", { desc = "Connect to QtConsole" })
map("n", "<leader>jf", "<cmd>JupyterRunFile<cr>", { desc = "Run file" })
map("n", "<leader>jc", "<cmd>JupyterSendCell<cr>", { desc = "Run cell" })
map("n", "<leader>jg", "<cmd>JupyterSendCell<cr>]czz", { desc = "Run cell and jump" })
map("n", "<leader>jo", "<Plug>JupyterRunTextObj", { desc = "Run text object" })
map({ "n", "v" }, "<leader>jv", "<Plug>JupyterRunVisual", { desc = "Run visual" })
