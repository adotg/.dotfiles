set nocompatible             " be iMproved, required
set backspace=2              " allow backspace
filetype plugin indent on    " required

let mapleader = "\<Space>"  " space the leader

syntax on

" Sources .vimrc if founod in project folder
" by enabling project specific conf
set exrc

" Restricts usage of some command, 
" like cmd to execute shell script and all
set secure

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" Enable relative line no
set relativenumber


" Code folding setting
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

" Set line length and highlighting
set colorcolumn=120
highlight ColorColumn ctermbg = darkgray

" Enable clipboard sharing
set clipboard=unnamed

" Set line number
set number


" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

