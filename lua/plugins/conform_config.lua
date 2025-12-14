return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
				})
			end,
			desc = "Format the whole file",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			sh = { "shfmt" },
            yaml = { "prettier" },
            yml = { "prettier" },
            dockerfile = { "prettier" },
            ["docker-compose"] = { "prettier" },
		},
		format_on_save = nil,
	},
}
