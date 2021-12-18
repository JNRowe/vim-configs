``autoload/plugins/wordnet_vim.vim``
====================================

.. function:: wordnet_close_win() -> None

    Close wordnet_ window from anywhere.

::

    function! plugins#wordnet_vim#close_win() abort
        if bufnr('__WordNet__') > -1
            exec bufnr('__WordNet__') . 'bdelete!'
        endif
    endfunction

.. _wordnet: https://wordnet.princeton.edu/
