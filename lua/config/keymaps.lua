local set = vim.keymap.set

-- Window navigation
-- hjkl
set({ 'n', 'i', 'v' }, '<C-h>', '<C-w>h', { noremap = true })
set({ 'n', 'i', 'v' }, '<C-j>', '<C-w>j', { noremap = true })
set({ 'n', 'i', 'v' }, '<C-k>', '<C-w>k', { noremap = true })
set({ 'n', 'i', 'v' }, '<C-l>', '<C-w>l', { noremap = true })

-- Resize windows
-- set({ 'n', 'i', 'v' }, '<S-Up>', ':resize +2<CR>', { noremap = true })
-- set({ 'n', 'i', 'v' }, '<S-Down>', ':resize -2<CR>', { noremap = true })
-- set({ 'n', 'i', 'v' }, '<S-Left>', ':vertical resize +2<CR>', { noremap = true })
-- set({ 'n', 'i', 'v' }, '<S-Right>', ':vertical resize -2<CR>', { noremap = true })

-- Split windows
set({ 'n' }, '<leader>h', ':split<CR>', { noremap = true, desc = "New Window Horizontal" })
set({ 'n' }, '<leader>v', ':vsplit<CR>', { noremap = true, desc = "New Window Veritcal" })

-- Close windows
-- set({ 'n' }, '<leader>wc', ':close<CR>', { noremap = true, desc = "Close Current Window" })

-- Indenting
set({ 'v' }, '<', '<gv')
set({ 'v' }, '>', '>gv')

-- Move lines
set({ 'n' }, '<A-j>', ':m .+1<CR>==', { noremap = true })
set({ 'n' }, '<A-k>', ':m .-2<CR>==', { noremap = true })
set({ 'i' }, '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
set({ 'i' }, '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
set({ 'v' }, '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
set({ 'v' }, '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- commenting
vim.api.nvim_set_keymap('n', '<c-_>', 'gcc', { noremap = false })
vim.api.nvim_set_keymap('v', '<c-_>', 'gcgv', { noremap = false })


vim.keymap.set('n', '<leader>gD', vim.diagnostic.open_float, { desc = "lsp: diagnostics" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "lsp: next diagnostics" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "lsp: previous diagnostics" })
