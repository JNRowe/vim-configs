if SLoaded(expand("<sfile>"))
    finish
endif

imap <C-M-T> <C-O>:call Toggle()<CR>
nmap <C-M-T> :call Toggle()<CR>
vmap <C-M-T> <ESC>:call Toggle()<CR>
