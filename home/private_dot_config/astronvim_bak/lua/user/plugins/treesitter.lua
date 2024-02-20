return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    ensure_installed = {
      'lua',
      'python',
      'rust',
      -- "markdown", # causes issues on startup in  linux VMs
      -- "markdown_inline",
    },
    ident = { enable = true },
    rainbow = {
      enabled = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    textobjects = {
      move = {
        goto_next_start = {
          [']s'] = { query = '@class.outer', desc = 'Next class start' },
        },
        goto_previous_start = {
          ['[s'] = { query = '@class.outer', desc = 'Previous class start' },
        },
      },
    },
  },
}
