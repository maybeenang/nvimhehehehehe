local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- Initialize lspkind with codicons preset
lspkind.init({ preset = "codicons" })

require("luasnip").filetype_extend("javasriptreact", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

-- Helper function for supertab behavior
local function luasnip_supertab(fallback)
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	elseif cmp.visible() then
		cmp.select_next_item()
	else
		fallback()
	end
end

-- Source labels
local source_labels = {
	nvim_lsp = "[LSP]",
	luasnip = "[LuaSnip]",
	buffer = "[Buffer]",
	path = "[Path]",
}

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
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

		format = function(entry, vim_item)
			-- Get the icon from lspkind
			local icon = lspkind.symbol_map[vim_item.kind] or ""
			vim_item.kind = icon
			vim_item.menu = source_labels[entry.source.name] or ""

			-- Truncate abbr if too long
			if vim.fn.strchars(vim_item.abbr) > 50 then
				vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, 50) .. "..."
			end

			return vim_item
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<S-TAB>"] = cmp.mapping(luasnip_supertab, { "i", "s" }),
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
		documentation = {
			max_height = 15,
			max_width = 60,
		},
	},
})
