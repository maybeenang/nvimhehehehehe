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
      local lsp_zero = require('lsp-zero')
      local builtin_tele = require('telescope.builtin')

      local lsp_attach = function(client, bufnr)
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
        vim.keymap.set({ 'n', 'x' }, '<F3>', vim.lsp.buf.format,
          { buffer = bufnr, desc = "Format" })
        nset("<leader>gr", require("telescope.builtin").lsp_references, "Open references")
        nset("<leader>ca", vim.lsp.buf.code_action, "Code action")
        nset("<leader>ch", function()
          local enabled = vim.lsp.inlay_hint.is_enabled({})
          vim.lsp.inlay_hint.enable(not enabled)
        end, "inlay hint")
      end

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      lsp_zero.extend_lspconfig({
        sign_text = {
          error = '✘',
          warn = '▲',
          hint = '⚑',
          info = '»',
        },
        lsp_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })


      local default_setup = function(server)
        require('lspconfig')[server].setup({})
      end
      require('mason-lspconfig').setup({
        ensure_installed = { "html", "lua_ls", "ts_ls" },
        automatic_installation = true,
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
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim"
    },
    config = function()
      local cmp = require('cmp')
      -- local cmp_format = require('lsp-zero').cmp_format({ details = true })
      local cmp_action = require('lsp-zero').cmp_action()


      -- local has_words_before = function()
      --   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      --   local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
      --   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      -- end


      cmp.setup({
        sources = {
          -- Copilot Source
          -- { name = "copilot",  group_index = 2 },
          -- Other Sources
          { name = "nvim_lsp", group_index = 2 },
          { name = "path",     group_index = 2 },
          { name = "luasnip",  group_index = 2 },
          -- { name = 'nvim_lsp' },
          -- { name = 'buffer' },

        },
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        -- formatting = cmp_format,
        formatting = {
          fields = { 'abbr', 'kind', 'menu' },
          format = require('lspkind').cmp_format({
            mode = 'symbol',       -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
            -- symbol_map = {
            --   Copilot = ""
            -- }
          })
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({
            -- behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ['<C-Space>'] = cmp.mapping.complete(),
          -- ['<Tab>'] = cmp_action.luasnip_supertab(),
          -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
          --   if cmp.visible() and has_words_before() then
          --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          --   else
          --     fallback()
          --   end
          -- end),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          width = 60,
          height = 15,
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
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
