return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- Telescope bits
    local pickers      = require("telescope.pickers")
    local finders      = require("telescope.finders")
    local conf         = require("telescope.config").values
    local themes       = require("telescope.themes")
    local actions      = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function toggle_telescope(harpoon_files)
      -- Build numbered list for display, keep raw paths separately
      local raw_paths = {}

      for _, item in ipairs(harpoon_files.items) do
        table.insert(raw_paths, item.value)
      end

      local opts = themes.get_dropdown({
        previewer      = false,
        width          = 0.3,
        winblend       = 0,
        results_height = 3,
      })

      pickers.new(opts, {
        finder = finders.new_table({
          results = raw_paths,
        }),
        sorter = conf.generic_sorter(opts),
        previewer = false,

        attach_mappings = function(prompt_bufnr, map)
          -- dd deletes the selected harpoon entry
          map("n", "dd", function()
            local selection = action_state.get_selected_entry()
            if not selection then
              return
            end

            -- selection.index corresponds to our numbered entry
            local selection_id = selection.index

            -- Remove from Harpoon list
            harpoon:list():remove_at(selection_id)

            -- Close picker and reopen with updated list
            actions.close(prompt_bufnr)
            toggle_telescope(harpoon:list())
          end)

          -- Optional: <CR> opens the file (default would too, but this is explicit)
          map("n", "<CR>", function()
            local selection = action_state.get_selected_entry()
            if not selection then
              return
            end

            local selection_id = selection.index
            local path = raw_paths[selection_id]
            actions.close(prompt_bufnr)
            vim.cmd("edit " .. path)
          end)

          return true -- IMPORTANT so Telescope keeps the mappings
        end,
      }):find()
    end

    local map = vim.keymap.set

    -- Add current file
    map("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })

    -- Quick menu
    map("n", "<leader>hh", function()
      toggle_telescope(harpoon:list())
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

