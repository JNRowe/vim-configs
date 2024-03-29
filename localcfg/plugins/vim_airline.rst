``localcfg/plugins/vim_airline.vim``
====================================

.. include:: ../../.includes/scriptencoding.rst

.. include:: ../../.includes/scriptversion.rst

.. image:: /.static/vim_airline_powerlineish.png
   :alt: powerlineish theme screenshot

Attempt to cache highlighting group changes::

    const g:airline_highlighting_cache = v:true

Configure look::

    let g:airline_theme = 'powerlineish'
    const g:airline_skip_empty_sections = v:true
    const g:airline_inactive_collapse = v:false

.. include:: ../../.includes/fontawesome.rst

Configure prettier symbols::

    if index(split(&guifont), 'NF') != -1
        const g:airline_powerline_fonts = v:true
        const g:airline_left_sep = ''
        const g:airline_right_sep = ''
    else
        const g:airline_left_sep = '╗'
        const g:airline_right_sep = '╔'
    endif

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_symbols = #{
    \   branch: '',
    \   colnr: '℅',
    \   crypt: '',
    \   linenr: '',
    \   maxlinenr: '⌇',
    \   modified: '+',
    \   notexists: 'Ɇ',
    \   paste: 'ρ',
    \   readonly: '',
    \   space: ' ',
    \   spell: '',
    \   whitespace: 'Ξ',
    \ }

.. warning::

    ``'guifont'`` is normally only available with :command:`gvim`, but we have
    a :ref:`hacky workaround <term-guifont>` for regular |vim|.

.. note::

    The ``NF``-suffixed branch is here to prefer a :repo:`nerd-fonts
    <ryanoasis/nerd-fonts>` variation of a font if available.

.. include:: ../../.includes/fancy_symbols.rst

Only show unusual encodings::

    const g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

Only use the extensions I actually want::

    const g:airline#extensions#disable_rtp_load = v:true
    let g:airline_extensions = [
    \   'csv',
    \   'nrrwrgn',
    \   'obsession',
    \   'searchcount',
    \   'tabline',
    \   'unicode',
    \   'vimagit',
    \   'whitespace',
    \   'wordcount',
    \   'zoomwintab'
    \ ]

.. attention::

    This requires some vigilance over updates for finding fancy new toys, but
    surely you’re not just blinding grabbing repositories from GitHub anyway…

Show emoji flags instead of textual code for spelling language::

    let g:airline_detect_spelllang = 'flag'

.. warning::

    Support for variable width Unicode characters as used in the flag display is
    *hugely* dependent on both terminal support *and* the system’s font
    configuration.  This *will* cause problems, but I’m of the the opinion that
    they’re worth fixing for their usability improvements.

The ``searchcount`` extension only displays its segment when ``'hlsearch'`` is
enabled, so we’ll fall back on ``'shortmess'``’s search counting functionality
when it is disabled::

    augroup jnrowe_vim_airline
        autocmd!
        autocmd OptionSet hlsearch call plugins#vim_airline#toggle_searchcount()
    augroup END

Enable :repo:`ale <dense-analysis/ale>` extension::

    if has('signs')
        let g:airline_extensions += ['ale']
        const g:airline#extensions#ale#error_symbol = ''
        const g:airline#extensions#ale#warning_symbol = ''
        const g:airline#extensions#ale#checking_symbol = '…'
    endif

Use simple statusline for quickfix windows::

    if has('quickfix')
        let g:airline_extensions += ['quickfix']
    endif

Enable |git| extension, if possible::

    if executable('git')
        let g:airline_extensions += ['branch', 'hunks']

… truncate all but the :command:`basename`-equivalent of branch names::

        const g:airline#extensions#branch#format = 2

… use nice symbols::

        const g:airline#extensions#hunks#hunk_symbols = ['➕ ', ' ', '➖ ']

… don’t display symbol and count when there are no changes::

        const g:airline#extensions#hunks#non_zero_only = v:true

::

    endif

Only show ``tabline`` when there are multiple buffers::

    const g:airline#extensions#tabline#buffer_min_count = 2

Show buffer number for quicker switching::

    const g:airline#extensions#tabline#buffer_nr_show = v:true

Prettier overflow::

    const g:airline#extensions#tabline#overflow_marker = '…'

Make the rounded separators display correctly in the tabline::

    const g:airline#extensions#tabline#alt_sep = v:true
    const g:airline#extensions#tabline#left_alt_sep = ''

Use unique names for buffers in tabline::

    const g:airline#extensions#tabline#formatter = 'unique_tail_improved'

Show simple reading time estimate::

    const g:airline#extensions#wordcount#formatter = 'readingtime'

When |CSV| files have a header, use it::

    const g:airline#extensions#csv#column_display = 'Name'

.. note::

    The ``csv`` extension uses the *excellent* :repo:`csv.vim
    <chrisbra/csv.vim>` plugin by Christian Brabandt.

Use a pretty symbol for :repo:`vim-obsession <tpope/vim-obsession>`::

    const g:airline#extensions#obsession#indicator_text = ''

Allow spaces *after* tabs, but not in between::

    const g:airline#extensions#whitespace#mixed_indent_algo = 2

.. spelling::

    Brabandt
