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


"
" Behaviour
"

" Bring backspace back to life
set backspace=indent,eol,start

" Enable persistent undo
set undofile

" Remember the last position in a file
autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif


"
" Miscellaneous
"

" Move `.viminfo` to `~/.vim` directory
set viminfo+=n~/.vim/.viminfo

" Store undo files in `~/.vim` directory
set undodir=~/.vim/.undo//

" Store swap files in `~/.vim` directory
set directory=~/.vim/.swap//


"
" Key Bindings
"

" Set the leader key to space
nnoremap <space> <nop>
let mapleader = " "

" Conveniently switch between buffers
nnoremap <leader><tab> :bnext<cr>
nnoremap <leader><s-tab> :bprevious<cr>

" Quickly edit or source `~/.vimrc`
nnoremap gev :edit $MYVIMRC<cr>
nnoremap gsv :source $MYVIMRC<cr>


"
" Plugins & Plugin Settings
"

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}

call plug#end()

colorscheme gruvbox
set background=dark
set termguicolors

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
