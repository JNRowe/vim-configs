if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" I need only RFC2822, git and a limited collection of ISO-8601 variants.  One
" mismatch happened *once*, and here we are…
let g:speeddating_formats = [
    \ ['%i, %d %h %Y %H:%M:%S %z', 0, 0],
    \ ['%a %h %-d %H:%M:%S %Y %z', 0, 0],
    \ ['%Y-%m-%d%[ T]%H:%M:%S %z', 0, 0],
    \ ['%Y-%m-%d%[ T]%H:%M:%S%?[Z]', 0, 0],
    \ ['%Y-%m-%d%[ T]%H:%M%z', 0, 0],
    \ ['%Y-%m-%d%[ T]%H:%M', 0, 0],
    \ ['%Y-%m-%d', 0, 0],
    \ ['%H:%M:%S', 0, 0]
\ ]
