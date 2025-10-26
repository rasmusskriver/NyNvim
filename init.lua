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

-- Dette er en teste hvor jeg kopiere inde i nvim og forlader nvim
-- Er lige ved at finde ud af hvorfor den overskriver mit clipboard ved hvad der ligner buffer skift
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    local clip = vim.fn.getreg("+")
    local bufname = vim.api.nvim_buf_get_name(0)
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    local modified = vim.api.nvim_buf_get_option(0, "modified")
    local bufnr = vim.api.nvim_get_current_buf()
    local winid = vim.api.nvim_get_current_win()
    local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {line, col}
    local time = os.date("%Y-%m-%d %H:%M:%S")

    local f, err = io.open("/tmp/clipboard-log.txt", "a")
    if not f then
      print("Kunne ikke åbne logfil: " .. err)
      return
    end

    local log_entry = string.format(
      "[%s] BufLeave\nBufnr: %d\nWinID: %d\nBuffer name: %s\nFiletype: %s\nModified: %s\nCursor: line %d, col %d\nClipboard: %s\n\n",
      time,
      bufnr,
      winid,
      bufname,
      filetype,
      tostring(modified),
      cursor_pos[1],
      cursor_pos[2],
      clip
    )

    f:write(log_entry)
    f:close()
  end,
})
