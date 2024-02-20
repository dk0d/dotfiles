local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}
local kind_icons = {
  Text = '',
  Method = '󰆧',
  Function = '󰊕',
  Constructor = '',
  Field = '󰇽',
  Variable = '󰂡',
  Class = '󰠱',
  Interface = '',
  Module = '',
  Property = '󰜢',
  Unit = '',
  Value = '󰎠',
  Enum = '',
  Keyword = '󰌋',
  Snippet = '',
  Color = '󰏘',
  File = '󰈙',
  Reference = '',
  Folder = '󰉋',
  EnumMember = '',
  Constant = '󰏿',
  Struct = '',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '󰅲',
}
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'onsails/lspkind.nvim',
  },
  opts = function(_, opts)
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    opts.formatting = {
      format = lspkind.cmp_format {
        mode = 'symbol_text',
        symbol_map = kind_icons,
        menu = {
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          luasnip = '[LuaSnip]',
          path = '[Path]',
        },
      },
    }
    opts.sources = cmp.config.sources {
      { name = 'copilot', priority = 1500, group_index = 2 },
      { name = 'nvim_lsp', priority = 1000, group_index = 2 },
      { name = 'luasnip', priority = 750, group_index = 2 },
      { name = 'buffer', priority = 500, group_index = 2 },
      { name = 'path', priority = 250, group_index = 2 },
    }
    -- opts.mapping = {
    --   ['<C-i>'] = cmp.mapping(cmp.mapping.complete { reason = cmp.ContextReason.Auto }, { 'i', 'c' }),
    -- }
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
