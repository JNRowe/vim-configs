``localcfg/plugin_regex.vim``
=============================

Only complete on installed languages::

    if has('cmdline_compl')
        function! s:regex_complete(arglead, cmdline, cursorpos) abort
            let l:lang_files = glob(
                \   g:dein_repos_dir .
                \   '/github.com/ervandew/regex/autoload/regex/lang/*.vim',
                \   v:false, v:true)
            return filter(map(l:lang_files,
                \             {_, s -> fnamemodify(s, ':t:r')}),
                \         {_, s -> !empty(exepath(s))})
        endfunction
        command! -nargs=?
            \ -complete=customlist,<SID>regex_complete
            \ Regex call regex#regex#OpenTestWindow(<q-args>)
    endif
