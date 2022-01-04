``autoload/plugins/vim_airline.vim``
====================================

.. include:: ../../.includes/scriptversion.rst

.. function:: toggle_searchcount() -> None

    Use built-in search count display when 'hlsearch' is disabled.

::

    function! plugins#vim_airline#toggle_searchcount() abort
        if &hlsearch
            set shortmess+=S
        else
            set shortmess-=S
        endif
    endfunction

.. spelling::

    hlsearch
