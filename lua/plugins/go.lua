return {
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			vim.cmd.GoInstallDepsSync()
		end,
		opts = {},
	},
}
