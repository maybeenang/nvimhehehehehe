return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	single_file_support = true,
	settings = {
		typescript = {
			-- inlayHints = {
			-- 	includeInlayParameterNameHints = "literals", -- "none" | "literals" | "all"
			-- 	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			-- 	includeInlayFunctionParameterTypeHints = false,
			-- 	includeInlayVariableTypeHints = false,
			-- 	includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			-- 	includeInlayPropertyDeclarationTypeHints = true,
			-- 	includeInlayFunctionLikeReturnTypeHints = true,
			-- 	includeInlayEnumMemberValueHints = true,
			-- },
		},
		javascript = {
			-- inlayHints = {
			-- 	includeInlayParameterNameHints = "literals",
			-- 	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			-- 	includeInlayFunctionParameterTypeHints = true,
			-- 	includeInlayVariableTypeHints = true,
			-- 	includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			-- 	includeInlayPropertyDeclarationTypeHints = true,
			-- 	includeInlayFunctionLikeReturnTypeHints = true,
			-- 	includeInlayEnumMemberValueHints = true,
			-- },
		},
	},
}
