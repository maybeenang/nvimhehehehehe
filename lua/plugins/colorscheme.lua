return {
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    event = 'VimEnter',
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1001,
  }
}
