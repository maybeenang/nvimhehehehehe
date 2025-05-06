local conform = require("conform")
local js_ft = function()
	local eslint_files = {
		".prettierrc",
		".prettierrc.js",
		"prettier.config.js",
	}

	local biome_files = {
		"biome.json",
		"biome.jsonc",
	}

	local formatter = {}

	for _, file in ipairs(eslint_files) do
		if vim.fn.glob(file) ~= "" then
			table.insert(formatter, "prettierd")
		end
	end

	for _, file in ipairs(biome_files) do
		if vim.fn.glob(file) ~= "" then
			table.insert(formatter, "biome")
		end
	end

	vim.inspect(formatter)

	return formatter or { "prettierd" }
end

conform.setup({
	formatters_by_ft = {
		javascript = js_ft(),
		typescript = js_ft(),
		typescriptreact = js_ft(),
		javascriptreact = js_ft(),
		html = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
		-- php = { "pint" }
		python = { "black", "isort" },
		blade = { "prettierd" },
	},
	-- format_on_save = {
	-- 	bufnr = 0,
	-- 	lsp_fallback = true,
	-- 	async = true,
	-- 	timeout_ms = 500,
	-- 	quiet = true,
	-- },
	format_after_save = {
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
		quiet = true,
	},
})

vim.keymap.set({ "n", "x", "v", "i" }, "<F3>", function()
	conform.format({
		bufnr = vim.api.nvim_get_current_buf(),
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
		quiet = true,
	})
end, { desc = "Format" })

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range, quite = true })
end, { range = true })
