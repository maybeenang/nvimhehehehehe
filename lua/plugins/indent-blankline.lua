return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    event = "BufReadPre",
    config = function()
      local highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterViolet',
        'RainbowDelimiterBlue',
      }
      require("ibl").setup({
        indent = {
          char = "│",
          priority = 2,
        },
        scope = {
          highlight = highlight,
          show_start = false,
          show_end = false,
          show_exact_scope = true
        }
      })
    end
  },
}
