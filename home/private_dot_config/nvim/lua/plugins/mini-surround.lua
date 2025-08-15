return {
  "echasnovski/mini.surround",
  after = "nvim-treesitter",
  version = "*",
  event = "BufRead",
  keys = function(_, keys)
    local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    local mappings = {
      { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
      { opts.mappings.delete, desc = "Delete surrounding" },
      { opts.mappings.find, desc = "Find right surrounding" },
      { opts.mappings.find_left, desc = "Find left surrounding" },
      { opts.mappings.highlight, desc = "Highlight surrounding" },
      { opts.mappings.replace, desc = "Replace surrounding" },
      { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,

  opts = {
    mappings = {
      add = "ma", -- Add surrounding in Normal and Visual modes
      delete = "md", -- Delete surrounding
      find = "mf", -- Find surrounding (to the right)
      find_left = "mF", -- Find surrounding (to the left)
      highlight = "mh", -- Highlight surrounding
      replace = "mr", -- Replace surrounding
      update_n_lines = "mn", -- Update `n_lines`
      suffix_last = "l", -- Suffix to search with "prev" method
      suffix_next = "n", -- Suffix to search with "next" method
    },
  },
  -- config = function() require("mini.surround").setup {} end,
  requires = { "nvim-treesitter/nvim-treesitter" },
}
