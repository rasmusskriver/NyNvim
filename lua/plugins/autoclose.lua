return {
  "m4xshen/autoclose.nvim",
  enabled = false,
  config = function()
    require("autoclose").setup({
      options = {
        disabled_filetypes = { "text", "markdown" },
      },
    })
  end,
}
