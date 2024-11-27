return {
  {
    "hanschen/vim-ipython-cell",
    ft = "python",
    config = function()
      -- ------------------------------------------------------------------------------
      -- " slime configuration
      -- "------------------------------------------------------------------------------
      -- " fix paste issues in ipython
      vim.g.slime_python_ipython = 1
      vim.g.ipython_cell_regex = 1
      vim.g.ipython_cell_tag = "#\\s*%%( [^[].*)?"
      vim.g.slime_dont_ask_default = 1

      if os.getenv "ZELLIJ" then
        -- use zellij
        vim.g.slime_target = "zellij"

        -- " always send text to the top-right pane in the current tmux tab without asking
        vim.g.slime_default_config = {
          session_id = "current",
          relative_pane = "right",
        }
      elseif os.getenv "TERM_PROGRAM" == "tmux" then
        -- " use tmux
        vim.g.slime_target = "tmux"

        -- " always send text to the top-right pane in the current tmux tab without asking
        vim.g.slime_default_config = {
          socket_name = vim.fn.get(vim.split(os.getenv "TMUX", ","), 0),
          target_pane = "{last}",
        }
      else
        vim.notify "No Sessions Found"
        vim.notify("ZJ" .. os.getenv "ZELLIJ")
      end
    end,
    dependencies = {
      "jpalardy/vim-slime",
    },
  },
  {
    "jupyter-vim/jupyter-vim",
    ft = "python",
  },
}
