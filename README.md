# ToDo

- test

- Linter mangler og blive sat op, der er et modul fra i kickstart, men vil måske lave mit eget.
  linting er information og regler der bliver highligted i forhold til hvis der nogle måde funktion skal navngives etc.

- comment.nvim "No jsx/tsx support. Its implementation was quite complicated."

- prøv den officielle copilot nvim. https://github.com/github/copilot.vim

# DONE

- lave en cloud gemt mappe der kan bruges til noter via leader ww, samt obsidian
  (Lavet en privat github REPO, der indeholder MyWiki)
- Der er en fejl i <leader>cd funktion i init.lua filen som gør den kun virker i nogle mapper
  (Bruger ikke denne funktion)
- Har fikset LSP ved at indsætte moduler fra kickstart nvim
  https://github.com/dam9000/kickstart-modular.nvim/tree/master/lua/kickstart/plugins

## Genveje

- ZZ - save and exit
- ZQ - Not save and exit

- leader fp - printer path ind i index.md som kan tilgås via leader ww

- leader gd - Go To Definition

- gc - toogle mellem kommentar

- leader sn - fuzzyfinde lua config filerne
- leader ww - fuzzyfinde note filer
- leader pf - fuzzy find working directory

--Hurtigere op og ned i et dokument

- ctrl + d
- ctrl + u

-- Haarpoon

- ctrl + t - Nummer 2
- ctrl + h - Nummer 1
- ctrl + n - Nummer 3
- ctrl + s - Nummer 4
- leader + a - gem filen
- ctrl + e - åben oversigt over filer

Undotree

- leader + u
- ctrl + w og bagefter hjkl for at vælge vindue

Makro

- q efterfulgt af et bogstav hvor den bliver gemt
- @ efterfulgt af bogstav for at afspille, evt et tal først for at gøre det flere gange

Funktioner

- gx åbner link man står på

### Nu skal der styr på det LSP show der

- Har fået lidt bedre overblik over LSP filen.
- Har fået installeret nogle lsp
- Men mangler stadig noget config
- Man kan åbenbart få den til at give html templates blandt andet via nvim-cmd tror jeg det var

### Indent

- Fatter ikke indenting i typescript, react, jsx

### Howdy cowboy

- Der var noget configureret i Takuya's nvim, der gjorde en OBS hvis man brugte meget j og k i stedet for faktisk at udnytte rigtige vim keys.
- Skal nok egentligt have trænet det lidt mere, synes ikke jeg udnytter vim keys ordentligt.
