return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				-- php = { "pint" }
				-- python = { "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "x", "v", "i" }, "<F3>", function()
			conform.format({
				bufnr = vim.api.nvim_get_current_buf(),
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			})
		end, { desc = "Format" })
	end,
}
