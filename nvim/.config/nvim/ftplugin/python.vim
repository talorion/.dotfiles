" <F9> to execute the current buffer with python
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pytest' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pytest' shellescape(@%, 1)<CR>

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3 -m unittest discover -s tst'<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3 -m unittest discover -s tst'<CR>

" Configure enabled formatters.
let g:neoformat_enabled_python = ['black']

" run a formatter on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
