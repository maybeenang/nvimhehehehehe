return {
  -- COREE
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local builtin_tele = require('telescope.builtin')

      -- Keybindings

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP: attach",
        callback = function(event)
          local nset = function(key, result, desc)
            vim.keymap.set('n', key, result, { buffer = event.buf, desc = "lsp: " .. desc })
          end

          local iset = function(key, result, desc)
            vim.keymap.set('i', key, result, { buffer = event.buf, desc = "lsp: " .. desc })
          end


          nset("K", vim.lsp.buf.hover, "hover")
          nset("<leader>gd", builtin_tele.lsp_definitions, "Goto definition")
          nset("gi", builtin_tele.lsp_implementations, "Goto implementation")
          nset('<leader>gr', builtin_tele.lsp_references, "Goto references")
          nset('<leader>go', builtin_tele.lsp_type_definitions, "Goto type definition")
          nset("gD", vim.lsp.buf.declaration, "Goto declaration")
          nset('gs', vim.lsp.buf.signature_help, "Signature help")
          nset('<F2>', vim.lsp.buf.rename, "Rename")
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
            { buffer = event.buf, desc = "Format" })
          nset("<leader>gr", require("telescope.builtin").lsp_references, "Open references")
          nset("<leader>ca", vim.lsp.buf.code_action, "Code action")
          nset("<leader>ih", function()
            local enabled = vim.lsp.inlay_hint.is_enabled({})
            vim.lsp.inlay_hint.enable(not enabled)
          end, "inlay hint")
        end
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      local default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities = lsp_capabilities,
        })
      end

      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          default_setup,
        },
      })

      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- Ctrl + space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
  },
  {
    "L3MON4D3/LuaSnip"
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
}
