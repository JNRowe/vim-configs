``localcfg/plugin_vim_textobj_quote.vim``
=========================================

.. code-block:: vim

    let g:textobj#quote#matchit = v:true

.. code-block:: vim

    augroup jnrowe_textobj_quote
        autocmd!
        autocmd FileType rst call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END
