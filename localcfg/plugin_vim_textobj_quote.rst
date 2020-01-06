``localcfg/plugin_vim_textobj_quote.vim``
=========================================

.. include:: ../.includes/scriptencoding.rst

Enable for reST_ and text filetypes::

    augroup jnrowe_vim_textobj_quote
        autocmd!
        autocmd FileType gitcommit,gitrebase,rst call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END

.. note::

    We enable, but don’t force, for plain text so that we don’t send fancy
    characters to things that expect :abbr:`ASCII (American Standard Code
    for Information Interchange)`.

Configure quotes for current language::

    function! s:select_quotes() abort
        let l:current_lang = substitute(&spelllang, '_.*', '', '')
        if l:current_lang ==# 'de'
            let g:textobj#quote#doubleDefault = '„“'
            let g:textobj#quote#singleDefault = '‚‘'
        elseif l:current_lang ==# 'es'
            let g:textobj#quote#doubleDefault = '«»'
            let g:textobj#quote#singleDefault = '“”'
        elseif l:current_lang ==# 'fr'
            let g:textobj#quote#doubleDefault = '«»'
            let g:textobj#quote#singleDefault = '‹›'
        endif
    endfunction

    augroup jnrowe_vim_textobj_quote
        autocmd BufEnter * call <SID>select_quotes()
    augroup END

.. _reST: http://docutils.sourceforge.net/rst.html
