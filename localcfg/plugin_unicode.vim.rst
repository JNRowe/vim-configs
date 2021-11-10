``localcfg/plugin_unicode.vim.vim``
===================================

``:UnicodeName`` output is far more useful than :command:`vim`’s :kbd:`ga`, and
in my opinion it is also easier to read.

================ =========================================================
Command          Output
================ =========================================================
``:ascii``       ``<> 61486, Hex f02e, Octal 170056``
``:UnicodeName`` ``'' U+F02E Dec:61486 Private Use Zone &#xF02E; /\%uf02e
                 "\uf02e"``
================ =========================================================

So, we’ll override the :kbd:`ga` mapping::

    nmap ga <Plug>(UnicodeGA)

.. tip::

    If for some reason you want the default :kbd:`ga` output ``:ascii`` still
    does that.

Store data in |XDG basedir| compliant location::

    let g:Unicode_cache_directory = g:vim_cache_dir . '/unicode.vim'
    let g:Unicode_data_directory = g:vim_data_dir . '/unicode.vim'
