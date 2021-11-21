``after/ftplugin/help.vim``
===========================

Use :kbd:`<Enter>` and :kbd:`<Backspace>` to hop through documentation, as I’m
too used to that setup in browsers::

    nnoremap <silent> <buffer> <CR> <C-]>
    nnoremap <silent> <buffer> <BS> <C-T>

As we’re not editing help files all that often we shouldn’t need access to
macros, and can therefore use :kbd:`q` to quick quit::

    nnoremap <silent> <buffer> q :quit<CR>
