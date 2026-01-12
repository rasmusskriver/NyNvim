return {
  {
    "folke/snacks.nvim",
    enabled = false,
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      terminal = {
        enabled = true,
        interactive = false,
        win = {
          style = "terminal",
          position = "float",
          enter = true,
        },
      },
      lazygit = {
        configure = true,
        interactive = true,
      },
    },
    keys = {
      {
        "<leader>r",
        function()
          Snacks.terminal("./main.sh")
        end,
      },
      {
        "<leader>lg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },
}
