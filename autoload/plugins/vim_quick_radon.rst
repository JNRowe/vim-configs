``autoload/plugins/vim_quick_radon.vim``
========================================

.. function:: open_win() -> None

    Display radon_ output if possible.

::

    function! plguins#radon#open_win abort
        if &filetype ==# 'python'
            QuickRadon
        endif
    endfunction

.. function:: close_win() -> None

    Utility to close radon_ window from anywhere.

::

    function! plugins#radon#close_win() abort
        if bufnr('quick_radon') > -1
            exec bufnr('quick_radon') . 'bdelete!'
        endif
    endfunction

.. _radon: https://radon.readthedocs.io/
