return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function()
        local config = require('nvim-treesitter.configs')
        config.setup({
            ensure_installed = {
                'vim',
                'lua',
                'javascript',
                'python',
                'bash',
                'json',
                'dockerfile',
            },
            -- Install the parsers
            auto_install = true,

            -- Enable highlighting and indenting
            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },

            disable = {
            },

            -- Select between function blocks
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = 'grm',
                }
            },

            -- Navigate between functions
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    }
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']f'] = '@function.outer',
                        [']c'] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[f'] = '@function.outer',
                        ['[c'] = '@class.outer',
                    },
                },
            }
        })
    end,
}
