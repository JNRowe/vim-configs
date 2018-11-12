``localcfg/plugin_vim_editqf.vim``
==================================

Store data in `XDG basedir`_ compliant location::

    augroup jnrowe_editqf
        autocmd BufEnter *
            \ let g:editqf_saveqf_filename = g:vim_data_dir . '/quickfix/' .
            \   expand('%:p:~:gs?/?_?.dat') |
            \ let g:editqf_saveloc_filename = g:vim_data_dir . '/location/' .
            \   expand('%:p:~:gs?/?_?.dat')
    augroup END

.. _XDG basedir: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
