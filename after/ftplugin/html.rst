``after/ftplugin/html.vim``
===========================

I treat :doc:`MHTML files as HTML <../../ftdetect/mht>`, so make it possible to
use section jumps to jump about::

    if expand('%:e') ==? 'mhtml'
        nnoremap <buffer> ]] :call search('^------MultipartBoundary--', '')<CR>
        nnoremap <buffer> [[ :call search('^------MultipartBoundary--', 'b')<CR>
    endif
