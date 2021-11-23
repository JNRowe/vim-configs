``localcfg/plugin_committia.vim.vim``
=====================================

I never want multi-column display in the terminal::

    if !has('gui')
        let g:committia_use_singlecolumn = 'always'
    endif

Always open ``committia`` buffers when opening a commit message, which is useful
when you’re a heavy ``clientserver`` user::

    let g:committia_open_only_vim_starting = v:false

.. caution::

    This interacts badly with some plugins when you commit from within them,
    but that isn’t a use case I have.  It shouldn’t be that difficult to toggle
    the setting based on interactions should the need arise.
