return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"angularls",
				"bashls",
				"csharp_ls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"tailwindcss",
				"ts_ls",
				"vimls",
				"wgsl_analyzer",
				"zls",
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({})
				end,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
			},
		})
	end,
}
