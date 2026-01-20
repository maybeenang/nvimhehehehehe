return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"blade",
	},
	root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", ".git" },
	settings = {
		tailwindCSS = {
			classFunctions = { "cva", "cx" },
			experimental = {
				classRegex = {
					"cva\\((\"[^\"]*\"|'[^']*')", -- cva("...")
					"cx\\((\"[^\"]*\"|'[^']*')", -- cx("...")
				},
			},
		},
	},
}
