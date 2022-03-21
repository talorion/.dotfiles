" <F9> to execute the current buffer with python
nnoremap <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
inoremap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pytest' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pytest' shellescape(@%, 1)<CR>

nnoremap <buffer> <F9> :w<CR>:exec '!python3 -m unittest discover -s tst'<CR>
inoremap <buffer> <F9> <esc>:w<CR>:exec '!python3 -m unittest discover -s tst'<CR>

" Configure enabled formatters.
let g:neoformat_enabled_python = ['black']

" run a formatter on save
augroup fmt
  autocmd!
  autocmd BufWritePre *.py try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat
augroup END
