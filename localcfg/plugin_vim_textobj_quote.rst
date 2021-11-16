``localcfg/plugin_vim_textobj_quote.vim``
=========================================

.. include:: ../.includes/scriptencoding.rst

Enable for |reST| and other largely prose filetypes::

    augroup jnrowe_vim_textobj_quote
        autocmd!
        autocmd FileType gitcommit,gitrebase,note,rst call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END

.. note::

    We enable, but don’t force, for plain text so that we don’t send fancy
    characters to things that expect |ASCII|.

Configure quotes for current language::

    function! s:select_quotes() abort
        let l:current_lang = split(&spelllang, '_')[0]
        if l:current_lang ==# 'de'
            let g:textobj#quote#doubleDefault = '„“'
            let g:textobj#quote#singleDefault = '‚‘'
        elseif l:current_lang ==# 'en'
            let g:textobj#quote#doubleDefault = '“”'
            let g:textobj#quote#singleDefault = '‘’'
        elseif l:current_lang =~# '^\(es|it\)$'
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
