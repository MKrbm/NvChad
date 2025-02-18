local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "cmake", "texlab"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities2 = capabilities
-- capabilities2.offsetEncoding = { "utf-16" }

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  }
}


require("lspconfig").pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
	cmd = { "pylsp" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				-- Lint
				ruff = {
					enabled = true,
					select = {
						-- enable pycodestyle
						"E",
						-- enable pyflakes
						"F",
					},
					ignore = {
						-- ignore E501 (line too long)
						-- "E501",
						-- ignore F401 (imported but unused)
						-- "F401",
					},
					extendSelect = { "I" },
					severities = {
						-- Hint, Information, Warning, Error
						F401 = "I",
						E501 = "I",
					},
				},
				flake8 = { enabled = true },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				mccabe = { enabled = false },

				-- Code refactor
				rope = { enabled = true },

				-- Formatting
				black = { enabled = true },
				pyls_isort = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
			},
		},
	},
}
-- require("custom.configs.server.pylsp")

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end


-- 
-- lspconfig.pyright.setup { blabla}
