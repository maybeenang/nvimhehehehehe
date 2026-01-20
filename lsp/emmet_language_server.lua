local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = { "html", "css", "javascriptreact", "typescriptreact", "blade" },
	root_markers = { ".git" },
	capabilities = capabilities,
	init_options = {
		includeLanguages = {
			blade = "html",
		},
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	},
}
