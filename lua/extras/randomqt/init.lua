local function wrap_text(text, width)
	local lines = {}
	local line = ""
	for word in string.gmatch(text, "%S+") do
		if #line + #word + 1 > width then
			table.insert(lines, line)
			line = word
		else
			if #line > 0 then
				line = line .. " " .. word
			else
				line = word
			end
			vim.api.nvim_create_autocmd({ "QuitPre" }, {
				callback = function()
					vim.cmd("NvimTreeClose")
				end,
			})
		end
	end
	table.insert(lines, line)
	return lines
end

local function plugin_source_dir()
	local info = debug.getinfo(1, "S")
	local scriptPath = info.source:sub(2)
	return scriptPath:match("(.*/)")
end

-- Fungsi untuk menghitung panjang maksimal baris pada tabel
local function get_max_line_length(lines)
	local max_length = 0
	for _, line in ipairs(lines) do
		if #line > max_length then
			max_length = #line
		end
	end
	return max_length
end

-- Fungsi untuk mengambil kutipan acak dari file local
local function pick_random_quote(callback)
	-- Menggunakan dofile agar memory dibersihkan setelah quotes di-load
	local quotes = dofile(plugin_source_dir() .. "quotes.lua")
	local random_index = math.random(1, #quotes)
	local quote = quotes[random_index].content
	local author = quotes[random_index].author
	callback(quote, author)
	quotes = nil -- Membiarkan data agar bisa di garbage collected
end

local function get_random_quotes()
	local M = {}

	-- Mendapatkan kutipan dan author secara acak
	pick_random_quote(function(quote, author)
		M.quote = quote
		M.author = author
	end)

	-- Bungkus teks menjadi maksimal 50 karakter per baris
	M.quote = wrap_text(M.quote, 50)

	-- Hitung panjang maksimal baris dari quote
	local max_quote_length = get_max_line_length(M.quote)
	M.author = "-- " .. M.author

	-- Tambahkan padding dinamis agar author berada di kanan bawah
	local padding = string.rep(" ", max_quote_length - #M.author)

	-- Menambahkan author ke baris baru di bawah quote dengan padding di awal
	table.insert(M.quote, padding .. M.author)

	return M
end

-- Mengembalikan API publik
return {
	get_random_quotes = get_random_quotes,
}
