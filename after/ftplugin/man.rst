``after/ftplugin/man.vim``
==========================

Use :kbd:`<Enter>` and :kbd:`<Backspace>` to hop through man pages, as I’m too
used to that setup in browsers::

    if get(dein#get('vim-man'), 'if', v:true)
        nnoremap <buffer> <CR>
            \ :call man#get_page_from_cword('horizontal', v:count)<CR>
        nnoremap <buffer> <BS> :call <SID>PopPage()<CR>
    else
        nnoremap <buffer> <CR> :<C-u>call <SID>PreGetPage(v:count)<CR>
        nnoremap <buffer> <BS> :call man#pop_page()<CR>
    endif
