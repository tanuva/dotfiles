set number
set colorcolumn=80,120
set cursorline
set shiftwidth=4
set softtabstop=4

let mapleader=","

syntax enable

filetype plugin on
au BufNewFile,BufRead * if &ft == '' | set ft=txt | endif
