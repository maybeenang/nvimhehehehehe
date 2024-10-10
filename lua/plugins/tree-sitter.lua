return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'
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
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    -- event = "BufRead",
    lazy = false,
    opts = {
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = true,
      update_on_insert = true -- Update tags on insert mode
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }
}
