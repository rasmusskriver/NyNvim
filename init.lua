require("config.remap")
require("config.lazy")

-- Eksperiment
-- Funktion til at indsætte stien til den aktuelle fil ind i index.md-filen
function InsertCurrentFilePathToIndexMd()
  -- Gemmer den fulde sti til den aktuelle fil
  local current_file_path = vim.fn.expand("%:p")
  -- Gemmer den fulde sti til index.md-filen
  local index_md_path = "~/MyWiki/index.md"

  -- Tjekker om index.md-filen kan åbnes
  local ok, err = pcall(function()
    -- Åbner index.md-filen
    vim.cmd("edit " .. index_md_path)
    -- Går til slutningen af filen
    vim.cmd("normal G")
    -- laver ny linje
    vim.cmd("normal o")
    -- Indsætter en ny linje og filstien
    vim.api.nvim_put({ current_file_path }, "c", true, true)
    -- Gemmer ændringerne
    vim.cmd("write")
  end)

  -- Hvis der opstår en fejl ved åbning af index.md-filen
  if not ok then
    print("Fejl ved åbning af index.md: " .. err)
  end

  -- Går tilbage til den oprindelige fil
  vim.cmd("edit " .. current_file_path)
end

-- builtin.find_files { cwd = '~/mywiki' }
-- Tilknytning af funktionen til en tastaturgenvej
vim.api.nvim_set_keymap(
  "n",
  "<leader>fp",
  ":lua InsertCurrentFilePathToIndexMd()<CR>",
  { noremap = true, silent = true }
)

-- Funktion til at åbne filen eller mappen under markøren
function OpenFileOrDirUnderCursor()
  -- Få teksten under markøren
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local line = vim.fn.getline(cursor_pos[1])
  local col = cursor_pos[2] + 1
  local path = nil

  -- Find start og slut positionen af stien under markøren
  local start_pos, end_pos = line:find("%S+")
  while start_pos do
    if col >= start_pos and col <= end_pos then
      path = line:sub(start_pos, end_pos)
      break
    end
    start_pos, end_pos = line:find("%S+", end_pos + 1)
  end

  if path then
    -- Tjek om stien er en fil eller mappe
    if vim.fn.isdirectory(path) == 1 then
      -- Åbn mappen
      vim.cmd("edit " .. path)
    elseif vim.fn.filereadable(path) == 1 then
      -- Åbn filen
      vim.cmd("edit " .. path)
    else
      print("Filen eller mappen findes ikke: " .. path)
    end
  else
    print("Ingen sti fundet under markøren")
  end
end

-- Tilknytning af funktionen til en tastaturgenvej
vim.api.nvim_set_keymap("n", "<leader>gf", ":lua OpenFileOrDirUnderCursor()<CR>", { noremap = true, silent = true })

-- Funktion til at ændre arbejdsbibliotek til mappen for den aktuelle fil eller mappen
function CdIntoCurrentPath()
  -- Få den fulde sti til den aktuelle fil eller mappe
  local path = vim.fn.expand("%:p")

  -- Tjek om den aktuelle sti er en mappe
  if vim.fn.isdirectory(path) == 1 then
    -- Skift arbejdsbibliotek til den aktuelle mappe
    vim.cmd("cd " .. path)
    print("Skiftede arbejdsbibliotek til: " .. path)
  else
    -- Få mappen for den aktuelle fil
    local dir_path = vim.fn.fnamemodify(path, ":h")
    if vim.fn.isdirectory(dir_path) == 1 then
      -- Skift arbejdsbibliotek til mappen for den aktuelle fil
      vim.cmd("cd " .. dir_path)
      print("Skiftede arbejdsbibliotek til: " .. dir_path)
    else
      print("Kunne ikke finde mappen for den aktuelle fil: " .. dir_path)
    end
  end
end

-- Tilknytning af funktionen til en tastaturgenvej
vim.api.nvim_set_keymap("n", "<leader>cd", ":lua CdIntoCurrentPath()<CR>", { noremap = true, silent = true })

-- Først opretter du augroup 'ThePrimeagen'
local ThePrimeagenGroup = vim.api.nvim_create_augroup("ThePrimeagen", { clear = true })

-- Tilføj autokommandoen til at fjerne trailing whitespace på gem
vim.api.nvim_create_autocmd("BufWritePre", {
  group = ThePrimeagenGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
