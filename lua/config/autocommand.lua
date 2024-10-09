-- Highlighted yank
vim.cmd [[
augroup yank_highlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
augroup END
]]

