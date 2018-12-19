``localcfg/plugin_vim_airline.vim``
===================================

.. include:: ../.includes/scriptencoding.rst

.. image:: /.static/vim_airline_powerlineish.png
   :alt: powerlineish theme screenshot

Configure look::

    let g:airline_theme = 'powerlineish'
    let g:airline_skip_empty_sections = v:true

.. include:: ../.includes/fontawesome.rst

Configure symbols::

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

Only use the extensions I actually want::

    let g:airline#extensions#disable_rtp_load = v:true
    let g:airline_extensions = [
        \ 'csv',
        \ 'whitespace',
        \ 'wordcount',
    \ ]

Enable :repo:`ale <w0rp/ale>` extension::

    if v:version >= 800 && has('signs')
        let g:airline_extensions += ['ale']
    endif

Use simple statusline for quickfix windows::

    if has('quickfix')
        let g:airline_extensions += ['quickfix']
    endif

Enable git_ extension::

    if executable('git')
        let g:airline_extensions += ['branch', 'hunks']

… truncate all but the “basename” of branch names::

        let g:airline#extensions#branch#format = 2

… use nice symbols where possible::

        if has('gui_running')
            let g:airline#extensions#hunks#hunk_symbols = ['➕ ', '≔ ', '➖ ']
        endif

… don’t display symbol and count when zero::

        let g:airline#extensions#hunks#non_zero_only = v:true

::

    endif

When :abbr:`CSV (Comma Separated Value)` files have a header, use it::

    let g:airline#extensions#csv#column_display = 'Name'

.. note::

    The ``csv`` extension uses the *excellent* :repo:`csv.vim
    <chrisbra/csv.vim>` plugin by Christian Brabandt.

Allow spaces *after* tabs, but not in between::

    let g:airline#extensions#whitespace#mixed_indent_algo = 2

.. _git: https://www.git-scm.com/
