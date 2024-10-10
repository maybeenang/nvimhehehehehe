return {
  -- COREE
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- config = function()
    --
    --   -- Keybindings
    --   vim.api.nvim_create_autocmd("LspAttach", {
    --     desc = "LSP: attach",
    --     callback = function(event)
    --     end
    --   })
    -- end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = false,
    config = function()
      local lsp_zero = require('lsp-zero')
      local builtin_tele = require('telescope.builtin')

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(client, bufnr)
        -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        -- vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        local nset = function(key, result, desc)
          vim.keymap.set('n', key, result, { buffer = bufnr, desc = "lsp: " .. desc })
        end

        nset("K", vim.lsp.buf.hover, "hover")
        nset("<leader>gd", builtin_tele.lsp_definitions, "Goto definition")
        nset("gi", builtin_tele.lsp_implementations, "Goto implementation")
        nset('<leader>gr', builtin_tele.lsp_references, "Goto references")
        nset('<leader>go', builtin_tele.lsp_type_definitions, "Goto type definition")
        -- nset("gd", vim.lsp.buf.definition, "Goto definition")
        nset("gD", vim.lsp.buf.declaration, "Goto declaration")
        nset('gs', vim.lsp.buf.signature_help, "Signature help")
        nset('<F2>', vim.lsp.buf.rename, "Rename")
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
          { buffer = bufnr, desc = "Format" })
        nset("<leader>gr", require("telescope.builtin").lsp_references, "Open references")
        nset("<leader>ca", vim.lsp.buf.code_action, "Code action")
        nset("<leader>ch", function()
          local enabled = vim.lsp.inlay_hint.is_enabled({})
          vim.lsp.inlay_hint.enable(not enabled)
        end, "inlay hint")
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      local default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities = lsp_capabilities,
        })
      end
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          default_setup,
        },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require('cmp')
      local cmp_format = require('lsp-zero').cmp_format({ details = true })
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        formatting = cmp_format,
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- Ctrl + space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            -- require('luasnip').lsp_expand(args.body)
            vim.snippet.expand(args.body)
          end,
        },
      })
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
