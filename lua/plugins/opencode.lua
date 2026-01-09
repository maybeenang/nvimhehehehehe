return {
	"NickvanDyke/opencode.nvim",
	lazy = false,
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			provider = {
				enabled = "tmux",
				tmux = {
					-- Opsi untuk tmux split-window
					-- -h = horizontal split (atas/bawah)
					-- -v = vertical split (kiri/kanan)
					-- -l = size dalam lines/columns (absolute)
					-- -p = size dalam percentage
					-- -b = buat pane di kiri/atas target
					-- -f = full width/height split

					-- Contoh: vertical split dengan lebar 80 kolom
					options = "-h -p 30",

					-- Alternatif lainnya:
					-- options = "-v -p 40",  -- vertical split, 40% dari lebar window
					-- options = "-h -l 20",  -- horizontal split, 20 baris tinggi
					-- options = "-h -p 30",  -- horizontal split, 30% dari tinggi window
				},
			},
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- Recommended/example keymaps.
		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode" })
		vim.keymap.set({ "n", "x" }, "<leader>ox", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })
		vim.keymap.set({ "n", "t" }, "<leader>ot", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { expr = true, desc = "Add range to opencode" })
		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { expr = true, desc = "Add line to opencode" })

		vim.keymap.set("n", "<leader>ou", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "opencode half page up" })
		vim.keymap.set("n", "<leader>od", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "opencode half page down" })

		-- Restore default increment/decrement keymaps (no longer needed since we use leader keys)
		-- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
		-- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
	end,
}
