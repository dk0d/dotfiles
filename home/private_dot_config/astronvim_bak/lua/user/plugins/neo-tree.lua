return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = true,
  opts = {
    close_if_last_window = false,
    enable_diagnostics = false,
    source_selector = {
      winbar = false,
      statusline = true,
      content_layout = 'start',
    },
    commands = {
      find_in_directory_grep = function(state)
        require('telescope.builtin').live_grep { search_dirs = { state.tree:get_node():get_id() } }
      end,
    },
    window = {
      position = 'right',
      popup_border_style = 'rounded',
      width = 40,
      mappings = {
        o = 'open',
        ['{'] = 'prev_source',
        ['}'] = 'next_source',
        Z = 'expand_all_nodes',
        ['F'] = 'find_in_directory_grep',
      },
    },
    filesystem = {
      window = {
        mappings = {
          h = 'toggle_hidden',
        },
      },
      -- commands = {
      --   system_open = function(state) SystemOpen(state.tree:get_node():get_id()) end,
      -- },
      filtered_items = {
        visible = true,
        follow_current_file = {
          enable = true,
          leave_dirs_open = true,
        },
        never_show = {
          '.DS_Store',
        },
      },
    },
  },
}
