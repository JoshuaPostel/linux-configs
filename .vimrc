set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:ycm_auto_hover=''
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger = 0
cnoreabbrev Aco let g:ycm_auto_trigger = 1
map G  :YcmCompleter GoToDefinitionElseDeclaration<CR>
highlight clear SignColumn

let g:ycm_enable_diagnostic_highlighting = 0


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
autocmd FileType scala setlocal shiftwidth=2 softtabstop=2 expandtab

set nu
set spelllang=en
set pastetoggle=<F5>
set clipboard=unnamedplus

set foldlevel=4
set nofoldenable
set foldmethod=syntax

hi Folded ctermbg=242
hi LineNr ctermfg=000

map fc zc
map fC zC
map fo zo
map fO zO

autocmd FileType yaml setlocal foldmethod=indent
autocmd FileType yaml setlocal sw=2
