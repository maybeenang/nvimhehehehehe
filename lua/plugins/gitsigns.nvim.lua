return {
  "lewis6991/gitsigns.nvim",
  event = "InsertEnter",
  config = function()
    require('gitsigns').setup()
  end
}
