return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = { "nvim-mini/mini.icons" },
    keys = { {
      "<leader>o",
      function()
        require("oil").open()
      end,
      desc = "Oil",
    } },
    opts = {
      default_file_explorer = true,
      use_default_keymaps = false,
      view_options = { show_hidden = true },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-t>"] = "actions.select_split",
        ["<C-p>"] = "actions.preview",
        ["<leader>q"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
    },
    init = function()
      -- oil is default_file_explorer: load it if nvim opens a directory
      if vim.fn.isdirectory(vim.fn.argv(0) or "") == 1 then
        require("oil")
      end
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-mini/mini.icons" },
    keys = {
      { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle explorer" },
      {
        "<leader>ef",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd("p")
          else
            vim.cmd.Neotree("focus")
          end
        end,
        desc = "Toggle explorer focus",
      },
    },
    opts = {
      close_if_last_window = false,
      enable_diagnostics = false,
      source_selector = { winbar = false, statusline = true, content_layout = "start" },
      commands = {
        find_in_directory_grep = function(state)
          Snacks.picker.grep({ dirs = { state.tree:get_node():get_id() } })
        end,
        system_open = function(state)
          vim.ui.open(state.tree:get_node():get_id())
        end,
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if node:has_children() and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if not node:has_children() then
            state.commands.open(state)
          elseif node:is_expanded() then
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          else
            state.commands.toggle_node(state)
          end
        end,
        copy_selector = function(state) -- Y: pick which form of the path to copy
          local node = state.tree:get_node()
          local filepath, filename = node:get_id(), node.name
          local modify = vim.fn.fnamemodify
          local vals = {
            ["BASENAME"] = modify(filename, ":r"),
            ["EXTENSION"] = modify(filename, ":e"),
            ["FILENAME"] = filename,
            ["PATH (CWD)"] = modify(filepath, ":."),
            ["PATH (HOME)"] = modify(filepath, ":~"),
            ["PATH"] = filepath,
            ["URI"] = vim.uri_from_fname(filepath),
          }
          local options = vim.tbl_filter(function(k)
            return vals[k] ~= ""
          end, vim.tbl_keys(vals))
          table.sort(options)
          vim.ui.select(options, {
            prompt = "Copy to clipboard:",
            format_item = function(k)
              return ("%s: %s"):format(k, vals[k])
            end,
          }, function(choice)
            if choice and vals[choice] then
              vim.fn.setreg("+", vals[choice])
              vim.notify(("Copied: `%s`"):format(vals[choice]))
            end
          end)
        end,
      },
      window = {
        position = "right",
        popup_border_style = "rounded",
        width = 40,
        mappings = {
          o = "open",
          O = "system_open",
          Y = "copy_selector",
          h = "parent_or_close",
          l = "child_or_open",
          ["{"] = "prev_source",
          ["}"] = "next_source",
          Z = "expand_all_nodes",
          F = "find_in_directory_grep",
        },
      },
      filesystem = {
        window = { mappings = { h = "toggle_hidden" } },
        filtered_items = { visible = true, never_show = { ".DS_Store" } },
        follow_current_file = { enabled = true, leave_dirs_open = true },
      },
      default_component_configs = {
        icon = {
          provider = function(icon, node)
            local text, hl
            if node.type == "file" then
              text, hl = require("mini.icons").get("file", node.name)
            elseif node.type == "directory" then
              text, hl = require("mini.icons").get("directory", node.name)
              if node:is_expanded() then
                text = nil
              end
            end
            if text then
              icon.text = text
            end
            if hl then
              icon.highlight = hl
            end
          end,
        },
        kind_icon = {
          provider = function(icon, node)
            icon.text, icon.highlight = require("mini.icons").get("lsp", node.extra.kind.name)
          end,
        },
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { settings = { save_on_toggle = true } },
    config = function(_, opts)
      require("harpoon"):setup(opts) -- harpoon2 setup is a method; lazy's default call drops the opts
    end,
    keys = {
      {
        "<leader>ka",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon mark",
      },
      {
        "<leader>ks",
        function()
          local h = require("harpoon")
          h.ui:toggle_quick_menu(h:list())
        end,
        desc = "Harpoon UI",
      },
      {
        "<leader>kq",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon 1",
      },
      {
        "<leader>kw",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon 2",
      },
      {
        "<leader>ke",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon 3",
      },
      {
        "<leader>kr",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon 4",
      },
      {
        "<leader>k%",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "Harpoon 5",
      },
      {
        "<leader>kn",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon next",
      },
      {
        "<leader>kp",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon prev",
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { open_cmd = "noswapfile vnew", replace_engine = { sed = { cmd = "sed", args = { "-i", "", "-E" } } } },
    keys = {
      {
        "<leader>sp",
        function()
          require("spectre").toggle()
        end,
        desc = "Spectre",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Spectre word",
      },
      {
        "<leader>sf",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Spectre word in file",
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = { use_diagnostics_signs = true, action_keys = { close = { "q", "<esc>" }, cancel = "<c-e>" } },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
      {
        "<leader>xr",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP references/definitions",
      },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
      { "<leader>lS", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols outline" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
    },
    specs = {
      "folke/snacks.nvim",
      opts = {
        picker = {
          actions = {
            trouble_open = function(...)
              return require("trouble.sources.snacks").actions.trouble_open(...)
            end,
          },
          win = { input = { keys = { ["<c-t>"] = { "trouble_open", mode = { "n", "i" } } } } },
        },
      },
    },
  },
}
