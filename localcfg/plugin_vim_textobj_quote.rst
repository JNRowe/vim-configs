``localcfg/plugin_vim_textobj_quote.vim``
=========================================

.. include:: ../.includes/scriptencoding.rst

::

    augroup jnrowe_vim_textobj_quote
        autocmd!

Enable for |reST| and other largely prose filetypes::

        autocmd FileType gitcommit,gitrebase,note,rst call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})

.. note::

    We enable, but don’t force, for plain text so that we don’t send fancy
    characters to things that expect |ASCII|.

Configure quotes for current language::

        autocmd BufEnter * call plugins#vim_textobj_quote#select_quotes()

.. seealso::

    * :func:`plugins#vim_textobj_quote#select_quotes() <select_quotes>`

::

    augroup END
