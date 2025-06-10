vim.diagnostic.config({
	underline = true,
	undercurl = true,
	signs = true,
	virtual_text = true,
	-- virtual_lines = true,
	float = {
		show_header = true,
		border = "rounded",
		format = function(d)
			if not d.code and not d.user_data then
				return d.message
			end
			local t = vim.deepcopy(d)
			local code = d.code
			if not code then
				if not d.user_data.lsp then
					return d.message
				end

				code = d.user_data.lsp.code
			end
			if code then
				t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
			end
			return t.message
		end,
	},

	severity_sort = true,
	update_in_insert = true,
})
