-- native LSP (nvim >= 0.11): nvim-lspconfig ships lsp/<name>.lua defaults, our overrides live in after/lsp/<name>.lua
-- (later runtimepath entries win, so `after/` is what beats the plugin's file),
-- this file just enables servers and wires attach behaviour.
local servers = {
  "lua_ls",
  "vimls",
  "ruff",
  "ty",
  "biome",
  "taplo",
  "jsonls",
  "tailwindcss",
  "ts_ls",
  "denols",
  "svelte",
  "astro",
  "clangd",
  "texlab",
  "oxlint",
  "oxfmt",
  "postgres_lsp",
  "markdown_oxide",
  "tinymist",
  "terraformls",
}

vim.lsp.codelens.enable(false)
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  float = { header = "", prefix = "", source = "if_many" },
  jump = { float = true },
})

-- only enable what is actually installed (mason bin is on PATH by now)
for _, name in ipairs(servers) do
  local cmd = (vim.lsp.config[name] or {}).cmd
  if type(cmd) == "function" or (type(cmd) == "table" and vim.fn.executable(cmd[1]) == 1) then
    vim.lsp.enable(name)
  end
end

-- exactly one formatter per buffer, highest-priority attached client wins.
-- null-ls sits in the middle: it beats language servers whose formatter we don't want
-- (lua_ls, ts_ls, jsonls) but loses to the dedicated formatters above it.
local format_priority = { "biome", "oxfmt", "denols", "null-ls" }

local function format(bufnr)
  local attached = {}
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" })) do
    attached[c.name] = true
  end
  local winner
  for _, name in ipairs(format_priority) do
    if attached[name] then
      winner = name
      break
    end
  end
  vim.lsp.buf.format({
    bufnr = bufnr,
    timeout_ms = 1000,
    filter = function(c)
      return winner == nil or c.name == winner
    end,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local buf = ev.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
    map("v", "<leader>la", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>lA", function()
      vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
    end, "Source action")
    map("n", "<leader>fi", function()
      vim.lsp.buf.code_action({ context = { only = { "source.fixAll" }, diagnostics = {} }, apply = true })
    end, "Fix all")
    map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>lf", function()
      format(buf)
    end, "Format buffer")
    map("n", "<leader>fd", function()
      format(buf)
    end, "Format buffer")
    map("n", "<leader>lh", vim.lsp.buf.signature_help, "Signature help")
    map("n", "<leader>ld", vim.diagnostic.open_float, "Hover diagnostics")
    map("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", "LSP info")
    map("n", "<leader>lL", "<cmd>LspRestart<cr>", "Restart LSP")

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end

    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("user_lsp_format_" .. buf, { clear = true }),
        buffer = buf,
        callback = function()
          if vim.g.autoformat and vim.b[buf].autoformat ~= false then
            format(buf)
          end
        end,
      })
    end
  end,
})
