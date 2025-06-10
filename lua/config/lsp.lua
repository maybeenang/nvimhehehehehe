local lsp_zero = require("lsp-zero")
local util = require("lspconfig.util")
local builtin_tele = require("telescope.builtin")
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
	-- nset("gd", vim.lsp.buf.definition, "Goto definition")
	nset("gd", builtin_tele.lsp_definitions, "Goto definition")
	nset("<leader>gD", vim.lsp.buf.declaration, "Goto declaration")
	nset("<leader>gs", vim.lsp.buf.signature_help, "Signature help")
	iset("<C-h>", vim.lsp.buf.signature_help, "Signature help")
	nset("<F2>", vim.lsp.buf.rename, "Rename") -- replaced by conform
	-- vim.keymap.set({ 'n', 'x', 'v', 'i' }, '<F3>', vim.lsp.buf.format,
	-- { buffer = bufnr, desc = "Format" })
	nset("<leader>gr", require("telescope.builtin").lsp_references, "Open references")
	nset("<leader>ca", vim.lsp.buf.code_action, "Code action")
	nset("<leader>ch", function()
		local enabled = vim.lsp.inlay_hint.is_enabled({})
		vim.lsp.inlay_hint.enable(not enabled)
	end, "inlay hint")

	require("config.signature").setup(client, bufnr)
end

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp_zero.extend_lspconfig({
	sign_text = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "»",
	},
	lsp_attach = lsp_attach,
	capabilities = lsp_capabilities,
})

local default_setup = function(server)
	require("lspconfig")[server].setup({})
end

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
	handlers = {
		default_setup,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "use" },
						},
					},
				},
			})
		end,
		emmet_language_server = function()
			require("lspconfig").emmet_language_server.setup({
				-- cmd = { "emmet-language-server", "--stdio" },
				-- ILANGIN INI NANTI
				filetypes = { "html", "css", "javascriptreact", "typescriptreact", "blade" },
				init_options = {
					---@type table<string, string>
					includeLanguages = {
						blade = "html",
					},
				},
			})
		end,
		html = function()
			require("lspconfig").html.setup({
				filetypes = { "html", "blade" },
			})
		end,
		pyright = function()
			require("lspconfig").pyright.setup({
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})
		end,

		ts_ls = function()
			require("lspconfig").ts_ls.setup({
				root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
				single_file_support = true,
			})
		end,
	},
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"html",
		"emmet_language_server",
		"ts_ls",
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
