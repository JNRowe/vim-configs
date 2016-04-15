if SLoaded(expand("<sfile>"))
    finish
endif

function! RegexComplete(arglead, cmdline, cursorpos)
    return map(glob(g:dein_repos_dir .
        \           "/github.com/ervandew/regex/autoload/regex/lang/*.vim",
        \           0, 1),
        \      "fnamemodify(v:val, ':t:r')")
endfun
command! -nargs=?
    \ -complete=customlist,RegexComplete
    \ Regex call regex#regex#OpenTestWindow(<q-args>)
