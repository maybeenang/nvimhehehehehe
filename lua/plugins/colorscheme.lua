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
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = false,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
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
