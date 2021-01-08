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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" set relative line numbers
set number relativenumber

" set persistent undo
set undodir=~/.vim/undodir

syntax on
" add highlight for function names in cpp
" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'altercation/vim-colors-solarized'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'irrationalistic/vim-tasks'
Plugin 'mhartington/oceanic-next'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'ntk148v/vim-horizon'
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
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'wmvanvliet/jupyter-vim'

call vundle#end()            " required

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix. Glaive codefmt plugin[mappings]

"lightline configuratio
"set laststatus=2
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'fugitive#head'
      "\ },
      "\ }

filetype plugin indent on    " required
set splitbelow
set splitright


" vimfiler open files in tab
autocmd FileType vimfiler nnoremap <silent><buffer><expr> S vimfiler#do_action('tabopen')

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
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"
set encoding=utf-8

let python_highlight_all=1
set termguicolors
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight


call togglebg#map("<F5>")
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
", {'rtp': 'powerline/bindings/vim/'}
set clipboard=unnamed

"" match pairs
"inoremap (; ();<C-c>O
"inoremap (, (),<C-c>O
"inoremap {; {};<C-c>O
"inoremap {, {},<C-c>O
"inoremap [; [];<C-c>O
"inoremap [, [],<C-c>O

"Python run script
nnoremap <F6> :w <ENTER>:!python3 %:p <ENTER>
nnoremap <F7> :w <ENTER>:!./build.sh& <ENTER>
map <Esc><Esc> :w<CR>
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

cab w :FormatCode <ENTER>:w <ENTER>

map <F2> :NERDTree <cr>
au BufWinLeave * mkview
au BufWinEnter * silent loadview

"autostart NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd BufWinEnter * NERDTree

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile


