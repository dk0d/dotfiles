return {
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false -- ty/pyright own hover
  end,
}
