if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

function! RegexComplete(arglead, cmdline, cursorpos)
    return map(glob("~/.vim/external/regex/autoload/regex/lang/*.vim", 0, 1),
        \      "fnamemodify(v:val, ':t:r')")
endfun
