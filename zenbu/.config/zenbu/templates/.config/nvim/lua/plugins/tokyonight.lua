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
					colors.bg = "{{ bgc }}"
					colors.bg_dark = "{{ n_black }}"
					colors.bg_float = "{{ n_black }}"
					colors.bg_float = "{{ n_black }}"
					colors.bg_popup = "{{ n_black }}"
					colors.bg_search = "{{ n_black }}"
					colors.bg_sidebar = "{{ n_black }}"
					colors.bg_statusline = "{{ n_black }}"
				end
			})
		vim.cmd.colorscheme "tokyonight-night"
	end
}
