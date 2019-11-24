``after/ftplugin/help.vim``
===========================

Use :kbd:`<Enter>` and :kbd:`<Backspace>` to hop through documentation, as I’m
too used to that setup in browsers::

    nnoremap <buffer> <CR> <C-]>
    nnoremap <buffer> <BS> <C-T>

As we’re not editing help files all that often we shouldn’t need access to
macros, and can therefore use :kbd:`q` to quick quit::

    nnoremap <buffer> q :quit<CR>
