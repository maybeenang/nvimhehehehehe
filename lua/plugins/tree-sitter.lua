return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"m-demare/hlargs.nvim",
		},
		-- lazy = false,
		lazy = true, -- Lazy-load
		event = { "BufRead", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			-- WINDOWS 10
			require("nvim-treesitter.install").compilers = { "zig" }

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = {
						"src/parser.c",
						-- 'src/scanner.cc',
					},
					-- generate_requires_npm = true,
					requires_generate_from_grammar = true,
					branch = "main",
				},
				filetype = "blade",
			}

			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				ensure_installed = {
					"lua",
					-- "javascript",
					-- "typescript",
					-- "tsx",
					-- "json",
					-- "html",
					-- "css",
					-- "php",
				},
				sync_install = false,
				auto_install = true,
			})
		end,
	},
}
