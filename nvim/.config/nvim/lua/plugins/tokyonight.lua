return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			terminal_colors = true,
			on_colors = function(c)
				c.bg = "#111E26"
				c.bg_dark = "#16242D"
				c.bg_dark1 = "#16242D"
				c.bg_highlight = "#273B47"
				c.bg_popup = "#16242D"
				c.bg_statusline = "#16242D"
				c.bg_sidebar = "#16242D"
				c.bg_float = "#16242D"
				c.bg_visual = "#33556A"
				c.bg_search = "#33556A"

				c.fg = "#92A0A7"
				c.fg_dark = "#C6C6BA"
				c.fg_gutter = "#273B47"
				c.fg_sidebar = "#92A0A7"
				c.fg_float = "#92A0A7"

				c.comment = "#66767F"

				c.blue = "#467086"
				c.blue0 = "#33556A"
				c.blue1 = "#6E9EA5"
				c.blue2 = "#467086"
				c.blue5 = "#6E9EA5"
				c.blue6 = "#DCDDCF"
				c.blue7 = "#33556A"
				c.cyan = "#6E9EA5"
				c.green = "#638F67"
				c.green1 = "#4A724E"
				c.green2 = "#3B6B71"
				c.magenta = "#4A4683"
				c.magenta2 = "#804749"
				c.purple = "#3D3B6D"
				c.orange = "#7B5D56"
				c.red = "#804749"
				c.red1 = "#653436"
				c.teal = "#3B6B71"
				c.yellow = "#7B5D56"

				c.black = "#16242D"
				c.dark3 = "#273B47"
				c.dark5 = "#66767F"
				c.terminal_black = "#273B47"

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
					black = "#16242D",
					black_bright = "#273B47",
					red = "#653436",
					red_bright = "#804749",
					green = "#4A724E",
					green_bright = "#638F67",
					yellow = "#654D47",
					yellow_bright = "#7B5D56",
					blue = "#33556A",
					blue_bright = "#467086",
					magenta = "#3D3B6D",
					magenta_bright = "#4A4683",
					cyan = "#3B6B71",
					cyan_bright = "#6E9EA5",
					white = "#C6C6BA",
					white_bright = "#DCDDCF",
				}
			end,
		})
		vim.cmd.colorscheme "tokyonight-night"
	end,
}
