``localcfg/plugins/jedi_vim.vim``
=================================

I like my ``'completeopt'`` settings to be language independent::

    let g:jedi#auto_vim_configuration = v:false

Split “go to” windows to bottom::

    let g:jedi#use_splits_not_buffers = 'bottom'

I never use |Python| 2 now::

    let g:jedi#force_py_version=3

I find :repo:`vim-clevertab <neitanod/vim-clevertab>` performs exactly how
I want::

    let g:jedi#completions_enabled = v:false
