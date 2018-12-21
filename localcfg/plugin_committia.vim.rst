``localcfg/plugin_committia.vim.vim``
=====================================

I never want multi-column display in the terminal::

    if !has('gui')
        let g:committia_use_singlecolumn = 'always'
    endif
