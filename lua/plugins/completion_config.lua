return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- For hooking autocompletions into the active language server
		"hrsh7th/cmp-buffer", -- Buffer words
		"hrsh7th/cmp-path", -- For filesystem pahts
		"hrsh7th/cmp-cmdline", -- For comandline completions
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Hook lua snippets into cpm completion window
		"rafamadriz/friendly-snippets", -- VScode style snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Config luasnip
		luasnip.config.set_config({
			history = true,
			updateevents = "TextChanged, TextChangedI",
		})

		-- Config cmp
		cmp.setup({
			-- Snippet conf
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- Window customization
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			-- Mapping
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(), -- Open menu
				["<C-e>"] = cmp.mapping.abort(), -- Close menu
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Tab accepts selection
                    
                -- Select the next
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
                
                -- Select the previous
				["<C-p>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
            -- Set sources for completion
            sources = cmp.config.sources({
                { name = 'nvim_lsp'},
                { name = 'luasnip'},
                { name = 'path'},
                { name = 'buffer'},
            })
		})
	end,
}
