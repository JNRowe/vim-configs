function! s:RegexComplete(arglead, cmdline, cursorpos)
    return map(glob(g:dein_repos_dir .
        \           '/github.com/ervandew/regex/autoload/regex/lang/*.vim',
        \           v:false, v:true),
        \      "fnamemodify(v:val, ':t:r')")
endfun
command! -nargs=?
    \ -complete=customlist,s:RegexComplete
    \ Regex call regex#regex#OpenTestWindow(<q-args>)
