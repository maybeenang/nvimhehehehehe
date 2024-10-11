return {
  "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "InsertEnter",
  config = function ()
    require("hardtime").setup()
  end
}
