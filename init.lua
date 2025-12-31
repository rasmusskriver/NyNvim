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
-- vim.api.nvim_create_autocmd("BufLeave", {
--   callback = function()
--     local clip = vim.fn.getreg("+")
--     local bufname = vim.api.nvim_buf_get_name(0)
--     local filetype = vim.api.nvim_buf_get_option(0, "filetype")
--     local modified = vim.api.nvim_buf_get_option(0, "modified")
--     local bufnr = vim.api.nvim_get_current_buf()
--     local winid = vim.api.nvim_get_current_win()
--     local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {line, col}
--     local time = os.date("%Y-%m-%d %H:%M:%S")
--
--     local f, err = io.open("/tmp/clipboard-log.txt", "a")
--     if not f then
--       print("Kunne ikke åbne logfil: " .. err)
--       return
--     end
--
--     local log_entry = string.format(
--       "[%s] BufLeave\nBufnr: %d\nWinID: %d\nBuffer name: %s\nFiletype: %s\nModified: %s\nCursor: line %d, col %d\nClipboard: %s\n\n",
--       time,
--       bufnr,
--       winid,
--       bufname,
--       filetype,
--       tostring(modified),
--       cursor_pos[1],
--       cursor_pos[2],
--       clip
--     )
--
--     f:write(log_entry)
--     f:close()
--   end,
-- })

-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.notify("YANK DETECTED\n" .. debug.traceback(), vim.log.levels.ERROR)
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     local time = os.date("%Y-%m-%d %H:%M:%S")
--     local bufname = vim.api.nvim_buf_get_name(0)
--     local filetype = vim.bo.filetype
--     local reg = vim.v.event.regname or "?"
--
--     local f = io.open("/tmp/clipboard-log.txt", "a")
--     if not f then
--       return
--     end
--
--     f:write(
--       string.format(
--         "\n[%s] TextYankPost\nBuffer: %s\nFiletype: %s\nRegister: %s\nStacktrace:\n%s\n",
--         time,
--         bufname,
--         filetype,
--         reg,
--         debug.traceback()
--       )
--     )
--
--     f:close()
--   end,
-- })

-- do
--   local orig_setreg = vim.fn.setreg
--   vim.fn.setreg = function(...)
--     local args = { ... }
--     local reg = args[1]
--     local value = args[2]
--
--     if reg == "+" or reg == "*" or reg == nil then
--       vim.notify(
--         "setreg CALLED\nRegister: "
--           .. tostring(reg)
--           .. "\nValue preview:\n"
--           .. tostring(value)
--           .. "\n\nStacktrace:\n"
--           .. debug.traceback(),
--         vim.log.levels.ERROR
--       )
--     end
--
--     return orig_setreg(...)
--   end
-- end
