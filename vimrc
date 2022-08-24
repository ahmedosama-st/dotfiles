" Plugins instalation
call plug#begin('~/.vim/plugged')
Plug 'haishanh/night-owl.vim'
call plug#end()

" UI&UX Settings
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set rnu
set nowrap
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80

syntax on
colorscheme night-owl

" Custom remaps for navigation
let mapleader = " "
inoremap jk <Esc>
nnoremap s _
nnoremap e $

"nnoremap <leader>s :w<cr> && !source %<cr>
nnoremap ,. :!php %<cr>
nnoremap ,l :!node %<cr>
nnoremap ,; :!ts-node %<cr>
nnoremap ,, :!rustc %; ./main<cr>

