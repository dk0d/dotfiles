if true then
  return {}
end
local kind_icons = {
  -- Text = "",
  Text = "  ",
  Method = "󰆧",
  Function = "󰊕 ",
  Constructor = " ",
  Field = "󰇽 ",
  Variable = "󰂡 ",
  Class = "󰠱 ",
  Interface = " ",
  Module = " ",
  Property = "󰜢 ",
  Unit = " ",
  Value = "󰎠 ",
  Enum = " ",
  Keyword = "󰌋 ",
  Snippet = " ",
  Color = "󰏘 ",
  File = "󰈙 ",
  Reference = " ",
  Folder = "󰉋 ",
  EnumMember = " ",
  Constant = "󰏿 ",
  Struct = " ",
  Event = " ",
  Operator = "󰆕 ",
  TypeParameter = "󰅲 ",
}
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  event = "InsertEnter",
  lazy = true,
  opts = function(_, opts)
    local cmp = require("cmp")
    local mini_icons = require("mini.icons")
    opts.formatting = {
      format = function(entry, item)
        local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
        item.icon = mini_icons.get("lsp", item.kind or "")
        -- 	menu = {
        -- 		buffer = "[Buffer]",
        -- 		nvim_lsp = "[LSP]",
        -- 		luasnip = "[LuaSnip]",
        -- 		path = "[Path]",
        -- 	},
        if color_item.abbr_hl_group then
          item.kind_hl_group = color_item.abbr_hl_group
          item.kind = color_item.abbr
        end
        return item
      end,
    }
    opts.sources = cmp.config.sources({
      -- { name = "copilot", priority = 1500, group_index = 2 },
      { name = "nvim_lsp", priority = 1000, group_index = 2 },
      { name = "luasnip", priority = 750, group_index = 2 },
      { name = "buffer", priority = 500, group_index = 2 },
      { name = "path", priority = 250, group_index = 2 },
    })
    cmp.setup.filetype({ "sql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })
    opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
      ["<Tab>"] = {
        c = cmp.config.disable,
      },
      ["<A-i>"] = cmp.mapping(cmp.mapping.complete({ reason = cmp.ContextReason.Auto }), { "i", "c" }),
    })
    return opts
    -- return {
    --   completion = {
    --     autocomplete = true,
    --   },
    --   experimental = {
    --     ghost_text = false,
    --   },
    -- }
    --
    --
  end,
}
