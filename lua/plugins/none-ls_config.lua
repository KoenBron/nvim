return {
    -- This plugin nvim treat CLI tools for formatting as language servers, so it can hook into the vim lsp api
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    -- None-ls is a fork of null-ls
    config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                -- Add formatters here, nvim automatically selects formatters
                null_ls.builtins.formatting.stylua,-- formatting for formatting and diagnostics for linting
            }
        })
    end
}
