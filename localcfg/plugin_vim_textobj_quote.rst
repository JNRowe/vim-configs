``localcfg/plugin_vim_textobj_quote.vim``
=========================================

::

    let g:textobj#quote#matchit = v:true

Enable for reST_ and text filetypes::

    augroup jnrowe_textobj_quote
        autocmd!
        autocmd FileType gitcommit,rst call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END

.. note::

    We enable, but don’t force, for plain text so that we don’t send fancy
    characters to things that expect :abbr:`ASCII (American Standard Code
    for Information Interchange)`.

.. _reST: http://docutils.sourceforge.net/rst.html
