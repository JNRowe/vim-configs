``localcfg/plugins/vim_editqf.vim``
===================================

.. include:: ../../.includes/scriptversion.rst

Store data in |XDG basedir| compliant location::

    augroup jnrowe_editqf
        autocmd!
        autocmd BufEnter * call plugins#vim_editqf#set_data_files()
    augroup END

.. seealso::

    * :func:`plugins#vim_editqf#set_data_files() <set_data_files>`
