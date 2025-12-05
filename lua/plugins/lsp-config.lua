return {
	{
		-- Package to install languge servers
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		-- Package to not use the default mason installer
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			-- All language servers we want installed
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"vimls",
				"stylua",
				"pyright",
				"ruff",
			},
		},
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")

			-- Capabilities, adjust when implement cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			-- Use cmp capabilities have cmp hook into the LSP
			if ok_cmp then
				capabilities = cmp_lsp.default_capabilities(capabilities)
			end

			-- Create the on attach function, that creates the required keybinds on attaching to a buffer
			local on_attach = function(_, bufnr)
				-- Define a simple function
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Just to make sure it's installed :)
				local tb_ok, tb = pcall(require, "telescope.builtin")

				if tb_ok then
					-- Keybinds to move to definitions using the vim lsp API
					map("n", "gd", tb.lsp_definitions, "Goto definition")
					-- map('n', 'gD', tb.lsp_declarations, 'Goto declaration') -- Doens't work for some reason
					map("n", "gi", tb.lsp_implementations, "Goto implementation")
					map("n", "gr", tb.lsp_references, "Goto references")
				else
					map("n", "gd", vim.lsp.buf.definition, "Goto definition")
					map("n", "gd", vim.lsp.buf.declaration, "Goto definition")
					map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
					map("n", "gr", vim.lsp.buf.references, "Goto references")
				end
				-- Keybinds to get information about what the cursor hovers on
				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help, info on function arguments")
				map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help, info on function arguments")

				-- Refactor
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

				-- Diagnostics
				map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
				map("n", "<leader>e", vim.diagnostic.open_float, "Diagnostics line")
				map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics Loclist")

				-- Formatting
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "Format the entire file")
			end -- End of the on_attach function
			-- Setup the mason_lspconfig
			mason_lspconfig.setup(opts)

			local servers = mason_lspconfig.get_installed_servers()

			-- Simple for loop for custom and default server configs
			for _, server in ipairs(servers) do
				if server == "lua_ls" then
					vim.lsp.config(server, {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				elseif server == "pyright" then
					vim.lsp.config(server, {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							pyright = {
								disableOrganizeImports = true,
							},
							python = {
								analysis = {
                                    typeCheckingMode = "off",
								},
							},
						},
					})

					-- Ruff is apparently an LSP now
				elseif server == "ruff" then
					vim.lsp.config(server, {
						capabilities = capabilities,
						on_attach = on_attach
					})
				else
					vim.lsp.config(server, {

						capabilities = capabilities,
						on_attach = on_attach,
					})
					vim.lsp.enable(server)
				end
			end -- End for loop
		end, -- End config function()
	},
	{
		-- LSP configurations
		"neovim/nvim-lspconfig",
	},
}
