function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
  nnoremap <F7> :w <ENTER>:!./build.sh& <ENTER>
  map <Esc><Esc> :w<CR>
  cab W  w
  cab qw wq
  cab Wq wq
  cab wQ wq
  cab WQ wq
  cab Q  q
  cab Qa qa
  cab QA qa

  nmap ; :

endfunction

