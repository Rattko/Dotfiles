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
" Key Bindings
"

" Quickly edit or source `.vimrc`
nnoremap gev :edit $MYVIMRC<CR>
nnoremap gsv :source $MYVIMRC<CR>

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
