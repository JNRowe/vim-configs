``localcfg/plugin_regex.vim``
=============================

Add completion based on installed languages::

    function! s:regex_complete(arglead, cmdline, cursorpos) abort
        return filter(map(glob(g:dein_repos_dir .
            \                  '/github.com/ervandew/regex/autoload/regex/lang/*.vim',
            \                  v:false, v:true),
            \             "fnamemodify(v:val, ':t:r')"),
            \         '!empty(exepath(v:val))')
    endfun
    command! -nargs=?
        \ -complete=customlist,<SID>regex_complete
        \ Regex call regex#regex#OpenTestWindow(<q-args>)
