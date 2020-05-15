cnoreabbrev Co s/^/#/
cnoreabbrev Cop s/^/#/
cnoreabbrev Cor s/^/\/\//
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
map! <ESC>[1;5D <C-Left>
map! <ESC>[1;5C <C-Right>

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab

set spelllang=en
set pastetoggle=<F5>

hi Folded ctermbg=242
hi LineNr ctermfg=000
