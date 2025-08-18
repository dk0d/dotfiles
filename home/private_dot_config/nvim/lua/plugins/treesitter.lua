---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "python",
      "rust",
      -- "swift", -- remove on linux
      "markdown",
      "typescript",
      "javascript",
      "svelte",
      "sql",
      "html",
      "tsx",
      "bash",
      "css",
      "jsdoc",
      "json",
      "toml",
      "zig",
      "csv",
      "go",
      -- add more arguments for adding more treesitter parsers
    })

    opts.highlight = vim.tbl_deep_extend("force", opts.highlight or {}, {
      enable = true,
      additional_vim_regex_highlighting = false,
    })

    opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
      enable = true,
    })

    opts.rainbow = vim.tbl_deep_extend("force", opts.rainbow or {}, {
      enabled = true,
      extended_mode = true,
      max_file_lines = nil,
    })

    -- opts.textobjects = vim.tbl_deep_extend("force", opts.textobjects or {}, {
    -- 	move = {
    -- 		goto_next_start = {
    -- 			["]s"] = { query = "@class.outer", desc = "Next class start" },
    -- 		},
    -- 		goto_previous_start = {
    -- 			["[s"] = { query = "@class.outer", desc = "Previous class start" },
    -- 		},
    -- 	},
    -- })
  end,
}
