return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		event = "VimEnter",
		cmd = "Theme",
		config = function()
			require("themery").setup({
				themes = {
					"tokyonight",
					{
						name = "tokyonight (storm)",
						colorscheme = "tokyonight-storm",
					},
					{
						name = "tokyonight (night)",
						colorscheme = "tokyonight-night",
					},
					{
						name = "catppuccin (mocha)",
						colorscheme = "catppuccin",
					},
					-- "monokai-pro",
					"onedark",
					{
						name = "onedark (darker)",
						colorscheme = "onedark_dark",
					},
					{
						name = "Monokai Classic",
						colorscheme = "monokai-pro",
						before = [[
              require("monokai-pro").setup({
                filter = "classic",
              })
            ]],
					},
				},
				livePreview = true,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"loctvl842/monokai-pro.nvim",
		name = "monokai-pro",
	},
	{
		"olimorris/onedarkpro.nvim",
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			require("transparent").setup({
				enable = true,
				extra_groups = {
					"NvimTreeNormal",
					"terminal",
					"packer",
					"lsp_finder",
					"TelescopePrompt",
					"TelescopeResults",
					"TelescopePreview",
				},
			})
		end,
	},
}
