" <F9> to execute the current buffer with python
nnoremap <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
inoremap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pytest' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!pytest' shellescape(@%, 1)<CR>

" /venv/bin/python -m pytest --rootdir . --override-ini junit_family=xunit1 --junit-xml=/tmp/tmp-27691VGg8jnPmL9ND.xml ./tests/monitor/evaluator/test_evaluator.py
nnoremap <buffer> <F9> :w<CR>:exec '!python3 -m pytest --quiet 'shellescape(@%, 1)<CR>
inoremap <buffer> <F9> <esc>:w<CR>:exec '!python3 -m pytest --quiet 'shellescape(@%, 1)<CR>

" Configure enabled formatters.
let g:neoformat_enabled_python = ['black']

" run a formatter on save
augroup fmt
  autocmd!
  autocmd BufWritePre *.py try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat
augroup END
