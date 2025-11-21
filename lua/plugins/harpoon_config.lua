return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({})

        local map = vim.keymap.set

        -- Add current file
        map("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Harpoon add file" })

        -- Quick menu
        map("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon quick menu" })

        -- Direct jumps to slots 1–4
        map("n", "<leader>h1", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon to file 1" })

        map("n", "<leader>h2", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon to file 2" })

        map("n", "<leader>h3", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon to file 3" })

        map("n", "<leader>h4", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon to file 4" })

        -- Next / previous harpoon file
        map("n", "<leader>hn", function()
            harpoon:list():next()
        end, { desc = "Harpoon next" })

        map("n", "<leader>hp", function()
            harpoon:list():prev()
        end, { desc = "Harpoon prev" })
    end,
}
