local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
local nmap = function(bufnr, keys, func, desc)
	if desc then
		desc = desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

local function lsp_keymaps(bufnr)
	nmap(bufnr, 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap(bufnr, 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap(bufnr, 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap(bufnr, 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap(bufnr, '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap(bufnr, '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap(bufnr, '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap(bufnr, 'K', vim.lsp.buf.hover, 'Hover Documentation')

	-- Formatting
	nmap(bufnr, '<leader>lf', vim.lsp.buf.format, '[L]SP [F]ormat')

	-- Refactor
	nmap(bufnr, '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

	-- Code Action
	nmap(bufnr, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	-- Diagnostics
	-- nmap('<leader>dn', vim.diagnostic.goto_next, '[D]iagnostic [N]ext')
	-- nmap('<leader>dp', vim.diagnostic.goto_prev, '[D]iagnostic [P]rev')
	--
	vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev,
		{
			noremap=true,
			silent=true,
			buffer = bufnr,
			desc = '[D]iagnostics [P]rev',
		})
	vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next,
		{
			noremap=true,
			silent=true,
			buffer = bufnr,
			desc = '[D]iagnostics [N]ext',
		})


	nmap(bufnr, '<leader>dl', vim.diagnostic.setloclist, '[D]iagnostic [L]oclist')
	nmap(bufnr, 'gl', vim.diagnostic.open_float, 'Diagnostic Info')

	-- Signature help
	nmap(bufnr, '<leader>ls', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality (Workspaces)
	nmap(bufnr, 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap(bufnr, '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap(bufnr, '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap(bufnr, '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')
end

local function ccls_lsp_keymaps(bufnr)
	-- Also setup the generic keymaps
	lsp_keymaps(bufnr)

	-- CCLS Extensions
	nmap(bufnr, 'g-', ':CclsIncomingCallsHierarchy<cr>', 'Hierarchy of funcs calling this')
	nmap(bufnr, 'g=', ':CclsOutgoingCallsHierarchy<cr>', 'Hierarchy of funcs called by this')
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == 'ccls' then
		ccls_lsp_keymaps(bufnr)
	else
		lsp_keymaps(bufnr)
	end
	-- Highlights other users of the word under cursor
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
