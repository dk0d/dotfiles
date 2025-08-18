return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- enabled = vim.version().minor < 10,
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      require("mini.indentscope").gen_animation.quadratic({
        duration = 10,
        delay = 100,
        easing = "in-out",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
