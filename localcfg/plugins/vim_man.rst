``localcfg/plugins/vim_man.vim``
================================

.. include:: ../../.includes/scriptversion.rst

Default to using the enhanced man page interface::

    set keywordprg=:Man

Use :kbd:`<Enter>` and :kbd:`<Backspace>` to hop through man pages, as I’m too
used to that setup in browsers::

    augroup jnrowe_vim_man
        autocmd!
        autocmd FileType man
        \   nnoremap <buffer> <CR>
        \       :call man#get_page_from_cword('horizontal', v:count)<CR>|
        \   nnoremap <buffer> <BS> <Cmd>call man#pop_page()<CR>
    augroup END
