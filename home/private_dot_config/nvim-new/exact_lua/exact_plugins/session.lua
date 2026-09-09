return {
  "stevearc/resession.nvim",
  lazy = true,
  opts = {},
  init = function()
    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("user_session_autosave", { clear = true }),
      callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= "" then
            local save = require("resession").save
            save("Last Session", { notify = false })
            save(vim.uv.cwd(), { dir = "dirsession", notify = false })
            return
          end
        end
      end,
    })
  end,
  keys = {
    {
      "<leader>Sl",
      function()
        require("resession").load("Last Session")
      end,
      desc = "Load last session",
    },
    {
      "<leader>Ss",
      function()
        require("resession").save()
      end,
      desc = "Save session",
    },
    {
      "<leader>SS",
      function()
        require("resession").save(vim.uv.cwd(), { dir = "dirsession" })
      end,
      desc = "Save dirsession",
    },
    {
      "<leader>St",
      function()
        require("resession").save_tab()
      end,
      desc = "Save tab session",
    },
    {
      "<leader>Sd",
      function()
        require("resession").delete()
      end,
      desc = "Delete session",
    },
    {
      "<leader>SD",
      function()
        require("resession").delete(nil, { dir = "dirsession" })
      end,
      desc = "Delete dirsession",
    },
    {
      "<leader>Sf",
      function()
        require("resession").load()
      end,
      desc = "Load session",
    },
    {
      "<leader>SF",
      function()
        require("resession").load(nil, { dir = "dirsession" })
      end,
      desc = "Load dirsession",
    },
    {
      "<leader>S.",
      function()
        require("resession").load(vim.uv.cwd(), { dir = "dirsession" })
      end,
      desc = "Load cwd session",
    },
  },
}
