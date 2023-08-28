local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd"}
local servers = { "html", "cssls", "tsserver"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities2 = capabilities
capabilities2.offsetEncoding = { "utf-16" }

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities2,
}

-- require("custom.configs.server.clangd")

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end


-- 
-- lspconfig.pyright.setup { blabla}
