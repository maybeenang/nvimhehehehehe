return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	-- config = true
	config = function()
		require("persisted").setup({
			-- autoload = true,
			should_save = function()
				if vim.bo.filetype == "ministarter" or vim.bo.filetype == "NvimTree" then
					return false
				end
				return true
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedSavePre",
			callback = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.bo[buf].filetype == "NvimTree" then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end,
		})
	end,
}
