return {
  -- COREE
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
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
      "ray-x/lsp_signature.nvim",
    },
    config = function()
      require("config.completion")
    end
  },
  {
    "windwp/nvim-ts-autotag",
    event = {"BufReadPre", "BufNewFile"},
    lazy = false,
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "php"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
}
