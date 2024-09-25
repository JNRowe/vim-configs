``vimrc.d/dein_early_setup.vim``
================================

This file holds setup that is required for lazy loading to function correctly
with ``dein.vim``, but which can’t be stored within the :doc:`plugin
configuration <../dein>` as it would break caching.

.. include:: ../.includes/vim9script.rst

.. _ale-custom-maps:

``ale`` maps
------------

Use my custom maps::

    if v:version >= 800 && has('signs')
        keymaps#mnemonic_map('ale', {local: v:true})

        for [key, cmd] in [
            ['br',     'reset_buffer'],
            ['bt',     'toggle_buffer'],
            ['d',      'detail'],
            ['f',      'fix'],
            ['gd',     'go_to_definition'],
            ['gt',     'go_to_type_definition'],
            ['l',      'lint'],
            ['r',      'reset'],
            ['t',      'toggle'],
            ['vgd',    'go_to_definition_in_vsplit'],
            ['vgt',    'go_to_type_definition_in_vsplit'],
            ['<Home>', 'first'],
            ['<End>',  'last'],
            ['<Down>', 'next_wrap'],
            ['<Up>',   'previous_wrap'],
        ]
            execute printf('nmap <silent> [ale]%s <Plug>(ale_%s)', key, cmd)
        endfor
        nnoremap [ale]i <Cmd>call ale#debugging#Info()<CR>
    endif

.. note::

    You can, of course, simply use the normal :doc:`location list bindings
    <../localcfg/quickfix>` for movement too.

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _calendar-vim-custom-maps:

``calendar-vim`` maps
---------------------

Use my custom maps::

    const g:calendar_no_mappings = v:true

    keymaps#mnemonic_map('Calendar')

    for [key, cmd] in [
        ['v', ''],
        ['h', 'H'],
        ['f', 'T'],
        ['r', 'VR'],
    ]
        execute printf('nnoremap [Calendar]%s <Cmd>Calendar%s<CR>', key, cmd)
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _committia-vim-filetype:

``committia.vim`` filetype
--------------------------

We lazy load on filetype definition for my normal workflow with
``clientserver``, but want to forcibly load on |vim| being called from
:command:`git commit`::

    if plugins#dein#has_exec('git')
        if get(v:argv, 0, '') =~# '/.git/COMMIT_EDITMSG$'
            call dein#source('committia.vim')
        endif
    endif

.. _dwm-vim-custom-maps:

``dwm.vim`` maps
----------------

Use my custom maps::

    const g:dwm_map_keys = v:false

    keymaps#mnemonic_map('dwm')

Configure maps to match, to some degree, my window manager’s configuration::

    for [key, cmd] in [
        ['n',       'New'],
        ['c',       'Close'],
        ['f',       'Focus'],
        ['<Left>',  'RotateCounterclockwise'],
        ['<Right>', 'RotateClockwise'],
        ['<Up>',    'New'],
        ['<Down>',  'Close'],
        ['+',       'GrowMaster'],
        ['-',       'ShrinkMaster'],
    ]
        execute printf('nmap [dwm]%s <Plug>DWM%s', key, cmd)
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. tip::

    Imagine :kbd:`<Up>` increases window count, and :kbd:`<Down>`… well, yeah.

.. _fzf-vim-custom-maps:

``fzf.vim`` maps
----------------

Configure convenience mappings for common command usage::

    if plugins#dein#has_exec('fzf')
        g:fzf_commands = ['Buffers', 'Colors', 'Commands', 'Files', 'History',
                          'Lines', 'Maps', 'Marks', 'Windows']
        if plugins#dein#has_exec('ag')
            g:fzf_commands += ['Ag', ]
        endif
        if plugins#dein#has_exec('git')
            g:fzf_commands += ['GFiles', ]
        endif
        if has('insert_expand')
            g:fzf_commands += ['Snippets', ]
        endif
        keymaps#mnemonic_map('fzf', {key: '`'})
        for cmd in g:fzf_commands
            execute printf('nnoremap [fzf]%s <Cmd>FZF%s<CR>',
                           tolower(cmd[0]), cmd)
        endfor
    endif

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. tip::

    I use :kbd:`grave` as my binding for :command:`fzf` commands to reflect my
    use of :kbd:`<Mod4-\`>` to open a drop down terminal in my window manager.
    The pattern here and throughout these configuration files is extremely
    useful as a way to remember bindings.

.. _git-messenger-vim-custom-maps:

``git-messenger.vim`` maps
--------------------------

Use my custom maps::

    if has('signs') && plugins#dein#has_exec('git')
        let g:git_messenger_no_default_mappings = v:true

        keymaps#mnemonic_map('messenger')

        for [key, cmd] in [
            ['o',          ''],
            ['c',          '-close'],
            ['i',          '-into-popup'],
            ['<Down>',     '-scroll-down-1'],
            ['<Up>',       '-scroll-up-1'],
            ['<PageDown>', '-scroll-down-page'],
            ['<PageUp>',   '-scroll-up-page'],
        ]
            execute printf(
                'nmap <silent> [messenger]%s <Plug>(git-messenger%s)',
                key, cmd)
        endfor
    endif

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _nerdtree-custom-maps:

``nerdtree`` maps
-----------------

Use my custom maps::

    keymaps#mnemonic_map('nerdtree')

    for [key, cmd] in [
        ['O', 'VCS'],
        ['T', 'ToggleVCS'],
        ['c', 'Close'],
        ['f', 'Focus'],
        ['o', ''],
        ['t', 'Toggle'],
    ]
        execute printf('nnoremap [nerdtree]%s <Cmd>NERDTree%s<CR>', key, cmd)
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _sideways-vim-custom-maps:

``sideways.vim`` maps
---------------------

Use my custom maps::

    keymaps#mnemonic_map('sideways', {local: v:true})

    for key in ['Left', 'Right']
        execute printf('nnoremap [sideways]<%s> <Cmd>Sideways%s<CR>', key, key)
        execute printf('nnoremap [sideways]<S-%s> <Cmd>SidewaysJump%s<CR>',
                       key, key)
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _switch-vim-custom-maps:

``switch.vim`` maps
-------------------

Use :kbd:`<C-M-T>` to flip word under cursor to match my old
``True``/``False`` map memory::

    for [mode, cmd_prefix] in [
        ['i', '<C-O>'],
        ['n', ''],
        ['v', '<ESC>'],
    ]
        execute printf('%snoremap <C-M-T> %s:Switch<CR>', mode, cmd_prefix)
    endfor

.. _unicode-vim-custom-maps:

``unicode.vim`` maps
--------------------

``:UnicodeName`` output is far more useful than |vim|’s :kbd:`ga`, and in my
opinion it is also easier to read.

================ =========================================================
Command          Output
================ =========================================================
``:ascii``       ``<> 61486, Hex f02e, Octal 170056``
``:UnicodeName`` ``'' U+F02E Dec:61486 Private Use Zone &#xF02E; /\%uf02e
                 "\uf02e"``
================ =========================================================

So, we’ll override the :kbd:`ga` mapping::

    nmap ga <Plug>(UnicodeGA)

.. tip::

    If for some reason you want the default :kbd:`ga` output ``:ascii`` still
    does that.

.. _vim-bufmru-custom-maps:

``vim-bufmru`` maps
-------------------

Use my custom maps::

    keymaps#mnemonic_map('bufmru')

    nnoremap [bufmru]l       <Cmd>BufMRU<CR>
    nnoremap [bufmru]<Left>  <Cmd>BufMRUPrev<CR>
    nnoremap [bufmru]<Right> <Cmd>BufMRUNext<CR>

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. tip::

    Imagine :kbd:`<Left>` and :kbd:`<Right>` are moving across a timeline of
    used buffers.

.. _vim-editqf-custom-maps:

``vim-editqf`` maps
-------------------

Add custom maps in to my quickfix map hierarchy::

    nmap [quickfix]a <Plug>QFAddNote
    nmap [quickfix]A <Plug>QFAddPatternNote
    nnoremap [location]a <Cmd>LocAddNote<CR>
    nnoremap [location]A <Cmd>LocAddNotePattern<CR>

.. _vim-fugitive-custom-maps:

``vim-fugitive`` maps
---------------------

Add map to change directory to git_ project root using :repo:`vim-projectionist
<tpope/vim-projectionist>`::

    if plugins#dein#has_exec('git')
        nnoremap <C-p> <Cmd>Gcd<CR>
    endif

.. note::

    I never use :kbd:`<C-p>` or :kbd:`<C-n>` for navigation, as |vim| generally
    offers far more useful navigation, and anyway you can still move up with
    :kbd:`k`.

.. _vim-gitgutter-custom-maps:

``vim-gitgutter`` maps
----------------------

Use my custom maps::

    if has('signs') && plugins#dein#has_exec('git')
        keymaps#mnemonic_map('gitgutter')
        g:gitgutter_map_keys = v:false

        for [key, cmd] in [
            ['<Down>',  'NextHunk'],
            ['<Up>',    'PrevHunk'],
            ['<Space>', 'Toggle'],
            ['f',       'Fold'],
            ['p',       'PreviewHunk'],
            ['q',       'QuickFix'],
        ]
            execute printf(
                'nnoremap [gitgutter]%s <Cmd>GitGutter%s<CR>',
                key, cmd
            )
        endfor
    endif

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _vim-ledger-custom-maps:

``vim-ledger`` maps
-------------------

Use my custom maps::

    keymaps#mnemonic_map('Ledger', {buffer: v:true, key: 'L', local: v:true})

    for [key, cmd] in [
        ['a', ':LedgerAlign'],
        ['d', 'align_amount_at_cursor()'],
        ['n', 'entry()'],
        ['s', 'transaction_state_toggle(line("."), " *?!")'],
        ['t', 'transaction_date_set(".", "auxiliary")'],
    ]
        if cmd[0] !=# ':'
            cmd = 'call ledger#' .. cmd
        else
            cmd = cmd[1 : ]
        endif

        execute printf(
            'autocmd Filetype ledger nnoremap [Ledger]%s <Cmd>%s<CR>',
            key, cmd)
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _vim-mundo-custom-maps:

``vim-mundo`` maps
------------------

Use my custom maps::

    if has('pythonx') && v:version >= 703
        nnoremap <LocalLeader># <Cmd>MundoToggle<CR>
    endif

.. _vim-quick-radon-custom-maps:

``vim-quick-radon`` maps
------------------------

Configure my custom maps::

    if plugins#dein#has_exec('radon')
        keymaps#mnemonic_map('radon', {key: 'p', local: v:true})
    endif

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. note::

    :kbd:`<Leader>r` is free globally, but ``jedi-vim`` uses it in my Python
    files.

.. _vim-vebugger-custom-maps:

``vim-vebugger`` maps
---------------------

Use my custom maps::

    keymaps#mnemonic_map('vebugger', {local: v:true})
    const g:vebugger_leader = '[vebugger]'

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. _wordnet-vim-custom-maps:

``wordnet.vim`` maps
--------------------

Use my custom maps::

    if plugins#dein#has_exec('wn')
        keymaps#mnemonic_map('wordnet')

        for [key, cmd] in [
            ['o', 'WordNetOverviews(expand("<cword>"))'],
            ['c', 'plugins#wordnet_vim#close_win()'],
        ]
            execute printf('nnoremap [wordnet]%s <Cmd>call %s<CR>', key, cmd)
        endfor
    endif

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`
    * :func:`plugins#wordnet#close_win() <close_win>`

.. _git: https://git-scm.com/
