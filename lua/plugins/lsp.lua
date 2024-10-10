return {
  -- COREE
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = false,
    config = function()
      require('config.lsp')
    end
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      require("config.completion")
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup(
        {
          bind = true,
          max_width = 50,
          handler_opts = {
            border = "single",
          },
        }
      )
    end
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
}
