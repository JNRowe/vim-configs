``localcfg/plugins/patchreview_vim.vim``
========================================

If the *awesome* :command:`wormpatch` is available use it::

    if executable('wpatch')
        let g:patchreview_patch = exepath('wpatch')
    endif
