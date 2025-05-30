return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({})

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    -- vim.keymap.set("n", "<leader>sn", function()
    --   builtin.find_files({ cwd = vim.fn.stdpath("config") })
    -- end)
    -- vim.keymap.set("n", "<leader>ww", function()
    --   builtin.find_files({ cwd = "~/MyWiki" })
    -- end)
    -- Map <leader>sb to search for files in the Neovim data directory
    -- vim.keymap.set("n", "<leader>sb", function()
    --   require("telescope.builtin").find_files({ cwd = "C:\\Users\\rasmu\\AppData\\Local\\nvim-data" })
    -- end, { desc = "Search files in Neovim data directory" })
  end,
}
