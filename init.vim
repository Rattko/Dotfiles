" Show the line numbers
set number
set relativenumber

" Highlight the current line
set cursorline

" Show a vertical ruler
set colorcolumn=100

" Set the width of one tab to four spaces
set tabstop=4

" Make `<<`, `>>` and `==` use four spaces
set shiftwidth=4

" Round indent to a multiple of `shiftwidth`
set shiftround

" Replace tabs with spaces
set expandtab

" Disable a line wrapping
set nowrap

" Enable smart case-insensitive searching
set ignorecase
set smartcase

" Enable 24-bit colors
set termguicolors

" Display certain types of whitespace characters
set list
set listchars=tab:>·,trail:~,precedes:<,extends:>

" Keep a minimum of 20 lines above or below the cursor
set scrolloff=20

" Keep a minimum of 10 columns around the cursor
set sidescrolloff=10

" Place a new window under / to the right of the current one when splitting
set splitbelow
set splitright

" Do not display the command line at the bottom
set cmdheight=0

" Do not display the mode at the bottom of the screen
set noshowmode

" Enable a persistent undo
set undofile


" Set the leader and localleader key to space
let mapleader = ' '
let maplocalleader = ' '

" Quickly edit or source `init.vim`
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>vv :source $MYVIMRC<cr>

" Disable the arrow keys completely
for arrow_key in ['<up>', '<down>', '<left>', '<right>']
    execute 'noremap' arrow_key '<nop>'
    execute 'inoremap' arrow_key '<nop>'
endfor

" More convenient escape alternative
inoremap jk <esc>

" Always center the cursor when jumping with `c-u` and `c-d`
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz

" Switch between windows more easily
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
