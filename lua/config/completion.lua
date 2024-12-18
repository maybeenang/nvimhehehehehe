local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
-- local cmp_format = require('lsp-zero').cmp_format({ details = true })

require("luasnip").filetype_extend("javasriptreact", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

-- local bootstrap = {
-- 	name = "html-css",
-- 	option = {
-- 		enable_on = {
-- 			"html",
-- 			"blade",
-- 			"php",
-- 		}, -- set the file types you want the plugin to work on
-- 		dir_to_exclude = { "node_modules" },
-- 		file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
-- 		style_sheets = {
-- 			-- example of remote styles, only css no js for now
-- 			"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
-- 			"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
-- 		},
-- 	},
-- }

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		-- bootstrap,
		{ name = "luasnip", max_item_count = 5 },
		{ name = "buffer", max_item_count = 5 },
		{ name = "path" },
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},

	formatting = {
		fields = {
			cmp.ItemField.Kind,
			cmp.ItemField.Abbr,
			cmp.ItemField.Menu,
		},

		format = require("lspkind").cmp_format({
			mode = "symbol",
			preset = "codicons",
			maxwidth = 50,
			ellipsis_char = "...",
			menu = {
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				buffer = "[Buffer]",
				path = "[Path]",
			},
			before = require("tailwind-tools.cmp").lspkind_format,
			-- before = function(entry, vim_item)
			-- 	if entry.source.name == "html-css" then
			-- 		vim_item.menu = entry.completion_item.menu
			-- 	end
			-- 	return vim_item
			-- end,
		}),
	},

	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
		-- INI ANEH GA JELAS
		-- ['<TAB>'] = function()
		--   if require('copilot.suggestion').is_visible() ~= true then
		--     cmp_action.luasnip_supertab()
		--   else
		--     require('copilot.suggestion').accept()
		--   end
		-- end,
		["<S-TAB>"] = cmp_action.luasnip_supertab(),
		--
		-- ['<ESC>'] = cmp.mapping.close(),
		["<C-e>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.select_next_item({ select = false }),
		["<C-k>"] = cmp.mapping.select_prev_item({ select = false }),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
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
