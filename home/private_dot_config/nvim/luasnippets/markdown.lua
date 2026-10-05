local ls = require("luasnip")
local s, t, i, f = ls.snippet, ls.text_node, ls.insert_node, ls.function_node

return {
  s({ trig = "md-frontmatter", desc = "Markdown frontmatter" }, {
    t({ "---", "title: " }),
    i(1),
    t({ "", "description: " }),
    i(2),
    t({ "", "tags: " }),
    i(3),
    t({ "", "fields: " }),
    i(4),
    t({ "", "created: " }),
    f(function()
      return os.date("%Y.%m.%d %H:%M")
    end),
    t({ "", "---" }),
  }),
}
