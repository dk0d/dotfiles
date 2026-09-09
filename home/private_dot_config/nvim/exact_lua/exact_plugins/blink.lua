return {
  "saghen/blink.cmp",
  version = "1.*",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
  opts = {
    enabled = function()
      return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
    end,
    snippets = { preset = "luasnip" },
    signature = { enabled = true },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = { lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 } },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
    completion = {
      documentation = { auto_show = true },
      -- auto_insert makes <Tab> past the last item deselect everything, so <CR> then inserts a newline
      -- instead of completing. Keep the highlight sticky; <C-e> cancels when you really want a newline.
      list = { selection = { preselect = true, auto_insert = false } },
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = require("mini.icons").get("lsp", ctx.kind) or ctx.kind_icon
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local _, hl = require("mini.icons").get("lsp", ctx.kind)
                return hl or ("BlinkCmpKind" .. ctx.kind)
              end,
            },
          },
        },
      },
    },
  },
}
