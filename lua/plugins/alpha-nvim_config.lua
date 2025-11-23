return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter", -- On entering nvim
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		--------------------------------------------------
		-- Header (ASCII art)
		--------------------------------------------------
		dashboard.section.header.val = {
			" ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
			" ████╗  ██║██║   ██║██║████╗ ████║",
			" ██╔██╗ ██║██║   ██║██║██╔████╔██║",
			" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"           Neovim Launcher        ",
		}

		--------------------------------------------------
		-- Buttons
		--------------------------------------------------
		local function button(sc, txt, keybind)
			-- Create buttons
			local b = dashboard.button(sc, txt, keybind)
			-- Make it look nicer
			b.opts.hl = "Function"
			b.opts.hl_shortcut = "Type"
			return b
		end

		dashboard.section.buttons.val = {
			button("f", "  Find file", ":Telescope find_files<CR>"),
			button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			button("g", "  Live grep", ":Telescope live_grep<CR>"),
			button("n", "  New file", ":enew<CR>"),
			button("c", "  Config", ":e $MYVIMRC<CR>"),
			button("q", "  Quit", ":qa<CR>"),
		}

		--------------------------------------------------
		-- Footer (tiny status text)
		--------------------------------------------------
		dashboard.section.footer.val = function()
			local v = vim.version()
			local nvim_version = string.format("  Neovim v%d.%d.%d", v.major, v.minor, v.patch)
			local date = os.date("  %Y-%m-%d")
			local time = os.date("  %H:%M")
			return nvim_version .. "    " .. date .. "    " .. time
		end

		--------------------------------------------------
		-- Layout tweaks (spacing, alignment)
		--------------------------------------------------
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Comment"

		dashboard.config.opts.noautocmd = true

		alpha.setup(dashboard.config)
	end,
}
