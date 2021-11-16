``autoload/plugins/vim_textobj_quote.vim``
==========================================

.. function:: select_quotes() -> None

    Configure quotes for current language.

::

    function! plugins#vim_textobj_quote#select_quotes() abort
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
