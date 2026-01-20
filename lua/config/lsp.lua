local builtin_tele = require("telescope.builtin")

-- LSP attach callback
local lsp_attach = function(client, bufnr)
	local nset = function(key, result, desc)
		vim.keymap.set("n", key, result, { buffer = bufnr, desc = "lsp: " .. desc })
	end

	local iset = function(key, result, desc)
		vim.keymap.set("i", key, result, { buffer = bufnr, desc = "lsp: " .. desc })
	end

	nset("K", vim.lsp.buf.hover, "hover")
	nset("<leader>gd", builtin_tele.lsp_definitions, "Goto definition")
	nset("<leader>gi", builtin_tele.lsp_implementations, "Goto implementation")
	nset("<leader>gr", builtin_tele.lsp_references, "Goto references")
	nset("<leader>go", builtin_tele.lsp_type_definitions, "Goto type definition")
	nset("gd", builtin_tele.lsp_definitions, "Goto definition")
	nset("<leader>gD", vim.lsp.buf.declaration, "Goto declaration")
	nset("<leader>gs", vim.lsp.buf.signature_help, "Signature help")
	iset("<C-h>", vim.lsp.buf.signature_help, "Signature help")
	nset("<F2>", vim.lsp.buf.rename, "Rename")
	nset("<leader>gr", require("telescope.builtin").lsp_references, "Open references")
	nset("<leader>ca", vim.lsp.buf.code_action, "Code action")
	nset("<leader>ch", function()
		local enabled = vim.lsp.inlay_hint.is_enabled({})
		vim.lsp.inlay_hint.enable(not enabled)
	end, "inlay hint")

	require("config.signature").setup(client, bufnr)
end

-- Set up LspAttach autocommand for keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			lsp_attach(client, args.buf)
		end
	end,
})

-- Configure diagnostic signs
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

-- Add cmp_nvim_lsp capabilities to all LSP servers
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
	capabilities = lsp_capabilities,
})

-- mason setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"html",
		"emmet_language_server",
		"tailwindcss",
		"jsonls",
		"intelephense",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettierd",
		"eslint_d",
		"stylua",
	},
})

-- Enable all configured LSP servers
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"html",
	"emmet_language_server",
	"tailwindcss",
	"jsonls",
	"intelephense",
	"gopls",
	"pyright",
	"docker_compose_language_service",
})
