``localcfg/plugins/jedi_vim.vim``
=================================

.. include:: ../../.includes/scriptversion.rst

I like my ``'completeopt'`` settings to be language independent::

    const g:jedi#auto_vim_configuration = v:false

Split “go to” windows to bottom::

    const g:jedi#use_splits_not_buffers = 'bottom'

I never use |Python| 2 now::

    const g:jedi#force_py_version=3

I find :repo:`vim-clevertab <neitanod/vim-clevertab>` performs exactly how
I want::

    const g:jedi#completions_enabled = v:false
