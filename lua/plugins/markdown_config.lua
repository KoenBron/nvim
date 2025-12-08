return {
    -- Markview for in terminal preview, uncomment when installing the command line interfaces
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("markview").setup({
        preview = {
          enable = true,
          hybrid_modes = { "n", "i" }, -- renders in both normal & insert
        },
      })
    end,
  },
    -- Markdown preview, not working atm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    -- config = function()
    --   vim.g.mkdp_auto_start = 0
    --   vim.g.mkdp_auto_close = 1
    --   vim.g.mkdp_refresh_slow = 0
    --   vim.g.mkdp_open_to_the_world = 0
    --   vim.g.mkdp_open_ip = ""
    --   vim.g.mkdp_browser = ""
    --   vim.g.mkdp_echo_preview_url = 1
    --   vim.g.mkdp_page_title = "Markdown Preview"
    --   vim.g.mkdp_filetypes = { "markdown" }
    --
    --   vim.g.mkdp_preview_options = {
    --     mkit = {},
    --     katex = {},
    --     uml = {},
    --     maid = {},
    --     disable_sync_scroll = 0,
    --     sync_scroll_type = "middle",
    --     hide_yaml_meta = 1,
    --     sequence_diagrams = {},
    --     flowchart_diagrams = {},
    --     content_editable = false,
    --     disable_filename = 0,
    --   }
    -- end,
  },
}
