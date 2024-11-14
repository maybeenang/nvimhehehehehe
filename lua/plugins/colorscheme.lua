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
						name = "catppuccin (latte)",
						colorscheme = "catppuccin",
						before = [[
              require("catppuccin").setup({
                flavour = "latte",
              })
            ]],
					},
					{
						name = "catppuccin (frappe)",
						colorscheme = "catppuccin",
						before = [[
              require("catppuccin").setup({
                flavour = "frappe",
              })
            ]],
					},
					{
						name = "catppuccin (macchiato)",
						colorscheme = "catppuccin",
						before = [[
              require("catppuccin").setup({
                flavour = "macchiato",
              })
            ]],
					},
					{
						name = "catppuccin (mocha)",
						colorscheme = "catppuccin",
						before = [[
              require("catppuccin").setup({
                flavour = "mocha",
                term_colors = true,
              })
            ]],
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
					{
						name = "Monokai Machine",
						colorscheme = "monokai-pro",
						before = [[
              require("monokai-pro").setup({
                filter = "machine",
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
