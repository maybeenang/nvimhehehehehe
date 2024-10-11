return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "m-demare/hlargs.nvim",
      "windwp/nvim-ts-autotag",
    },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- WINDOWS 10
      require("nvim-treesitter.install").compilers = { "zig" }

      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "html",
          "css",
          "php",
        },
        sync_install = false,
        auto_install = true,
      }
    end,
  },
}
