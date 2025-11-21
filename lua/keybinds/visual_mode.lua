-- Visual mode

-- -- Indenting
vim.keymap.set('v', '>', '>gv', { noremap=true, silent=true})
vim.keymap.set('v', '<', '<gv', { noremap=true, silent=true})

-- -- Multiline commenting
vim.keymap.set('v', '<leader>/', 'gc', { remap = true, silent=true})
