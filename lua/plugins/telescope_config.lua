return {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- for icons
        'nvim-telescope/telescope-ui-select.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end
        },
        'debugloop/telescope-undo.nvim',
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local themes = require('telescope.themes')

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("undo")
        
        -- Customization
        telescope.setup({
            defaults = {
                -- Pretify the filesearch menu
                prompt_prefix = '~  ',
                selection_caret = '[] ',
                layout_strategy = 'flex',
                sorting_strategy = 'ascending',
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,
                        prompt_position = 'top'
                    }
                },
                -- Transparancy and icons
                winblend = 5,
                color_devicons = true,

                -- In menu keymappings
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<Esc>"] = actions.close,
                    },
                    n = {
                        ['q'] = actions.close
                    }
                },
            },



            extensions = {
                -- For fuzzy searching results
                fzf = {
                  fuzzy = true,                    -- false will only do exact matching
                  override_generic_sorter = true,  -- override the generic sorter
                  override_file_sorter = true,     -- override the file sorter
                  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                },
                -- idk, chat said it should look nice
                ['ui-select'] = {
                    themes.get_ivy({
                        previewer = false,
                        winblend = 5,

                    })
                },
                undo = {
                    side_by_side = true,
                    use_delta = true,
                    layout_strategy = 'vertical',
                    previewer = true,
                    layout_config = {
                        preview_height = 0.8,
                    }
                }
            }
        })
        
        -- Keymappings
        local map = vim.keymap.set

        -- Finding and grepping in files
        map('n', '<leader>ff', builtin.find_files, { desc = '(Telescope) Find files' })
        map('n', '<leader>fw', builtin.live_grep , { desc = '(Telescope) Grep word' })

        -- Undo tree commands
        map('n', '<leader>u', '<cmd>Telescope undo<CR>', { desc = 'Toggle telescope undotree '})
            
        -- Set the border color
        vim.api.nvim_set_hl(0, "TelescopeBorder",         { fg = "#00ffff", bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = "#00ffff", bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = "#00ffff", bg = "none" }) 
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = "#00ffff", bg = "none" })
    end
}
