" https://dev.to/creativenull/installing-neovim-nightly-alongside-stable-10d0

set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/.config/nvim-nightly/after
set runtimepath^=~/.config/nvim-nightly
set runtimepath+=~/.local/share/nvim-nightly/site/after
set runtimepath^=~/.local/share/nvim-nightly/site

set packpath-=~/.config/nvim
set packpath-=~/.config/nvim/after
set packpath-=~/.local/share/nvim/site
set packpath-=~/.local/share/nvim/site/after

set packpath^=~/.config/nvim-nightly
set packpath+=~/.config/nvim-nightly/after
set packpath^=~/.local/share/nvim-nightly/site
set packpath+=~/.local/share/nvim-nightly/site/after


" ========================================================
" Config starts here
" ========================================================

set encoding=UTF-8
set shell=bash\ --login
set autoread " detect when a file is changed
set nocompatible
set history=1000 " change history to 1000
set textwidth=120
set relativenumber
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set formatoptions=cro " automatically put comment tag
set cursorline
set inccommand=nosplit
set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex
set noerrorbells " error bells
set visualbell
set t_vb=
set t_ut=
set tm=500
set number " show line numbers
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2 " show the status line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set shell=$SHELL
set cmdheight=1 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
set signcolumn=yes
set shortmess+=c
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set expandtab
set foldmethod=indent " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
set list
set termguicolors
set listchars=tab:│\ 
" switch cursor to line when in insert mode, and block when not
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
" \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
" \,sm:block-blinkwait175-blinkoff150-blinkon175

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver102-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

if has('mouse')
    set mouse=a
endif

let $BAT_THEME='OneHalfLight'


call plug#begin('~/.config/nvim-nightly/plugged')
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'folke/tokyonight.nvim'
" Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'wincent/ferret'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go', { 'for': 'go' }
call plug#end()

let g:go_term_mode = "split"
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-b:preview-up,ctrl-f:preview-down,
\ctrl-y:preview-page-up,ctrl-e:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"

lua require('treesitter/init')
lua require'bufferline'.setup{}
lua require('lualine').setup{
\    options = {
\        theme  = 'tokyonight',
\        section_separators = {'', '' },
\       component_separators = {'', '' },
\    },
\    sections = {
\       lualine_a = {'mode'},
\       lualine_b = {'branch'},
\       lualine_c = {'filename'},
\       lualine_x = {{ 'diagnostics', sources = {'coc'}, symbols = {error = ' ', warn = ' ', info= ' '}, color_error = '#ec5f67', color_warn = '#ECBE7B', color_info = '#008080' }, 'fileformat', 'filetype'},
\       lualine_y = {'progress'},
\       lualine_z = {'location'}
\ },
\ }

inoremap jj <esc>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
vnoremap . :normal .<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <silent> <C-W>H <Plug>WinMoveLeft
map <silent> <C-W>J <Plug>WinMoveDown
map <silent> <C-W>K <Plug>WinMoveUp
map <silent> <C-W>L <Plug>WinMoveRight
" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv
" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
nnoremap <silent>gt :BufferLineCycleNext<CR>
nnoremap <silent>gT :BufferLineCyclePrev<CR>

vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>
" coc-git nav
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap gk <Plug>(coc-git-chunkinfo)
"remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-doHover)
" diagnostics navigation
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" map <leader>w <Plug>Sneak_s
" map <leader>b <Plug>Sneak_S

let mapleader = "\<Space>"
noremap <leader>c :set hlsearch! hlsearch?<cr>
nmap <leader>, :%s/\s\+$<cr>
nmap <leader>,, :%s/\n\{2,}/\r\r/g<cr>
nmap <leader>. <c-^>
nnoremap <leader>i :set cursorline!<cr>
nmap <silent> <leader>gs :Git<cr>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>o :Buffers<CR>
nmap <silent> <leader>p :GitFiles --cached --others --exclude-standard<cr>
nmap <leader>; :CocDiagnostics<cr>
nnoremap <silent> <leader><leader> :WhichKey '<Space>'<CR>
nmap <leader>` <Plug>(FerretLack)
" lsp related
nmap <silent> <leader>la <Plug>(coc-codeaction)
nmap <silent> <leader>lr <Plug>(coc-rename)
nmap <silent> <leader>lf <Plug>(coc-format)
nmap <silent> <leader>lx <Plug>(coc-fix-current)
nmap <silent> <leader>lc <Plug>(coc-codelens-action)
nmap <silent> <leader>ld :CocList diagnostics<cr>
nmap <silent> <leader>ll :CocList outline<cr>
nmap <silent> <leader>ls :CocList -I symbols<cr>

let g:tokyonight_style = "day"
" let g:tokyonight_style = "storm"
colorscheme tokyonight

" CocExplorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
:nmap <leader>n :CocCommand explorer<CR>
:nmap <leader>y :CocCommand explorer --preset floating<CR>


function! StartUp()
    if 0 == argc()
        :CocCommand explorer
    end
endfunction
autocmd VimEnter * call StartUp()

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Using floating windows of Neovim to start fzf
if has('nvim')
  function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction
  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
endif
