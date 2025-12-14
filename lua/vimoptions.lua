-- Set the tabwidth
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set the clipboard to copy to
vim.opt.clipboard = "unnamedplus"

-- Linenumber settings
vim.opt.number = true
vim.opt.relativenumber = true
-- This combi gives absolute linenumber at the highlighted line and otherwise relative

vim.opt.signcolumn = "number"
vim.opt.fillchars:append({ eob = " " })

-- Set undo settings to be persistent
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'

-- Set the shell options for the terminal
vim.opt.shell = 'C:\\Program Files\\PowerShell\\7\\pwsh.exe'
vim.opt.shellcmdflag = "-NoProfile -ExecutionPolicy Bypass -Command"
vim.opt.shellredir = "-RedirectStandardOutput"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8"

