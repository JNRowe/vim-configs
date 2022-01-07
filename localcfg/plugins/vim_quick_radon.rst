``localcfg/plugins/vim_quick_radon.vim``
========================================

.. include:: ../../.includes/scriptversion.rst

Display radon_ output if possible::

    nnoremap [radon]o <Cmd>call plugins#vim_quick_radon#open_win()<CR>

.. seealso::

    * :func:`plugins#vim_quick_radon#open_win() <open_win>`

Add map to close radon_ window from anywhere::

    nnoremap [radon]c <Cmd>call plugins#radon#close_win()<CR>

.. seealso::

    * :func:`plugins#vim_quick_radon#close_win() <close_win>`

.. _radon: https://radon.readthedocs.io/
