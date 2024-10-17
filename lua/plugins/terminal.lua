return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<leader>t]],
		})

		vim.api.nvim_create_autocmd({ "TermEnter" }, {
			callback = function()
				for _, buffers in ipairs(vim.fn.getbufinfo()) do
					local filetype = vim.api.nvim_buf_get_option(buffers.bufnr, "filetype")
					if filetype == "toggleterm" then
						vim.api.nvim_create_autocmd({ "BufWriteCmd", "FileWriteCmd", "FileAppendCmd" }, {
							buffer = buffers.bufnr,
							command = "q!",
						})
					end
				end
			end,
		})

		-- quit terminal and go to normal mode
		vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
	end,
}
