return {
  "stevearc/dressing.nvim",
  lazy = true,
  init = function()
    require("astrocore").load_plugin_with_func("dressing.nvim", vim.ui, "input", "select")

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.select(...)
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.input(...)
    end
  end,
  opts = {
    input = { default_prompt = "➤ " },
    select = { backend = { "telescope", "builtin" } },
  },
}
