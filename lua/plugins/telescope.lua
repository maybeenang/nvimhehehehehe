local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

return {
    	'nvim-telescope/telescope.nvim',
	dependencies = { 
		'nvim-lua/plenary.nvim' 
	},
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{"<C-p>", builtin.find_files, desc = "Find File"}
		}
	end,
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
    },
  }
}
