return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  event = "BufReadPre",
  config = function()
    require("ibl").setup({

    })
  end
}
