return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			terminal_colors = true,
			on_colors = function(c)
				c.bg = "{{ bgc }}"
				c.bg_dark = "{{ n_black }}"
				c.bg_dark1 = "{{ n_black }}"
				c.bg_highlight = "{{ b_black }}"
				c.bg_popup = "{{ n_black }}"
				c.bg_statusline = "{{ n_black }}"
				c.bg_sidebar = "{{ n_black }}"
				c.bg_float = "{{ n_black }}"
				c.bg_visual = "{{ n_blue }}"
				c.bg_search = "{{ n_blue }}"

				c.fg = "{{ fgc }}"
				c.fg_dark = "{{ n_white }}"
				c.fg_gutter = "{{ b_black }}"
				c.fg_sidebar = "{{ fgc }}"
				c.fg_float = "{{ fgc }}"

				c.comment = "{{ csc }}"

				c.blue = "{{ b_blue }}"
				c.blue0 = "{{ n_blue }}"
				c.blue1 = "{{ b_cyan }}"
				c.blue2 = "{{ b_blue }}"
				c.blue5 = "{{ b_cyan }}"
				c.blue6 = "{{ b_white }}"
				c.blue7 = "{{ n_blue }}"
				c.cyan = "{{ b_cyan }}"
				c.green = "{{ b_green }}"
				c.green1 = "{{ n_green }}"
				c.green2 = "{{ n_cyan }}"
				c.magenta = "{{ b_magenta }}"
				c.magenta2 = "{{ b_red }}"
				c.purple = "{{ n_magenta }}"
				c.orange = "{{ b_yellow }}"
				c.red = "{{ b_red }}"
				c.red1 = "{{ n_red }}"
				c.teal = "{{ n_cyan }}"
				c.yellow = "{{ b_yellow }}"

				c.black = "{{ n_black }}"
				c.dark3 = "{{ b_black }}"
				c.dark5 = "{{ csc }}"
				c.terminal_black = "{{ b_black }}"

				c.hint = c.teal
				c.error = c.red
				c.warning = c.yellow
				c.info = c.blue
				c.todo = c.blue
				c.border = c.black
				c.border_highlight = c.blue

				c.diff = {
					add = c.green1,
					delete = c.red1,
					change = c.blue0,
					text = c.blue,
				}
				c.git = {
					add = c.green1,
					change = c.blue,
					delete = c.red1,
					ignore = c.dark3,
				}
				c.rainbow = {
					c.blue, c.yellow, c.green, c.teal,
					c.magenta, c.purple, c.orange, c.red,
				}
				c.terminal = {
					black = "{{ n_black }}",
					black_bright = "{{ b_black }}",
					red = "{{ n_red }}",
					red_bright = "{{ b_red }}",
					green = "{{ n_green }}",
					green_bright = "{{ b_green }}",
					yellow = "{{ n_yellow }}",
					yellow_bright = "{{ b_yellow }}",
					blue = "{{ n_blue }}",
					blue_bright = "{{ b_blue }}",
					magenta = "{{ n_magenta }}",
					magenta_bright = "{{ b_magenta }}",
					cyan = "{{ n_cyan }}",
					cyan_bright = "{{ b_cyan }}",
					white = "{{ n_white }}",
					white_bright = "{{ b_white }}",
				}
			end,
		})
		vim.cmd.colorscheme "tokyonight-night"
	end,
}
