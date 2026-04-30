return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		buftypes = {},
		user_commands = true,
		lazy_load = false,
		options = {
			parsers = {
				css = true,
				css_fn = true,
				names = {
					enable = false,
					lowercase = true,
					camelcase = true,
					uppercase = false,
					strip_digits = false,
					custom = false,
				},
				hex = {
					default = true,
					rgb = true,
					rgba = true,
					rrggbb = true,
					rrggbbaa = true,
					aarrggbb = true,
				},
				rgb = { enable = true },
				hsl = { enable = false },
				oklch = { enable = false },
				tailwind = {
					enable = false,
					lsp = false,
					update_names = false,
				},
				sass = {
					enable = false,
					parsers = { css = true },
					variable_pattern = "^%$([%w_-]+)",
				},
				xterm = { enable = false },
				custom = {},
			},
			display = {
				mode = "background",
				background = {
					bright_fg = "#000000",
					dark_fg = "#ffffff",
				},
				virtualtext = {
					char = "■",
					position = "eol",
					hl_mode = "foreground",
				},
				priority = {
					default = 150,
					lsp = 200,
				},
			},
			hooks = {
				should_highlight_line = false,
			},
			always_update = false,
		},
	},
}
