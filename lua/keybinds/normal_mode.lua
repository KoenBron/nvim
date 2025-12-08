-- -- Diagnostics 
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics line" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics Loclist" })
-- -- Movement between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap=true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap=true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap=true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap=true })

-- -- Move around lines
vim.keymap.set('n', 'L', '$', { noremap=true })
vim.keymap.set('n', 'H', '_', { noremap=true })

vim.keymap.set('n', '<leader>o', 'o<Esc>diw', { desc = 'Newline below without entering insert mode'})
vim.keymap.set('n', '<leader>O', 'O<Esc>diw', { desc = 'Newline above without entering insert mode'})

-- -- Split windows
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = "Vertically split screen" })
vim.keymap.set('n', '<leader>sh', '<cmd>hsplit<CR>', { desc = "Horizontally split screen" })

vim.keymap.set('n', '<leader>V', '<C-w>v', { desc = "Vertically split current screen" })
vim.keymap.set('n', '<leader>H', '<C-w>h', { desc = "Horizontally split current screen" })

-- Misc
vim.keymap.set('n', ';', ':', { remap = true })
vim.keymap.set('n', '<Esc>', ':noh<CR>', { desc = "Clear highlights if any"})
