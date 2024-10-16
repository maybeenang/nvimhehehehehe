local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.cmdheight = 1
-- opt.completeopt = 'menuone,noselect,noinsert'
opt.scrolloff = 10
opt.showmode = false
opt.pumheight = 10

-- Behavior
opt.hidden = true -- Enable background buffers
opt.splitright = true -- Vertical splits will automatically be to the right
opt.splitbelow = true -- Horizontal splits will automatically be below
-- opt.updatetime = 300 -- Faster completion
opt.errorbells = false -- No error bells
opt.swapfile = false -- No swap files
opt.backup = false -- No backup files
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true -- Persistent undo
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.mouse = "a" -- Enable mouse support
opt.termguicolors = true -- True color support
opt.backspace = "indent,eol,start" -- Allow backspacing over everything in insert mode
opt.iskeyword:append("-") -- Treat dash separated words as a word text object
opt.modifiable = true -- Allow buffer modification
-- opt.smoothscroll = true -- Smooth scrolling
opt.pumblend = 10
opt.winblend = 10
-- opt.updatetime = 200
