return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
			hint = {
				enable = true,
				setType = true,
				paramType = true,
				paramName = "All", -- "All" | "Literal" | "Disable"
				semicolon = "SameLine", -- "All" | "SameLine" | "Disable"
				arrayIndex = "Enable", -- "Enable" | "Auto" | "Disable"
			},
		},
	},
}
