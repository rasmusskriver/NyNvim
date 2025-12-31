require("config.remap")
require("config.lazy")

-- Først opretter du augroup 'ThePrimeagen'
local ThePrimeagenGroup = vim.api.nvim_create_augroup("ThePrimeagen", { clear = true })

-- Tilføj autokommandoen til at fjerne trailing whitespace på gem
vim.api.nvim_create_autocmd("BufWritePre", {
  group = ThePrimeagenGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})