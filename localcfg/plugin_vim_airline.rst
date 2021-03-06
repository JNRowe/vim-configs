``localcfg/plugin_vim_airline.vim``
===================================

.. include:: ../.includes/scriptencoding.rst

.. image:: /.static/vim_airline_powerlineish.png
   :alt: powerlineish theme screenshot

Attempt to cache highlighting groups changes::

    let g:airline_highlighting_cache = v:true

Configure look::

    let g:airline_theme = 'powerlineish'
    let g:airline_skip_empty_sections = v:true

.. include:: ../.includes/fontawesome.rst

Configure symbols for :command:`gvim`::

    if has('gui_running')
        if index(split(&guifont), 'NF') != -1
            let g:airline_powerline_fonts = v:true
            let g:airline_left_sep = ''
            let g:airline_right_sep = ''
        else
            let g:airline_left_sep = '╗'
            let g:airline_right_sep = '╔'
        endif

        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

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

.. note::

    The test ``NF`` is to enable less common replacements that may only be
    available with the nerd-fonts_ packages.

.. include:: ../.includes/fancy_symbols.rst

and use simple :abbr:`ASCII (American Standard Code for Information
Interchange)` replacements in a terminal::

    else
        let g:airline_symbols_ascii = v:true
    endif

Only show unusual encodings::

    let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

Only use the extensions I actually want::

    let g:airline#extensions#disable_rtp_load = v:true
    let g:airline_extensions = [
        \ 'csv',
        \ 'tabline',
        \ 'whitespace',
        \ 'wordcount',
    \ ]

.. attention::

    This requires some vigilance over updates for finding fancy new toys,
    but surely you’re not just blinding grabbing repositories from GitHub
    anyway…

Enable :repo:`ale <dense-analysis/ale>` extension::

    if v:version >= 800 && has('signs')
        let g:airline_extensions += ['ale']
        if has('gui_running')
            let g:airline#extensions#ale#error_symbol = ''
            let g:airline#extensions#ale#warning_symbol = ''
        endif
        let g:airline#extensions#ale#checking_symbol = '…'
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

Only show ``tabline`` when there are multiple buffers::

    let g:airline#extensions#tabline#buffer_min_count = 2

Prettier overflow::

    let g:airline#extensions#tabline#overflow_marker = '…'

Use unique names for buffers in tabline::

    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

Show simple reading time estimate::

    let g:airline#extensions#wordcount#formatter = 'readingtime'

When :abbr:`CSV (Comma Separated Value)` files have a header, use it::

    let g:airline#extensions#csv#column_display = 'Name'

.. note::

    The ``csv`` extension uses the *excellent* :repo:`csv.vim
    <chrisbra/csv.vim>` plugin by Christian Brabandt.

Use a pretty symbol for :repo:`vim-obsession <tpope/vim-obsession>`::

    if has('gui_running')
        let g:airline#extensions#obsession#indicator_text = ''
    endif

Allow spaces *after* tabs, but not in between::

    let g:airline#extensions#whitespace#mixed_indent_algo = 2

.. _nerd-fonts: https://github.com/ryanoasis/nerd-fonts
.. _git: https://www.git-scm.com/
