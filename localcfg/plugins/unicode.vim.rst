``localcfg/plugins/unicode.vim.vim``
====================================

.. include:: ../../.includes/scriptversion.rst

Store data in |XDG basedir| compliant location::

    const g:Unicode_cache_directory = g:vim_cache_dir .. '/unicode.vim'
    const g:Unicode_data_directory = g:vim_data_dir .. '/unicode.vim'
