---@type LazySpec
return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  event = "VeryLazy",
  opts = {
    default_file_explorer = true,
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-t>"] = "actions.select_split",
      -- ['<C-t>'] = 'actions.select_tab',
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
  config = function(_, opts)
    require("oil").setup(opts)
  end,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {
      "<leader>o",
      function()
        require("oil").open()
      end,
      desc = "Open Oil float ",
    },
  },
}
