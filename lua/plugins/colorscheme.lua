return {
  { "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1001,
  }
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
  -- {
  --   'tanvirtin/monokai.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme monokai]])
  --   end
  -- },
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("monokai-pro").setup({
  --       filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
  --       day_night = {
  --         enable = true, -- turn off by default
  --         day_filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
  --         night_filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
  --       },
  --       inc_search = "underline", -- underline | background
  --       plugins = {
  --         bufferline = {
  --           underline_selected = false,
  --           underline_visible = false,
  --         },
  --         indent_blankline = {
  --           context_highlight = "default", -- default | pro
  --           context_start_underline = false,
  --         },
  --       }
  --     })
  --
  --     vim.cmd([[colorscheme monokai-pro]])
  --   end
  -- },
  -- {
  --   "ku1ik/vim-monokai",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme monokai]])
  --   end
  -- },
}
