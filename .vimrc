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
set clipboard=unnamedplus

hi Folded ctermbg=242
hi LineNr ctermfg=000

map gA zA
map gC zc
map gD zD
map gE zE
map gF zF
map gG zG
map gH zH
map gL zL
map gM zm
map gN zN
map gO zo
map gR zr
map gW zW
map gX zX
map g^ z^
map ga za
map gb zb
map gc zC
map gd zd
map ge ze
map gf zf
map gg zg
map gh zh
map gi zi
map gj zj
map gk zk
map gl zl
map gm zM
map gn zn
map go zO
map gr zR
map gs zs
map gt zt
map gv zv
map gw zw
map gx zx
map gz zz

autocmd FileType rust setlocal foldmethod=indent
" autocmd FileType rust setlocal foldmethod=indent

" from https://github.com/narodnik/rust-fold-functions.vim

" function! MakeRustFuncDefs()
"     let b:RustFuncDefs = []
" 
"     let lnum = 1
"     while lnum <= line('$')
"         let current_line = getline(lnum)
"         if match(current_line, '^ *\(pub \)\?fn') > -1
"             call AddRustFunc(lnum)
"         endif
" 
"         let lnum += 1
"     endwhile
" endfunction
" 
" function! AddRustFunc(lnum)
"     let save_pos = getpos('.')
"     call setpos('.', [0, a:lnum, 1, 0])
" 
"     call search('{')
"     let start_lnum = line('.')
" 
"     let end_lnum = searchpair('{', '', '}', 'n')
"     if end_lnum < 1
"         call setpos('.', save_pos)
"         return
"     endif
" 
"     call add(b:RustFuncDefs, [start_lnum, end_lnum]);
"     call setpos('.', save_pos)
" endfunction
" 
" function! RustFold()
"     if !exists("b:RustFuncDefs")
"         call MakeRustFuncDefs()
"     endif
" 
"     for [start_lnum, end_lnum] in b:RustFuncDefs
"         if start_lnum > v:lnum
"             return 0
"         endif
" 
"         if v:lnum == start_lnum + 1
"             return ">1"
"         elseif v:lnum == end_lnum
"             return "<1"
"         elseif v:lnum > start_lnum && v:lnum < end_lnum
"             return "="
"         endif
"     endfor
" endfunction
" 
" autocmd FileType rust setlocal foldmethod=expr foldexpr=RustFold()
