" No backwards compatibility with Vi
set nocompatible


"
" Visuals
"

" Show line numbers
set number
set relativenumber

" Highlight a current line
set cursorline

" Show a vertical ruler
set colorcolumn=100

" Set a width of 1 tab to 4 spaces
set tabstop=4

" Make `<<`, `>>` and `==` use 4 spaces
set shiftwidth=4

" Round indent to a multiple of `shiftwidth`
set shiftround

" Replace tabs with spaces
set expandtab

" Delete 1 tab worth of spaces when at the beginning of a line
set smarttab

" Disable a line wrapping
set nowrap

" Highlight search results
set hlsearch

" Highlight search results incrementally
set incsearch

" Enable smart case-insensitive searching
set ignorecase
set smartcase

" Display certain types of whitespace characters
set list
set listchars=tab:>·,trail:~,precedes:<,extends:>

" Enable spell checking for specific file types
augroup spelling
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType tex setlocal spell
augroup end


"
" Behaviour
"

" Keep a minimum of 20 lines above or below the cursor
set scrolloff=20

" Scroll one character at a time horizontally
set sidescroll=1

" Keep a minimum of 10 columns next to the cursor
set sidescrolloff=10

" Display partially typed commands at the bottom of the screen
set showcmd

" Do not display the mode at the bottom of the screen
set noshowmode

" Place a new window under the current one when splitting horizontally
set splitbelow

" Enable an enhanced command-line completion
set wildmenu

" Bring backspace back to life
set backspace=indent,eol,start

" Switch buffers without having to save the current file
set hidden

" Enable persistent undo
set undofile

" Remember the last position in a buffer
augroup last_position
    autocmd!
    autocmd BufWinEnter *
        \ if line("'\"") > 0 && line("'\"") <= line('$') | execute 'normal! g`"zz' | endif
augroup end


"
" Miscellaneous
"

" Check if `.vim` directory exists and create it if missing
if ! isdirectory($HOME . '/.vim')
    call mkdir($HOME . '/.vim', '', 0700)
endif

" Move `.viminfo` to `~/.vim` directory
set viminfo+=n~/.vim/.viminfo

" Check if `.vim/.undo` directory exists and create it if missing
if ! isdirectory($HOME . '/.vim/.undo')
    call mkdir($HOME . '/.vim/.undo', '', 0700)
endif

" Store undo files in `~/.vim` directory
set undodir=~/.vim/.undo//

" Check if `.vim/.swap` directory exists and create it if missing
if ! isdirectory($HOME . '/.vim/.swap')
    call mkdir($HOME . '/.vim/.swap', '', 0700)
endif

" Store swap files in `~/.vim` directory
set directory=~/.vim/.swap//


"
" Key Bindings
"

" Set the leader and localleader key to space
noremap <space> <nop>
let mapleader = ' '
let maplocalleader = ' '

" Disable arrow keys altogether
for arrow_key in ['<up>', '<down>', '<left>', '<right>']
    execute 'noremap' arrow_key '<nop>'
    execute 'inoremap' arrow_key '<nop>'
endfor

" Quickly edit or source `~/.vimrc`
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" More convenient escape alternative
inoremap jk <esc>

" Conveniently switch between buffers
nnoremap <leader><tab> :bnext<cr>
nnoremap <leader><s-tab> :bprevious<cr>

" Easily [build and] execute code in the current buffer
augroup bindings
    autocmd!
    autocmd FileType c nnoremap <buffer> <localleader><cr>
        \ :update <bar> terminal ++shell ++rows=10 gcc %:p -o %:p:r && %:p:r<cr>
    autocmd FileType python nnoremap <buffer> <localleader><cr>
        \ :update <bar> terminal ++shell ++rows=10 python3 %:p<cr>
augroup end


"
" Plugins & Plugin Settings
"

" Install Vim-Plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --silent --fail --location --create-dirs --output ~/.vim/autoload/plug.vim
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Install any missing plugins on a startup
augroup plugins
    autocmd!
    autocmd VimEnter *
        \ if len(filter(values(g:plugs), '! isdirectory(v:val.dir)'))
            \| PlugInstall --sync | quit
        \| endif
augroup end

" Installed plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'lifepillar/vim-gruvbox8'
Plug 'tabnine/YouCompleteMe', {'do': './install.py'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

call plug#end()

colorscheme gruvbox8
set background=dark
set termguicolors

nnoremap <c-p> :FZF<cr>

let g:tex_flavor = 'latex'

let g:ycm_autoclose_preview_window_after_completion = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
