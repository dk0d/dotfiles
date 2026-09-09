local on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
end

return {
  on_attach = on_attach,
}
