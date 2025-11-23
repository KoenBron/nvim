return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return math.floor(vim.o.columns * 0.4)
            end
        end,
        direction = "horizontal",
        hide_numbers = true,
        persist_size = true,
        shell = vim.o.shell,
        shade_terminals = true,
        shading_factor = -30,
        start_in_insert = true,
        horizontal_opts = {
            border = 'rounded',
        }
    },
    config = function(_, opts)
        -- Apply opts
        require("toggleterm").setup(opts)

        local Terminal = require("toggleterm.terminal").Terminal
        
        -- Horizontal terminal
        local hor_term = Terminal:new({ direction = "horizontal", hidden = true })
        vim.keymap.set("n", "<leader>t", function()
            hor_term:toggle()
        end, { desc = "Toggle horizontal terminal" })

        -- Floating terminal
        local float_term = Terminal:new({ direction = "float", hidden = true })
        vim.keymap.set("n", "<leader>ft", function()
            float_term:toggle()
        end, { desc = "Toggle floating terminal" })

        -- Vertical terminal
        local vert_term = Terminal:new({ direction = "vertical", hidden = true })
        vim.keymap.set("n", "<leader>vt", function()
            vert_term:toggle()
        end, { desc = "Toggle vertical terminal" })

        -- Escape to normal mode from terminal
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
}
