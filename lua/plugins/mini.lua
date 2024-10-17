return {
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					-- i = LazyVim.mini.ai_indent,                              -- indent
					-- g = LazyVim.mini.ai_buffer,                              -- buffer
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",
		event = "BufRead",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.starter",
		version = false,
		event = "VimEnter",
		config = function()
			-- close Lazy and re-open when starter is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "MiniStarterOpened",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			local default_header = function()
				local hour = tonumber(vim.fn.strftime("%H"))
				-- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
				local part_id = math.floor((hour + 4) / 8) + 1
				local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
				local username = "maybeenang" or vim.loop.os_get_passwd()["username"]

				local header = table.concat({
					("Good %s, %s"):format(day_part, username),
				}, "\n")

				return header
			end

			-- get current leader key
			local leader = vim.g.mapleader or "\\"

			local footer = table.concat({
				"Press j/k or <UP>/<DOWN> to navigate",
				"Press <C-p> to Find Files (Telescope)",
				"Press " .. leader .. "e to open File Explorer",
				"Press " .. leader .. "q to close",
			}, "\n")

			local starter = require("mini.starter")
			local builtin = require("telescope.builtin")
			-- local explorer = require("neo-tree.command")
			-- local open_explorer = function()
			-- 	explorer.execute({ action = "focus", reveal = true, dir = vim.fn.getcwd() })
			-- end
			starter.setup({
				evaluate_single = true,
				header = default_header,
				items = {
					{ name = "Open Last Session", action = require("persisted").load, section = "Session" },

					starter.sections.recent_files(5, true, true),

					-- { name = "Open Explorer", action = open_explorer, section = "Builtin actions" },
					{ name = "Find Files", action = builtin.find_files, section = "Builtin actions" },
					starter.sections.builtin_actions(),
				},
				footer = footer,
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.indexing("all", { "Builtin actions", "Session" }),
					starter.gen_hook.padding(3, 2),
					starter.gen_hook.aligning("center", "center"),
				},
			})

			local opts = {
				noremap = true,
				silent = true,
				buffer = true,
			}

			local augroup = vim.api.nvim_create_augroup("MiniStarterJK", { clear = true })

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniStarterOpened",
				group = augroup,
				callback = function(ev)
					vim.keymap.set("n", "j", function()
						MiniStarter.update_current_item("next")
					end, opts)
					vim.keymap.set("n", "k", function()
						MiniStarter.update_current_item("prev")
					end, opts)
					vim.keymap.set("n", "<C-p>", function()
						require("telescope.builtin").find_files()
					end, opts)
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

					local footer_append = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					starter.config.footer = table.concat({
						starter.config.footer,
						"\n",
						footer_append,
					}, "\n")

					if vim.bo[ev.buf].filetype == "ministarter" then
						pcall(starter.refresh)
					end
				end,
			})
		end,
	},
}
