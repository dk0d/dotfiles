return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>b", group = "buffers", icon = "󰓩" },
        { "<leader>d", group = "debug", icon = "" },
        { "<leader>D", group = "docstrings", icon = "󰈙" },
        { "<leader>f", group = "find", icon = "󰍉" },
        { "<leader>g", group = "git", icon = "󰊢" },
        { "<leader>j", group = "jupyter", icon = "" },
        { "<leader>k", group = "harpoon", icon = "󱡅" },
        { "<leader>l", group = "lsp", icon = "" },
        { "<leader>M", group = "markdown", icon = "󰽛" },
        { "<leader>p", group = "packages / ipython", icon = "󰏖" },
        { "<leader>s", group = "search", icon = "󰍉" },
        { "<leader>S", group = "session", icon = "󱂬" },
        { "<leader>t", group = "terminal / test", icon = "" },
        { "<leader>u", group = "toggles", icon = "󰙵" },
        { "<leader>v", group = "vimtex / select", icon = "󰙩" },
        { "<leader>x", group = "trouble", icon = "󱍼" },
        { "<leader>z", group = "zen", icon = "󰚀" },
      },
    },
  },
  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "mrjones2014/smart-splits.nvim", -- tmux-aware window navigation/resizing
    event = "VeryLazy",
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left split",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to below split",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to above split",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right split",
      },
      {
        "<C-Up>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize split up",
      },
      {
        "<C-Down>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize split down",
      },
      {
        "<C-Left>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize split left",
      },
      {
        "<C-Right>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize split right",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      cmdline = {
        view = "cmdline",
        format = { search_down = { view = "cmdline" }, search_up = { view = "cmdline" }, cmdline = { icon = " " } },
      },
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
        override = { ["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true },
      },
      views = {
        cmdline_popup = {
          border = { style = "none", padding = { 2, 3 } },
          position = { row = "10", col = "0%" },
          size = { width = "auto", height = "auto" },
          win_options = { winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" } },
        },
        popupmenu = {
          border = { style = "none", padding = { 2, 3 } },
          position = { row = "95%", col = "0%" },
          size = { width = "auto", height = "auto" },
          win_options = { winblend = 20, winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" } },
        },
      },
    },
  },
  {
    "b0o/incline.nvim", -- floating filename per window (sveltekit routes shown relative to routes/)
    event = "VeryLazy",
    opts = {
      highlight = {
        groups = {
          InclineNormal = { guibg = "#45475a", guifg = "#bac2de" },
          InclineNormalNC = { guibg = "none", guifg = "#bac2de" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = { cursorline = true, only_win = true },
      render = function(props)
        local full = vim.api.nvim_buf_get_name(props.buf)
        local name = vim.fn.fnamemodify(full, ":t")
        local cwd = vim.fn.getcwd()
        if vim.uv.fs_stat(cwd .. "/svelte.config.ts") or vim.uv.fs_stat(cwd .. "/svelte.config.js") then
          local i = full:find("routes")
          if i then
            name = full:sub(i + #"routes" + 1)
          end
        end
        if vim.bo[props.buf].modified then
          name = "[*]" .. name
        end
        local icon, color = require("nvim-web-devicons").get_icon_color(name)
        return { { icon, guifg = color }, { " " }, { name } }
      end,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = { scope = { show_start = false, show_end = false } },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
      { "<leader>Mt", "<cmd>RenderMarkdown toggle<cr>", desc = "Render markdown toggle" },
      { "<leader>Me", "<cmd>RenderMarkdown enable<cr>", desc = "Render markdown enable" },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = { window = { width = 400 } },
    keys = {
      {
        "<leader>zm",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Zen mode",
      },
    },
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    cmd = "NoNeckPain",
    keys = { { "<leader>zp", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" } },
    opts = {
      width = 220,
      colors = { blend = -0.1 },
      buffers = { scratchPad = { enabled = true, fileName = "notes", location = nil }, bo = { filetype = "md" } },
    },
  },
}
