local servers = {
	"sumneko_lua",
	"pyright",
	"bashls",
	"jsonls",
	"marksman",	-- Markdown
	"texlab",	-- Latex
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {
	on_attach = require('zonal.lsp.handlers').on_attach,
	capabilities = require('zonal.lsp.handlers').capabilities,
}

-- Setup CCLS also since it's not avilable from mason
-- But is packaged by debian: sudo apt install ccls
table.insert(servers, 'ccls')

for _, server in pairs(servers) do
	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, 'zonal.lsp.settings.' .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
