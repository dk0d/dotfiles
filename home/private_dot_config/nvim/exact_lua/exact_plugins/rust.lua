return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  ft = "rust",
  init = function()
    vim.g.rustaceanvim = function()
      local mason = vim.fn.expand("$MASON")
      local liblldb = mason
        .. "/packages/codelldb/extension/lldb/lib/liblldb"
        .. (vim.uv.os_uname().sysname == "Darwin" and ".dylib" or ".so")
      return {
        dap = { adapter = require("rustaceanvim.config").get_codelldb_adapter(mason .. "/bin/codelldb", liblldb) },
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              imports = { granularity = { group = "module" }, prefix = "self" },
              cargo = { buildScripts = { enable = true } },
              procMacro = { enable = true },
              hint = { enable = true },
            },
          },
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, { desc = "Rust hover actions", buffer = bufnr })
            vim.keymap.set("n", "<leader>la", function()
              vim.cmd.RustLsp("codeAction")
            end, { desc = "Rust code actions", buffer = bufnr })
          end,
        },
      }
    end
  end,
}
