``localcfg/plugin_patchreview_vim.vim``
=======================================

If the *awesome* :command:`wormpatch` is available use it::

    if executable('wpatch')
        let g:patchreview_patch = '/usr/bin/wpatch'
    endif
