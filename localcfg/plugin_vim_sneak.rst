``localcfg/plugin_vim_sneak.vim``
=================================

Make highlights *really* pop::

    augroup jnrowe_vim_sneak
        autocmd ColorScheme * highlight Sneak guifg=black guibg=red
            \ ctermfg=black ctermbg=red
    augroup END

.. note::

    These settings are incredibly dependent on the colour schemes being used.
