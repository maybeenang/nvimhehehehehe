local lint = require("lint")

local js_ft = function()
	local eslint_files = {
		".eslintrc",
		".eslintrc.js",
		"eslint.config.js",
	}

	local biome_files = {
		"biome.json",
		"biome.jsonc",
	}

	local linter = {}

	for _, file in ipairs(eslint_files) do
		if vim.fn.glob(file) ~= "" then
			table.insert(linter, "eslint_d")
		end
	end

	for _, file in ipairs(biome_files) do
		if vim.fn.glob(file) ~= "" then
			table.insert(linter, "biome")
		end
	end

	vim.inspect(linter)

	-- default to eslint_d
	return linter or { "eslint_d" }
end

lint.linters_by_ft = {
	javascript = js_ft(),
	typescript = js_ft(),
	typescriptreact = js_ft(),
	javascriptreact = js_ft(),
}

local augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
	group = augroup,
	callback = function()
		lint.try_lint()
	end,
})
