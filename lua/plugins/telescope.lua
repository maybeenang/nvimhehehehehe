local actions = require("telescope.actions")

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = function()
      local builtin = require("telescope.builtin")
      -- local frecency = require("telescope").extensions.frecency.frecency
      return {
        { "<C-p>", builtin.find_files, desc = "Find File" },
        { "<leader>p", ":Telescope frecency workspace=CWD theme=dropdown previewer=false<CR>", desc = "Find File" },
        { "<C-f>", builtin.live_grep,  desc = "Find File" }
      }
    end,
    config = function()
      local telescope = require("telescope")
      telescope.setup({
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
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({ winblend = 10 }),
          },
          frecency = {
            show_scores = true,
            show_unindexed = true,
            show_filter_columns = false,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
          }
        },
      })
      telescope.load_extension("ui-select")
      telescope.load_extension("frecency")
    end
  },
}
