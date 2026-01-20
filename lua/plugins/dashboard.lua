return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "s", desc = "Restore Session", action = ":Persisted load" },
					{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
