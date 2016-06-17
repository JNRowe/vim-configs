if exists('*SLoaded') && SLoaded(expand('<sfile>'))
    finish
endif

function! SLoaded(name)
    let l:var = 'loaded_' . fnamemodify(a:name, ':h:t:gs?[.-]?_?') . '_' .
        \ fnamemodify(a:name, ':t:r:gs?[\.-]?_?')
    if exists('$VIMRC_DEBUG')
        echo 'SLoaded: ' . l:var
    endif
    if get(g:, l:var)
        return 1
    else
        execute 'let g:' . l:var . ' = 1'
        return 0
    endif
endfunction
call SLoaded(expand('<sfile>'))

function! SUnLoad(name)
    let l:var = 'loaded_' . fnamemodify(a:name, ':h:t:gs?[.-]?_?') . '_' .
        \ fnamemodify(a:name, ':t:r:gs?[\.-]?_?')
    if get(g:, l:var)
        execute 'unlet g:' . l:var
    endif
endfunction
