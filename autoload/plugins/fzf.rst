``autoload/plugins/fzf.vim``
============================

.. function:: build_quickfix_list(lines: List[str]) -> None

    Build ``quickfix`` list from fzf_ results.

    :param lines: Selected elements from fzf_ buffer

::

    function! plugins#fzf#build_quickfix_list(lines) abort
        call setqflist(map(copy(a:lines), {_, s -> 'filename': s }))
        " 5 lines seems to be the magic number for *me*
        copen 5
    endfunction

.. _fzf: https://github.com/junegunn/fzf
