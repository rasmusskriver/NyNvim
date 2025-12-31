return {

  { -- Linting
    "mfussenegger/nvim-lint",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        -- markdown = { "markdownlint" },
        -- markdown = { "vale" },
        -- javascript = { "eslint_d" }, -- Tilføj ESLint for JavaScript
        javascriptreact = { "eslint_d" }, -- Hvis du bruger React
        typescript = { "eslint_d" }, -- Hvis du bruger TypeScript
        typescriptreact = { "eslint_d" }, -- Hvis du bruger TypeScript med React
        -- python = { "pylint" },
        -- python = { "flake8" },
        -- python = { "eslint_d" },
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
