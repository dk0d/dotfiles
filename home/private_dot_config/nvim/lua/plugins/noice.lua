return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup {
      view = "cmdline_popup",
      cmdline = {
        format = {
          cmdline = { icon = " " }, -- icon seems to require FantasqueSansMono Nerd Font
        },
      },
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      -- presets = {
      -- bottom_search = false, -- use a classic bottom cmdline for search
      -- command_palette = true, -- position the cmdline and popupmenu together
      -- long_message_to_split = true, -- long messages will be sent to a split
      -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
      -- lsp_doc_border = false, -- add a border to hover docs and signature help
      -- },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          position = {
            row = 25,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          win_options = {
            winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
          },
        },
        popupmenu = {
          relative = "editor",
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          win_options = {
            winblend = 20,
            -- when catppuccin is selected
            winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
          },
        },
      },
    }
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    { "MunifTanjim/nui.nvim" },
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    { "rcarriga/nvim-notify" },
  },
}
