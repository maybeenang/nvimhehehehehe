local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format({details = true})

require('luasnip.loaders.from_vscode').lazy_load()
local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

cmp.setup({
  sources = {
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip",  group_index = 2 },
    { name = "buffer",  group_index = 2 },
    { name = "path",     group_index = 2 },
  },

  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  -- formatting = cmp_format,

  formatting = {

    fields = { 'kind', 'abbr' },
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      show_labelDeatils = true,
      symbol_map = cmp_kinds,
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- INI ANEH GA JELAS
    -- ['<TAB>'] = cmp_action.luasnip_supertab(),
    -- ['<S-TAB>'] = cmp_action.luasnip_supertab(),
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
    -- documentation = cmp.config.window.bordered(),
  },
})

