" ---------- general options ----
set nocompatible              " required
filetype off                  " required
set incsearch
set mouse=a
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number relativenumber
set ignorecase
set smartcase
set backspace=indent,eol,start
set confirm
set visualbell
set t_vb=
set encoding=utf-8

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" ----------- vundle -------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'irrationalistic/vim-tasks'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'ntk148v/vim-horizon'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Colorizer'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required

" -------lightline configuration --------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

filetype plugin indent on    " required
set splitbelow
set splitright

" ----------- split navigations -----
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

let python_highlight_all=1
syntax on
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme horizon
endif
call togglebg#map("<F5>")
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
", {'rtp': 'powerline/bindings/vim/'}
"set clipboard=unnamed

" --------- mappings -----------
nnoremap <F6> :w <ENTER>:!python %:p <ENTER>
map <Esc><Esc> :w <CR>
map <F2> :NERDTree <cr>

" ------------ view reload -----
if (@% != "")
    au BufWinLeave * mkview
    au BufWinEnter * silent loadview
endif

" ------- typos --------
cab W  w
cab qw wq
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q
cab Qa qa
cab QA qa

" -------- just because --------
nmap ; :
