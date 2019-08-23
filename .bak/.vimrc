set nocompatible             " be iMproved, required
set backspace=2              " allow backspace
filetype plugin indent on    " required

let mapleader = "\<Space>"  " space the leader

execute pathogen#infect()
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin for javascript
Plugin 'pangloss/vim-javascript'

" Auto complete
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" Enables some additional syntax highlighting for NGDocs
let g:javascript_plugin_ngdoc = 1


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


" Set tab chatracter
" nmap <leader>l :set list!<CR>
" set listchars=tab:▸\ ,eol:¬
let g:indentLine_enabled=1
let g:indentLine_color_term=8
let g:indentLine_char = '▸'

" Enable relative line no
set relativenumber

" Show a line in INSERT mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter,InsertLeave * set cul!

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


" Clipboard sharing feature map to key
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F3> :.w !pbcopy<CR><CR>
vmap <F3> :w !pbcopy<CR><CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Set air line
set laststatus=2

" Set the truncation limit of the airline section of git part
let g:airline#extensions#default#section_truncate_width = { 'a': 10 }
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
" enable modified detection
let g:airline_detect_modified=1
" enable paste detection
let g:airline_detect_paste=1
" determine whether inactive windows should have the left section collapsed to only the filename of that buffer.
let g:airline_inactive_collapse=1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Go to last open buffer
function SwitchBuffer()
  b#
endfunction

nmap <Tab> :call SwitchBuffer()<CR>

" CtrlP Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git)|\_site|node_modules)$',
  \ 'file': '\v\.(swp|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" ycm for typescript
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Set colorscheme
colorscheme sierra

" Tmux line configuration
let g:tmuxline_preset = 'tmux'

" Map to fast typed jj to send escape chars
:imap jj <Esc>

" Change cursor shape when id insert / normal mode
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" If a local file exists source it
if !empty(glob("~/.vimrc_local"))
    so ~/.vimrc_local
endif
