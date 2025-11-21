-- Include all keybind files by iterating over them
local keybind_files = vim.fn.stdpath('config') .. '/lua/keybinds'

for _, file in ipairs(vim.fn.readdir(keybind_files)) do
    require('keybinds.' .. file:gsub('%.lua$', ''))
end
