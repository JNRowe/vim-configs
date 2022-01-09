``after/ftplugin/html.vim``
===========================

.. include:: ../../.includes/scriptversion.rst

I treat :doc:`MHTML files as HTML <../../ftdetect/mht>`, so make it possible to
use section jumps to jump about::

    if expand('%:e') ==? 'mhtml'
        nnoremap <buffer> ]]
        \   <Cmd>call search('^------MultipartBoundary--', '')<CR>
        nnoremap <buffer> [[
        \   <Cmd>call search('^------MultipartBoundary--', 'b')<CR>
    endif
