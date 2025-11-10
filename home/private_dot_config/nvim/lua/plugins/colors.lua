local onedark_overrides = {
  -- this 16 colors are changed to onedark
  base = "#282c34",
  mantle = "#353b45",
  surface0 = "#3e4451",
  surface1 = "#545862",
  surface2 = "#565c64",
  text = "#abb2bf",
  rosewater = "#b6bdca",
  lavender = "#c8ccd4",
  red = "#e06c75",
  peach = "#d19a66",
  yellow = "#e5c07b",
  green = "#98c379",
  teal = "#56b6c2",
  blue = "#61afef",
  -- mauve = "#c678dd",
  flamingo = "#be5046",

  -- now patching extra palettes
  maroon = "#e06c75",
  sky = "#d19a66",

  -- extra colors not decided what to do
  pink = "#f5c2e7",
  sapphire = "#74c7ec",

  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  crust = "#111111",
}

local tokyo = {
  black = "#06080A",
  bg0 = "#11121D",
  bg1 = "#1A1B2A",
  bg2 = "#212234",
  bg3 = "#353945",
  bg4 = "#4A5057",
  bg5 = "#282C34",
  bg_red = "#FE6D85",
  bg_green = "#98C379",
  bg_blue = "#9FBBF3",
  diff_red = "#773440",
  diff_green = "#587738",
  diff_blue = "#2A3A5A",
  diff_add = "#1E2326",
  diff_change = "#262B3D",
  diff_delete = "#281B27",
  diff_text = "#1C4474",
  fg = "#A0A8CD",
  red = "#EE6D85",
  orange = "#F6955B",
  yellow = "#D7A65F",
  green = "#95C561",
  blue = "#7199EE",
  cyan = "#38A89D",
  purple = "#A485DD",
  grey = "#4A5057",
  none = "NONE",
}

local tokyo_overrides = {
  -- this 16 colors are changed to onedark
  crust = tokyo.black,
  base = tokyo.bg0,
  mantle = tokyo.bg1,
  surface0 = tokyo.bg2,
  surface1 = tokyo.bg3,
  surface2 = tokyo.bg4,
  text = tokyo.fg,
  rosewater = "#b6bdca",
  lavender = "#b4befe",
  red = tokyo.red,
  peach = "#d19a66",
  yellow = tokyo.yellow,
  green = "#98c379",
  teal = "#56b6c2",
  blue = tokyo.blue,
  -- mauve = "#c678dd",
  flamingo = "#be5046",

  -- now patching extra palettes
  maroon = "#e06c75",
  sky = "#d19a66",

  -- extra colors not decided what to do
  pink = "#f5c2e7",
  sapphire = "#74c7ec",

  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
}

return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       comments = { italic = true },
  --       keywords = { italic = true },
  --       functions = {},
  --       variables = {},
  --       sidebars = "dark",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        float = {
          transparent = true,
          solid = false,
        },
        color_overrides = {
          -- all = onedark_overrides,
        },
        transparent_background = true,
        -- dim_inactive = {
        -- 	enabled = false, -- dims the background color of inactive window
        -- 	shade = "dark",
        -- 	percentage = 0.15, -- percentage of the shade to apply to the inactive window
        -- },
        term_colors = false,
        integrations = {
          alpha = true,
          blink_cmp = true,
          dashboard = true,
          dap = true,
          dap_ui = true,
          dadbod_ui = true,
          harpoon = true,
          diffview = true,
          flash = true,
          gitsigns = true,
          illuminate = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          lsp_trouble = true,
          markdown = true,
          mason = true,
          render_markdown = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
            inlay_hints = {
              background = true,
            },
          },
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
          neotree = true,
          neotest = true,
          noice = true,
          notify = true,
          snacks = {
            enabled = true,
            indent_scope_color = "subtext0",
          },
          semantic_tokens = true,
          telescope = {
            enabled = true,
            -- style = "nvchad",
          },
          treesitter_context = true,
          treesitter = true,
          which_key = true,
        },
      })
    end,
  },
}
