return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- import mason
		local mason = require("mason")


		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
			},
		})
	end,
}
