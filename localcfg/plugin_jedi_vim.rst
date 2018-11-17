``localcfg/plugin_jedi_vim.vim``
================================

I like my 'completeopt' setting::

    let g:jedi#auto_vim_configuration = v:false

Split “go to” to bottom::

    let g:jedi#use_splits_not_buffers = 'bottom'

I almost never use Python_ 2 now::

    let g:jedi#force_py_version=3

I find vim-clevertab_ performs exactly how I want::

    let g:jedi#completions_enabled = v:false

.. _Python: https://www.python.org/
.. _vim-clevertab: https://github.com.com/neitanod/vim-clevertab/
