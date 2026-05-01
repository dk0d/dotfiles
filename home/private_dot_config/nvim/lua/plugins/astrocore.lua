-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

--@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = require("config.mappings"),
    features = {
      large_buf = {
        enabled = false,
      },
    },

    -- treesitter
    treesitter = {
      ensure_installed = {
        -- "lua",
        -- "vim",
        -- "python",
        -- "rust",
        -- -- "swift", -- remove on linux
        -- "markdown",
        -- "typescript",
        -- "javascript",
        -- "svelte",
        -- "sql",
        -- "html",
        -- "tsx",
        -- "bash",
        -- "css",
        -- "jsdoc",
        -- "json",
        -- "jsonc",
        -- "toml",
        -- "zig",
        -- "csv",
        -- "go",
        -- "fish",
        -- "yaml",
        -- "dockerfile",
      },
      highlight = true,
      auto_install = true,
    },
    -- treesitter = function(opts)
    --   opts.highlight = vim.tbl_deep_extend("force", opts.highlight or {}, {
    --     enable = true,
    --     additional_vim_regex_highlighting = false,
    --   })
    --
    --   opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
    --     enable = true,
    --   })
    --
    --   opts.rainbow = vim.tbl_deep_extend("force", opts.rainbow or {}, {
    --     enabled = true,
    --     extended_mode = true,
    --     max_file_lines = nil,
    --   })
    --
    --   -- opts.textobjects = vim.tbl_deep_extend("force", opts.textobjects or {}, {
    --   -- 	move = {
    --   -- 		goto_next_start = {
    --   -- 			["]s"] = { query = "@class.outer", desc = "Next class start" },
    --   -- 		},
    --   -- 		goto_previous_start = {
    --   -- 			["[s"] = { query = "@class.outer", desc = "Previous class start" },
    --   -- 		},
    --   -- 	},
    --   -- })
    --   return opts
    -- end,
  },
}
