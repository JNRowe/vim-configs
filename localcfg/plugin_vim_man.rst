``localcfg/plugin_vim_man.vim``
===============================

Use :kbd:`<Enter>` and :kbd:`<Backspace>` to hop through man pages, as I’m too
used to that setup in browsers::

    nnoremap <silent> <buffer> <CR>
    \   :call man#get_page_from_cword('horizontal', v:count)<CR>
    nnoremap <silent> <buffer> <BS> :call man#pop_page()<CR>
