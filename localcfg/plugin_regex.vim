function! s:regex_complete(arglead, cmdline, cursorpos)
    return filter(map(glob(g:dein_repos_dir .
        \                  '/github.com/ervandew/regex/autoload/regex/lang/*.vim',
        \                  v:false, v:true),
        \             "fnamemodify(v:val, ':t:r')"),
        \         '!empty(exepath(v:val))')
endfun
command! -nargs=?
    \ -complete=customlist,s:regex_complete
    \ Regex call regex#regex#OpenTestWindow(<q-args>)
