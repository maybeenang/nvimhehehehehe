local highlight = {
  'RainbowDelimiterYellow',
  'RainbowDelimiterViolet',
  'RainbowDelimiterBlue',
}

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    event = "BufReadPre",
    config = function()
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
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufRead",
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      require('rainbow-delimiters.setup').setup {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
          -- javascript = rainbow_delimiters.strategy['local'],
          -- tsx = rainbow_delimiters.strategy['local'],
          -- typescript = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
          -- javascript = 'rainbow-parens',
          tsx = 'rainbow-parens',
          -- typescript = "rainbow-parens"
        },
        priority = {
          [''] = 110,
          tsx = 210,
          -- javascript = 310,
          -- typescript = 410,
        },
        highlight = highlight
      }
    end
  }
}
