return {
  'MeanderingProgrammer/markdown.nvim',
  enabled = false,
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  cmd = { "RenderMarkdown" },
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  config = function()
    -- require('nvim-web-devicons').setup()
    require('render-markdown').setup({})
    -- Autocommands til at aktivere/deaktivere pluginet baseret på mode
    vim.api.nvim_create_autocmd('InsertEnter', {
      callback = function()
        require('render-markdown').disable()
      end
    })

    vim.api.nvim_create_autocmd('InsertLeave', {
      callback = function()
        require('render-markdown').enable()
      end
    })
  end,
}
