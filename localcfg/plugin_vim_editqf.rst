``localcfg/plugin_vim_editqf.vim``
==================================

Store data in |XDG basedir| compliant location::

    augroup jnrowe_editqf
        autocmd!
        autocmd BufEnter * call plugins#vim_editqf#set_data_files()
    augroup END

.. seealso::

    * :func:`plugins#vim_editqf#set_data_files() <set_data_files>`
