augroup jnrowe_ftdetect
    autocmd BufRead,BufNewFile *.do setlocal filetype=sh
    autocmd BufRead,BufNewFile *.do let g:is_posix=1
augroup END
