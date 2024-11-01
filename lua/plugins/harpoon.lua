return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = false,
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
			print("marked")
		end)
		vim.keymap.set("n", "<leader>q", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<M-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<M-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<M-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<M-4>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
