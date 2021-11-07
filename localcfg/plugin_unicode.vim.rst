``localcfg/plugin_unicode.vim.vim``
===================================

``:UnicodeName`` output is far more useful, and in my opinion easier to read::

    nmap ga <Plug>(UnicodeGA)

.. tip::

    If for some reason you want the default output ``:ascii`` does that.

Store data in |XDG basedir| compliant location::

    let g:Unicode_cache_directory = g:vim_cache_dir . '/unicode.vim'
    let g:Unicode_data_directory = g:vim_data_dir . '/unicode.vim'
