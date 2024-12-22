return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end)
    vim.keymap.set('n', '<leader>ww', function()
      builtin.find_files { cwd = '~/MyWiki' }
    end)
    -- Map <leader>sb to search for files in the Neovim data directory
    vim.keymap.set('n', '<leader>sb', function()
      require('telescope.builtin').find_files { cwd = 'C:\\Users\\rasmu\\AppData\\Local\\nvim-data' }
    end, { desc = "Search files in Neovim data directory" })
  end
}
