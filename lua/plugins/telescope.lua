return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = function()
			local builtin = require("telescope.builtin")

			-- local function find_directory_and_focus()
			-- 	local actions = require("telescope.actions")
			-- 	local action_state = require("telescope.actions.state")
			--
			-- 	local function open_nvim_tree(prompt_bufnr, _)
			-- 		actions.select_default:replace(function()
			-- 			local api = require("nvim-tree.api")
			--
			-- 			actions.close(prompt_bufnr)
			-- 			local selection = action_state.get_selected_entry()
			-- 			api.tree.open()
			-- 			api.tree.find_file(selection.cwd .. "/" .. selection.value)
			-- 		end)
			-- 		return true
			-- 	end
			--
			-- 	require("telescope.builtin").find_files({
			-- 		-- find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
			-- 		find_command = {
			-- 			"rg",
			-- 			"--files",
			-- 			"--sortr=modified",
			-- 			"--color=never",
			-- 			"--no-heading",
			-- 			"--with-filename",
			-- 			"--line-number",
			-- 			"--column",
			-- 			"--smart-case",
			-- 			"--ignore-file",
			-- 			".gitignore",
			-- 		},
			-- 		attach_mappings = open_nvim_tree,
			-- 	})
			-- end

			-- vim.keymap.set("n", "fd", find_directory_and_focus)

			return {
				{ "<C-p>", builtin.find_files, desc = "Find File" },
				-- { "<C-p>", find_directory_and_focus, desc = "Find File" },
				{ "<C-f>", builtin.live_grep, desc = "Find File" },
			}
		end,
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<esc>"] = actions.close,
						},
					},
					-- file_ignore_patterns = { ".git/*", "*/tmp/*", "node_modules/*", "venv", "vendor/*" },
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--ignore-file",
						".gitignore",
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						find_command = {
							"rg",
							"--files",
							"--sortr=modified",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--ignore-file",
							".gitignore",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({ winblend = 10 }),
					},
					persisted = {
						layout_config = { width = 0.55, height = 0.55 },
					},
				},
			})
			telescope.load_extension("ui-select")
		end,
	},
	{

		"nvim-telescope/telescope-ui-select.nvim",
	},
}
