set number
set colorcolumn=80,120
set cursorline
set shiftwidth=4
set softtabstop=4

" move line up/down
nnoremap <M-S-Up> :m-2<CR>
nnoremap <M-S-Down> :m+<CR>

"nnoremap <S-Up> :m-2<CR>
"nnoremap <S-Down> :m+<CR>

syntax enable

filetype plugin on
au BufNewFile,BufRead * if &ft == '' | set ft=txt | endif
