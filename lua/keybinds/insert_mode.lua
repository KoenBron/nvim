-- Insert mode

-- -- Exit insert fast
vim.keymap.set('i', 'jj', '<Esc>', { noremap=true })

-- -- Moving in insert mode
vim.keymap.set('i', '<C-h>', '<C-o>h', { noremap=true })
vim.keymap.set('i', '<C-j>', '<C-o>j', { noremap=true })
vim.keymap.set('i', '<C-k>', '<C-o>k', { noremap=true })
vim.keymap.set('i', '<C-l>', '<C-o>l', { noremap=true })
