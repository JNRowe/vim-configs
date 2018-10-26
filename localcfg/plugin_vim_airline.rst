``localcfg/plugin_vim_airline.vim``
===================================

.. include:: ../.includes/scriptencoding.rst

.. code-block:: vim

    let g:airline_theme = 'powerlineish'
    let g:airline_skip_empty_sections = v:true

.. include:: ../.includes/fontawesome.rst

.. code-block:: vim

    if has('gui_running')
        let g:airline_left_sep = '╗'
        let g:airline_right_sep = '╔'

        let g:airline_symbols = {
            \ 'branch': '',
            \ 'crypt': '',
            \ 'linenr': '⏎',
            \ 'maxlinenr': '⌇',
            \ 'modified': '+',
            \ 'notexists': 'Ɇ',
            \ 'paste': 'ρ',
            \ 'readonly': '',
            \ 'space': ' ',
            \ 'spell': '',
            \ 'whitespace': 'Ξ',
        \ }
    else
        let g:airline_symbols_ascii = v:true
    endif

.. code-block:: vim

    let g:airline#extensions#disable_rtp_load = v:true
    let g:airline_extensions = [
        \ 'csv',
        \ 'po',
        \ 'whitespace',
        \ 'wordcount',
    \ ]

.. code-block:: vim

    if v:version >= 800 && has('signs')
        let g:airline_extensions += ['ale']
    endif
    if has('quickfix')
        let g:airline_extensions += ['quickfix']
    endif

.. code-block:: vim

    if executable('git')
        let g:airline_extensions += ['branch', 'hunks']
        let g:airline#extensions#branch#format = 2
        if has('gui_running')
            let g:airline#extensions#hunks#hunk_symbols = ['➕ ', '≔ ', '➖ ']
        endif
        let g:airline#extensions#hunks#non_zero_only = v:true
    endif

.. code-block:: vim

    let g:airline#extensions#csv#column_display = 'Name'
    let g:airline#extensions#whitespace#mixed_indent_algo = 2
