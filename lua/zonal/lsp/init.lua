local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require 'zonal.lsp.mason'
require('zonal.lsp.handlers').setup()
require 'zonal.lsp.null-ls'
