local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
-- local cmp_format = require('lsp-zero').cmp_format({ details = true })

require("luasnip").filetype_extend("javasriptreact", { "html" })
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = "nvim_lsp", },
    { name = "luasnip", },
    { name = "buffer", },
    { name = "path", },
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  -- formatting = cmp_format,

  formatting = {

		fields = {
			cmp.ItemField.Kind,
			cmp.ItemField.Abbr,
			cmp.ItemField.Menu,
		},

    format = require('lspkind').cmp_format({
      mode = 'symbol',
      preset = 'codicons',
      maxwidth = 50,
      ellipsis_char = '...',
      menu = {
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        buffer = "[Buffer]",
        path = "[Path]",
      },
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- INI ANEH GA JELAS
    ['<TAB>'] = cmp_action.luasnip_supertab(),
    ['<S-TAB>'] = cmp_action.luasnip_supertab(),
    --
    -- ['<ESC>'] = cmp.mapping.close(),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    width = 60,
    height = 15,
    -- completion = cmp.config.window.bordered(),
    documentation = {
      max_height = 15,
      max_width = 60,
    },
  },
})


cmp.setup.cmdline('/', {
  view = {
    entries = { name = 'wildmenu', separator = '|' }
  },
})


-- require("lsp_signature").setup(
--   {
--     -- bind = true,
--     max_width = 50,
--     handler_opts = {
--       border = "single",
--     },
--   }
-- )
