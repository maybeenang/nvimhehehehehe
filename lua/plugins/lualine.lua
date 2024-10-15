return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'arkav/lualine-lsp-progress'
  },
  lazy = false,
  config = function()
    -- LSP clients attached to buffer
    require("config.lualine")
  end
}
