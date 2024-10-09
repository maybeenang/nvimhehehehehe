local actions = require("telescope.actions")

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        {"<C-p>", builtin.find_files, desc = "Find File"},
        {"<C-f>", builtin.live_grep, desc = "Find File"}
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
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()

      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({ winblend = 10 }),
          },
        },
      })
      telescope.load_extension("ui-select")
    end
  }
}
