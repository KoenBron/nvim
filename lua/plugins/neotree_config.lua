return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
        { '<C-n>', ':Neotree toggle<CR>', { silent = true, desc = 'Neotree toggle' }}
    },
    opts = {
        close_if_last_window = true,
        filesystem = {
            follow_current_file = {
                enabled = true
            },
            use_libuv_file_watcher = false,
            filtered_items = {
                hide_dotfiles = false,
                hide_git_ignored = false,
                hide_hidden = false
            }
        },
        window = {
            position = 'left',
            size = 30
        }
    }
  }
}
