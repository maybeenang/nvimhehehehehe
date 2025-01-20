return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	ft = {
		"html",
		"css",
		"javascriptreact",
		"typescriptreact",
		"blade",
	},
	after = "nvim-cmp",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
		"neovim/nvim-lspconfig", -- optional
	},
	opts = {}, -- your configuration
	-- config = function()
	--   require("tailwind-tools").setup()
	-- end,
}
