return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        -- Prefers to config function as opposed to opts
        require('catppuccin').setup({
            flavour = 'mocha',
            auto_integration = true,
        })
        
        -- Actually set the theme using vim cmd
        vim.cmd.colorscheme('catppuccin')
        
    end,
}
