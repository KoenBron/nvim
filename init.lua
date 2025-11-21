-- Set personal vim settings and keybindings
require('vimoptions')
require('vimkeybinds')

-- Check if lazy vim is download by checking if the paht tis there
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If not ther clone it
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")-- Scan all plugin configs in ./lua/plugins
