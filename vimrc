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

"
" Miscellaneous
"

" Move `.viminfo` to `.vim` directory
set viminfo+=n~/.vim/.viminfo

" Bring backspace back to life
set backspace=indent,eol,start

"
" Key Bindings
"

" Set the leader key to space
nnoremap <space> <nop>
let mapleader = " "

" Conveniently switch between buffers
nnoremap <leader><tab> :bnext<cr>
nnoremap <leader><s-tab> :bprevious<cr>

" Quickly edit or source `.vimrc`
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
