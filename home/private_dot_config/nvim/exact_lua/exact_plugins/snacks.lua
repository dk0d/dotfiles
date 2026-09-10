return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    input = { enabled = true }, -- vim.ui.input
    image = { enabled = true },
    words = { enabled = true }, -- LSP reference highlight + ]] [[ jumps
    notifier = { enabled = true, top_down = false, margin = { top = 2, right = 2, bottom = 0 } },
    picker = {
      ui_select = true, -- vim.ui.select
      matcher = { frecency = true },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n" } },
            ["<C-c>"] = { "close", mode = "i" },
            ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
          },
        },
        list = { keys = { ["<Esc>"] = { "close", mode = { "n" } } } },
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.
•█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪
▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█·
██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌
▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰾹 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            action = function()
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession" })
            end,
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        -- left pane: header, keys, startup
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        {
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        { section = "startup" },
        -- right pane: logo, recent files, git status (collapses under the left pane on narrow windows)
        -- {
        --   pane = 2,
        --   section = "terminal",
        --   enabled = function()
        --     return vim.fn.executable("chafa") == 1
        --   end,
        --   cmd = "chafa "
        --     .. vim.fn.stdpath("config")
        --     .. "/assets/d3c.png --format symbols --symbols vhalf --size 18x9 --stretch; sleep .1",
        --   height = 18,
        --   padding = 1,
        -- },
        {
          pane = 2,
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          cwd = true,
          limit = 8,
          indent = 2,
          padding = 1,
        },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 8,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    -- toggles (<leader>u*)
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ur")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    Snacks.toggle.line_number():map("<leader>un")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.treesitter():map("<leader>uy")
    Snacks.toggle.inlay_hints():map("<leader>uh")
    Snacks.toggle.option("signcolumn", { off = "no", on = "yes:1", name = "Signcolumn" }):map("<leader>ug")
    Snacks.toggle.option("laststatus", { off = 0, on = 3, name = "Statusline" }):map("<leader>ul")
    Snacks.toggle.option("showtabline", { off = 0, on = 2, name = "Tabline" }):map("<leader>ut")
    Snacks.toggle.option("paste", { name = "Paste" }):map("<leader>up")
    Snacks.toggle.option("conceallevel", { off = 0, on = 1, name = "Conceal" }):map("<leader>uS")
    Snacks.toggle({
      name = "Virtual text",
      get = function()
        return vim.diagnostic.config().virtual_text ~= false
      end,
      set = function(s)
        vim.diagnostic.config({ virtual_text = s })
      end,
    }):map("<leader>uv")
    Snacks.toggle({
      name = "Virtual lines",
      get = function()
        return vim.diagnostic.config().virtual_lines ~= false and vim.diagnostic.config().virtual_lines ~= nil
      end,
      set = function(s)
        vim.diagnostic.config({ virtual_lines = s })
      end,
    }):map("<leader>uV")
    Snacks.toggle({
      name = "Notifications",
      get = function()
        return vim.notify ~= vim.print
      end,
      set = function(s)
        vim.notify = s and Snacks.notifier.notify or vim.print
      end,
    }):map("<leader>uN")
    vim.keymap.set("n", "<leader>uD", function()
      Snacks.notifier.hide()
    end, { desc = "Dismiss notifications" })
    vim.keymap.set("n", "<leader>u|", "<cmd>IBLToggle<cr>", { desc = "Toggle indent guides" })
    vim.keymap.set("n", "<leader>uz", "<cmd>HighlightColors Toggle<cr>", { desc = "Toggle color highlight" })
    Snacks.toggle({
      name = "Autoformat",
      get = function()
        return vim.g.autoformat
      end,
      set = function(s)
        vim.g.autoformat = s
      end,
    }):map("<leader>uf")
    Snacks.toggle({
      name = "Completion",
      get = function()
        return vim.b.completion ~= false
      end,
      set = function(s)
        vim.b.completion = s
      end,
    }):map("<leader>uc")
    Snacks.toggle({
      name = "Autopairs",
      get = function()
        return not require("nvim-autopairs").state.disabled
      end,
      set = function(s)
        if s then
          require("nvim-autopairs").enable()
        else
          require("nvim-autopairs").disable()
        end
      end,
    }):map("<leader>ua")
  end,
  keys = {
    -- buffers
    {
      "<leader>c",
      function()
        Snacks.bufdelete()
      end,
      desc = "Close buffer",
    },
    {
      "<leader>C",
      function()
        Snacks.bufdelete({ force = true })
      end,
      desc = "Force close buffer",
    },
    {
      "<leader>bc",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Close other buffers",
    },
    {
      "<leader>bC",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Close all buffers",
    },
    {
      "<leader>bD",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Pick buffer (dd to close)",
    },
    {
      "<leader>h",
      function()
        Snacks.dashboard()
      end,
      desc = "Dashboard",
    },
    -- find
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep Word",
      mode = { "n", "x" },
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    {
      "<leader>fe",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>ft",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "Todo comments",
    },
    {
      "<leader>fF",
      function()
        Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } })
      end,
      desc = "Fixmes",
    },
    {
      "<leader>fT",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "Todo comments",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help",
    },
    {
      "<leader>fl",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer lines",
    },
    {
      "<leader>fm",
      function()
        Snacks.picker.man()
      end,
      desc = "Man pages",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo history",
    },
    {
      "<leader>fC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fa",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find config files",
    },
    {
      "<leader>fO",
      function()
        Snacks.picker.recent({ filter = { cwd = true } })
      end,
      desc = "Recent (cwd)",
    },
    {
      "<leader>fW",
      function()
        Snacks.picker.grep({ hidden = true, ignored = true })
      end,
      desc = "Grep all files",
    },
    {
      "<leader>f'",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>f<CR>",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume last picker",
    },
    -- search
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search History",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sL",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Plugin Specs",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    {
      '<leader>sr"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    -- lsp
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Previous reference",
      mode = { "n", "t" },
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto Type Definition",
    },
    -- git
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>go",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Open in browser",
      mode = { "n", "v" },
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Branches",
    },
    {
      "<leader>gc",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Commits",
    },
    {
      "<leader>gt",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Status",
    },
    {
      "<leader>gC",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Commits (current file)",
    },
    {
      "<leader>gT",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Stash",
    },
    {
      "<leader>tl",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    -- lsp pickers
    {
      "<leader>ls",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>lD",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    -- terminal
    {
      "<leader>tf",
      function()
        Snacks.terminal()
      end,
      desc = "Float terminal",
    },
    {
      "<leader>th",
      function()
        Snacks.terminal(nil, { win = { position = "bottom" } })
      end,
      desc = "Horizontal terminal",
    },
    {
      "<leader>tv",
      function()
        Snacks.terminal(nil, { win = { position = "right", width = 64 } })
      end,
      desc = "Vertical terminal",
    },
    {
      "<leader>vv",
      function()
        Snacks.terminal(nil, { win = { position = "right", width = 64 } })
      end,
      desc = "Vertical terminal",
    },
    {
      "<leader>tp",
      function()
        Snacks.terminal("python")
      end,
      desc = "Python terminal",
    },
    {
      "<leader>tn",
      function()
        Snacks.terminal("node")
      end,
      desc = "Node terminal",
    },
    {
      "<leader>tt",
      function()
        Snacks.terminal("btm")
      end,
      desc = "btm terminal",
    },
    {
      "<C-\\>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle float terminal",
      mode = { "n", "t" },
    },
  },
}
