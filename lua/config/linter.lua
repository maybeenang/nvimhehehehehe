local lint = require("lint")

local eslint_config_markers = {
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
	".eslintrc.js",
	".eslintrc.cjs",
	".eslintrc.json",
	".eslintrc.yaml",
	".eslintrc.yml",
	"package.json",
}

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	go = { "golangcilint" },
}

local augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWritePost", "InsertLeave" }, {
	group = augroup,
	callback = function()
		local cwd = vim.fs.root(0, eslint_config_markers) or vim.fn.getcwd()
		lint.try_lint(nil, { cwd = cwd })
	end,
})
