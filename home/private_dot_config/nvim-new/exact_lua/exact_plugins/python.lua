return {
  {
    "hanschen/vim-ipython-cell",
    ft = "python",
    dependencies = { "jpalardy/vim-slime" },
    init = function()
      vim.g.slime_python_ipython = 1
      vim.g.ipython_cell_regex = 1
      vim.g.ipython_cell_tag = "#\\s*%%( [^[].*)?"
      vim.g.slime_dont_ask_default = 1
      if vim.env.TMUX then
        vim.g.slime_target = "tmux"
        vim.g.slime_default_config = { socket_name = vim.split(vim.env.TMUX, ",")[1], target_pane = "{last}" }
      end
    end,
  },
  { "jupyter-vim/jupyter-vim", ft = "python" },
}
