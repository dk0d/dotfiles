return {
  "rebelot/heirline.nvim",
  event = "BufEnter",
  opts = function(_, opts)
    local status = require("astroui.status")
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode(),
      status.component.git_branch(),
      status.component.file_info({
        filetype = false,
        filename = {
          modify = ":.", -- see filename-modifiers for more (passed to vim.fn.fnamemodify())
        },
        file_modified = false,
      }),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      status.component.nav(),
      status.component.mode({ surround = { separator = "right" } }),
    }

    opts.winbar = { -- winbar
      init = function(self)
        self.bufnr = vim.api.nvim_get_current_buf()
      end,
      fallthrough = false,
      status.component.breadcrumbs({ hl = status.hl.get_attributes("winbar", true) }),
    }

    opts.tabline = nil
    return opts
  end,
}
