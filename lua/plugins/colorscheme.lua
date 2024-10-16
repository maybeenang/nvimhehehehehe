return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    event = "VimEnter",
    cmd = "Theme",
    config = function()
      require("themery").setup({
        themes = {
          "catppuccin",
          -- "monokai-pro",
          "onedark",
          {
            name = "Monokai Classic",
            colorscheme = "monokai-pro",
            before = [[
              require("monokai-pro").setup({
                filter = "classic",
              })
            ]]
          },
          {
            name = "Monokai Machine",
            colorscheme = "monokai-pro",
            before = [[
              require("monokai-pro").setup({
                filter = "machine",
              })
            ]]
          }
        },
        livePreview = true,
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    'loctvl842/monokai-pro.nvim',
    name = 'monokai-pro',
  },
  {
    "olimorris/onedarkpro.nvim",
  }
}
