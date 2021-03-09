set nocompatible              " required
filetype off                  " required

set incsearch
set mouse=a
set linebreak
set spelllang=en

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" set relative line numbers
set number relativenumber

" set persistent undo
set undodir=~/.vim/undodir

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

syntax on

Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Colorizer'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'tmsvg/pear-tree'
Plugin 'google/vim-glaive'
Plugin 'vim-scripts/LargeFile'
Plugin 'ernstwi/vim-secret'

call vundle#end()            " required

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix. Glaive codefmt plugin[mappings]

filetype plugin indent on    " required
set splitbelow
set splitright


" vimfiler open files in tab
autocmd FileType vimfiler nnoremap <silent><buffer><expr> S vimfiler#do_action('tabopen')

"" Syntastic options
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2
set encoding=utf-8

let python_highlight_all=1
set termguicolors
colorscheme OceanicNext


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set clipboard=unnamedplus

" save file when hit ESC twice, will also format file if formatter is
" installed
map <Esc><Esc> w :FormatCode <ENTER>:w <CR>
nnoremap <F6> :w <ENTER>:!time python3 %:p 2>&1 \| tee /tmp/python_exec <ENTER>
cab W  w
cab qw wq
cab Wq wq
cab Wqa wqa
cab wQ wq
cab WQ wq
cab Q  q
cab Qa qa
cab QA qa

nmap ; :

" maintain visual selection after indenting
:vnoremap < <gv
:vnoremap > >gv

" Toggle secret view
nmap <Leader>s <Plug>SecretToggle

map <F2> :NERDTree <cr>
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"autostart NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufWinEnter * NERDTree

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

