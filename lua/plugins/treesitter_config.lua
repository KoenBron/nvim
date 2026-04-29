return {
    -- nvim-treesitter configuration
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false, -- nvim-treesitter does not support lazy loading
        build = ':TSUpdate',
        config = function()
            -- New ensure_installed method
            require('nvim-treesitter').install({
                'vim', 'lua', 'javascript', 'python',
                'dockerfile', 'bash', 'json', 'markdown',
                'markdown_inline', 'html', 'yaml', 'typst',
                'css', 'typescript', 'tsx', 'astro',
            })

            -- New highlighting using the neovim api
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
    -- nvim-treesitter-textobjects config
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            -- Base settings
            require('nvim-treesitter-textobjects').setup({
                select = { lookahead = true },
                move = { set_jumps = true },
            })

            -- Setup keymaps outside setup function, using the neovim api
            local select = require('nvim-treesitter-textobjects.select')
            local move = require('nvim-treesitter-textobjects.move')

            -- Select: Functies
            vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
            
            -- Select: Classes
            vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)

            -- Move: Volgende (Next)
            vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)

            -- Move: Vorige (Previous)
            vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
        end,
    }
}
