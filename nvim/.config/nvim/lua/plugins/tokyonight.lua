return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup(
			{
				on_colors = function(colors)
					colors.hint = colors.orange
					colors.bg = "#111E26"
					colors.bg_dark = "#16242D"
					colors.bg_float = "#16242D"
					colors.bg_float = "#16242D"
					colors.bg_popup = "#16242D"
					colors.bg_search = "#16242D"
					colors.bg_sidebar = "#16242D"
					colors.bg_statusline = "#16242D"
				end
			})
		vim.cmd.colorscheme "tokyonight-night"
	end
}
