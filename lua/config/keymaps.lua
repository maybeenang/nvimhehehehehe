local set = vim.keymap.set

-- Window navigation
-- hjkl
set({ "n", "i", "v" }, "<C-h>", "<C-w>h", { noremap = true })
set({ "n", "i", "v" }, "<C-j>", "<C-w>j", { noremap = true })
set({ "n", "i", "v" }, "<C-k>", "<C-w>k", { noremap = true })
set({ "n", "i", "v" }, "<C-l>", "<C-w>l", { noremap = true })

-- Resize windows
set({ "n", "i", "v" }, "<S-Up>", ":resize +2<CR>", { noremap = true })
set({ "n", "i", "v" }, "<S-Down>", ":resize -2<CR>", { noremap = true })
set({ "n", "i", "v" }, "<S-Left>", ":vertical resize +2<CR>", { noremap = true })
set({ "n", "i", "v" }, "<S-Right>", ":vertical resize -2<CR>", { noremap = true })

-- Split windows
set({ "n" }, "<leader>wh", ":split<CR>", { noremap = true, desc = "New Window Horizontal" })
set({ "n" }, "<leader>wv", ":vsplit<CR>", { noremap = true, desc = "New Window Veritcal" })

-- Close windows
-- set({ 'n' }, '<leader>wc', ':close<CR>', { noremap = true, desc = "Close Current Window" })

-- Indenting
set({ "v" }, "<", "<gv")
set({ "v" }, ">", ">gv")

-- Move lines
set({ "n" }, "<A-j>", ":m .+1<CR>==", { noremap = true })
set({ "n" }, "<A-k>", ":m .-2<CR>==", { noremap = true })
set({ "i" }, "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
set({ "i" }, "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
set({ "v" }, "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
set({ "v" }, "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

if vim.g.neovide then
	vim.api.nvim_set_keymap("n", "<c-/>", "gcc", { noremap = false })
	vim.api.nvim_set_keymap("v", "<c-/>", "gc", { noremap = false })
	-- add comment while instert mode
	vim.api.nvim_set_keymap("i", "<c-/>", "<esc>gcci", { noremap = false })
else
	vim.api.nvim_set_keymap("n", "<c-_>", "gcc", { noremap = false })
	vim.api.nvim_set_keymap("v", "<c-_>", "gc", { noremap = false })
	-- add comment while instert mode
	vim.api.nvim_set_keymap("i", "<c-_>", "<esc>gcci", { noremap = false })

	vim.api.nvim_set_keymap("n", "<c-/>", "gcc", { noremap = false })
	vim.api.nvim_set_keymap("v", "<c-/>", "gc", { noremap = false })
	-- add comment while instert mode
	vim.api.nvim_set_keymap("i", "<c-/>", "<esc>gcci", { noremap = false })
end

-- nohl
set({ "n" }, "<esc>", ":nohl<CR>", { noremap = true, desc = "Clear Highlight" })

-- diagnostic
vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "lsp: diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "lsp: next diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "lsp: previous diagnostics" })

-- Leader keymaps
-- set({ "n" }, "<leader>q", ":q<CR>", { noremap = true, desc = "Quit" })
set({ "n" }, "<leader>Q", ":qa<CR>", { noremap = true, desc = "Quit All" })
set({ "n" }, "<leader>W", ":wa<CR>", { noremap = true, desc = "Write All" })
set({ "n" }, "<leader>w", ":w<CR>", { noremap = true, desc = "Write" })
set({ "n" }, "<leader>o", ":only<CR>", { noremap = true, desc = "Only" })

-- Buffer
-- Close buffer
set({ "n" }, "<leader>bd", ":bd<CR>", { noremap = true, desc = "Close Buffer" })
-- Close All buffer
set({ "n" }, "<leader>bD", ":%bd|e#|bd#<cr>", { noremap = true, desc = "Close Buffer" })

-- Buffer navigation
-- Next buffer
set({ "n" }, "<leader>bn", ":bnext<CR>", { noremap = true, desc = "Next Buffer" })

-- Previous buffer
set({ "n" }, "<leader>bp", ":bprevious<CR>", { noremap = true, desc = "Previous Buffer" })
