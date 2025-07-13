---@type LazySpec
return {
  "echasnovski/mini.files",
  event = "VeryLazy",
  config = function(_, opts)
    require("mini.files").setup(opts)
  end,
  opts = {
    windows = {
      width_focus = 50,
    },
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "L",
      go_out = "h",
      go_out_plus = "H",
      mark_goto = "'",
      mark_set = "m",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },
  },
}
