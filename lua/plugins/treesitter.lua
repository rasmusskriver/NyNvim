return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()

		require'nvim-treesitter.configs'.setup {

			ensure_installed = {
				"vimdoc", "javascript", "typescript", "c", "lua", "rust",
				"jsdoc", "bash", "markdown", "markdown_inline",
			},
			auto_install = true,

			indent = {
				enable = true
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		}
	end
}
