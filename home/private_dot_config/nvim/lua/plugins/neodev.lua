if true then
  return {}
end
return {
  "folke/neodev.nvim",
  opts = {
    library = {
      plugins = {
        "nvim-dap-virtual-text",
        "nvim-dap-ui",
      },
      types = true,
    },
  },
}
