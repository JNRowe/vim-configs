``autoload/plugins/vim_startify.vim``
=====================================

.. include:: ../../.includes/scriptversion.rst

.. function:: set_header_display() -> None

    Choose header content based on window size.

::

    function! plugins#vim_startify#set_header_display() abort
        if &lines < 40
            let g:startify_custom_header = []
        else
            let g:startify_custom_header = g:startify_header_full
        endif
    endfunction
