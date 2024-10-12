return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  lazy = false,
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  config = function()
    require('dashboard').setup {
      config = {
        week_header = {
         enable = true,
        }
      }
    }
  end,
}
