require("config.remap")
require("config.lazy")

-- Eksperiment
-- Funktion til at indsætte filsti
function InsertFilePath()
    local filepath = vim.fn.expand('%:p') -- Henter den fulde sti til den aktuelle fil
    vim.api.nvim_put({filepath}, 'c', true, true) -- Indsætter stien i dokumentet
end

-- Tilknytning af funktionen til en tastaturgenvej
vim.api.nvim_set_keymap('n', '<leader>fp', ':lua InsertFilePath()<CR>', { noremap = true, silent = true })
	
	
