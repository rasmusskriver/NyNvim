return {
  "github/copilot.vim",
  enabled = false,
  lazy = false,
  config = function()
    vim.g.copilot_filetypes = {
      markdown = false,
    }
  end,
}
