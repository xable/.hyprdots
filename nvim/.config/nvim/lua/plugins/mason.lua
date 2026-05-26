return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
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

		local function on_attach(client, bufnr)
			local bufopts = { buffer = bufnr }
			local map = function(mode, lhs, rhs, opts)
				vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { noremap = true, silent = true }, opts or {}))
			end
			map("n", "gd", vim.lsp.buf.definition, bufopts)
			map("n", "gD", vim.lsp.buf.declaration, bufopts)
			map("n", "gi", vim.lsp.buf.implementation, bufopts)
			map("n", "gr", vim.lsp.buf.references, bufopts)
			map("n", "K", vim.lsp.buf.hover, bufopts)
			map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			map({ "n", "x" }, "<leader>lf", vim.lsp.buf.format, bufopts)
			map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
			map("n", "gl", vim.diagnostic.open_float, bufopts)
			map("n", "[d", vim.diagnostic.goto_prev, bufopts)
			map("n", "]d", vim.diagnostic.goto_next, bufopts)

			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
			vim.wo.foldlevel = 99
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

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

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		for server, opts in pairs(servers) do
			local ok, lspconfig_cfg = pcall(require, "lspconfig.configs." .. server)
			local defaults = ok and lspconfig_cfg.default_config or {}
			vim.lsp.config(
				server,
				vim.tbl_deep_extend("force", {
					cmd = defaults.cmd,
					filetypes = defaults.filetypes,
					capabilities = capabilities,
					on_attach = on_attach,
				}, opts)
			)
			vim.lsp.enable(server)
		end

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
				"hyprls",

				"stylua",
				"black",
				"isort",
				"pylint",
				"shellcheck",
				"shfmt",
			},
		})
	end,
}
