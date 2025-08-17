return {
	"williamboman/mason.nvim",
	dependencies = {
		"folke/neodev.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		-- Enable mason
		require("neodev").setup({})
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local function on_attach(client, buffer)
			require("plugins.lspconfig.keymaps").setup(client, buffer)
			require("plugins.lspconfig.formatting").setup(client, buffer)

			-- Set folding options for treesitter
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
			vim.wo.foldlevel = 99
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

		-- Define the list of LSP servers and their settings
		local servers = {
			ts_ls = {},
			lua_ls = {},
			rust_analyzer = {},
			html = {},
			cssls = {},
			basedpyright = {},
			bashls = {},
			css_variables = {},
			cssmodules_ls = {},
			jsonls = {},
			lemminx = {},
			yamlls = {},
		}

		-- Configure mason-lspconfig to install the servers
		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		-- Setup each LSP server
		for server, _ in pairs(servers) do
			require("lspconfig")[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server], -- If you have specific settings for each server
			})
		end

		-- Install formatters and linters
		require("mason-tool-installer").setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"rust_analyzer",
				"html",
				"cssls",
				"basedpyright",
				"bashls",
				"css_variables",
				"cssmodules_ls",
				"emmet_ls",
				"jsonls",
				"lemminx",
				"yamlls",

				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import organizer
				"pylint", -- Python linter
				"shellcheck", -- Shell script linter
				"shfmt", -- Shell script formatter
			},
		})
	end,
}
