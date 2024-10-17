return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = function()
			local tree = require("nvim-tree.api").tree
			local nvimTreeFocusOrToggle = function()
				local nvimTree = require("nvim-tree.api")
				local currentBuf = vim.api.nvim_get_current_buf()
				local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
				if currentBufFt == "NvimTree" then
					nvimTree.tree.toggle()
				else
					nvimTree.tree.focus()
				end
			end

			return {
				{
					"<leader>e",
					function()
						-- tree.open({ focus = true })
						nvimTreeFocusOrToggle()
					end,
					desc = "Focus Nvimtree",
				},
				{
					"<leader>E",
					function()
						tree.toggle()
					end,
					desc = "Toggle Nvimtree",
				},
			}
		end,
		config = function()
			require("config.nvim-tree")
			-- require("nvim-tree").setup({
			-- 	filters = {
			-- 		dotfiles = false,
			-- 	},
			-- })
		end,
	},
}
