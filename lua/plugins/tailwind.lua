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
	opts = {
		server = {
			override = true,
			settings = {
				tailwindCSS = {
					classFunctions = { "cva", "cx" },
					experimental = {
						classRegex = {
							"cva\\((\"[^\"]*\"|'[^']*')", -- cva("...")
							"cx\\((\"[^\"]*\"|'[^']*')", -- cx("...")
						},
					},
				},
			},
		},
	}, -- your configuration
	-- config = function()
	--   require("tailwind-tools").setup()
	-- end,
}
