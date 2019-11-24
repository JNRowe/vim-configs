``dein.vim`` - ``dein`` plugins configuration
=============================================

.. tip::

    Modeline is set so that :kbd:`:Exconfig <C-r><C-f>` works on plugin names
    throughout this file [#]_::

        " vim: set isfname-=/:

These are all hosted on GitHub_ [#]_.  You should try at least a few of them,
they may make your life far simpler!


.. include:: .includes/scriptencoding.rst

.. attention::

    I record requirements even when they’re clearly met because I like to know
    what *may* break if I make changes.  For example, version checks for cases
    where :repo:`dein <Shougo/dein.vim>` wouldn't work anyway or using
    ``has('patch-x.x.x')`` for versions prior to 7.4.237.

.. note::

    In places where I could use a prefix, in `on_cmd setup
    <sideways.vim-config>`_ for example, I’ll often not do so because I prefer
    to have tab completion available for the commands that I use from the
    outset.

Utility functions
-----------------

Add a pre- or suffix to a list of strings.  This greatly improves readability in
my opinion.

::

    function! s:prefix(str, args) abort
        return map(a:args, {_, s -> a:str . s})
    endfunction

    function! s:suffix(str, args) abort
        return map(a:args, {_, s -> s . a:str})
    endfunction

Enable an airline extension.  This is purely to remove duplication in setup.

::

    function! s:airline_enable(extension) abort
        return 'let g:airline_extensions += ["' . a:extension . '"]'
    endfunction

``executable()`` doesn’t cache results, so we’ll do it ourselves to handle
repeated calls::

    let s:has_exec_cache = {}
    function! s:has_exec(command) abort
        if !has_key(s:has_exec_cache, a:command)
            let s:has_exec_cache[a:command] = executable(a:command)
        endif
        return s:has_exec_cache[a:command]
    endfunction

Support variables
-----------------

Used in ternaries for fallbacks to upstream sources when ``vcs_cst`` isn’t
available::

    let s:vcs_cst = dein#util#_get_type('vcs_cst') != {}

Repositories
------------

``dein.vim``
''''''''''''

    “A dark powered Vim/Neovim plugin manager”

:repo: :repo:`dein.vim <Shougo/dein.vim>`
:config: :doc:`vimrc.d/dein`

::

    call dein#add(expand('~/.vim/external/dein.vim'), {
        \ 'if': v:version >= 800,
    \ })

.. _sideways.vim-config:

``sideways.vim``
''''''''''''''''

    “Move an item in a delimiter-separated list left or right”

:repo: :repo:`sideways.vim <AndrewRadev/sideways.vim>`
:config: :doc:`localcfg/plugin_sideways.vim`

::

    call dein#add('AndrewRadev/sideways.vim', {
        \ 'on_cmd': s:prefix('Sideways', ['Left', 'Right']),
        \ 'on_map': {'n': '[sideways]'},
    \ })

``splitjoin.vim``
'''''''''''''''''

    “Switch between single-line and multiline forms of code”

:repo: :repo:`splitjoin.vim <AndrewRadev/splitjoin.vim>`
:config: :doc:`localcfg/plugin_splitjoin.vim`

::

    call dein#add('AndrewRadev/splitjoin.vim', {
        \ 'on_cmd': s:prefix('Splitjoin', ['Join', 'Split']),
        \ 'on_map': {'n': ['gJ', 'gS']},
    \ })

``switch.vim``
''''''''''''''

    “Switch segments of text with predefined replacements”

:repo: :repo:`switch.vim <AndrewRadev/switch.vim>`
:config: :doc:`localcfg/plugin_switch.vim`

Edit your config files like they had a fancy dialog box to fiddle with their
preferences.

::

    call dein#add('AndrewRadev/switch.vim', {
        \ 'on_cmd': 'Switch',
        \ 'on_func': 'switch#Switch',
        \ 'on_map': {'n': 'gs'},
    \ })

``vim-bracketed-paste``
'''''''''''''''''''''''

    “Enables transparent pasting into :command:`vim`\”

:repo: :repo:`vim-bracketed-paste <ConradIrwin/vim-bracketed-paste>`

::

    call dein#add('ConradIrwin/vim-bracketed-paste', {
        \ 'on_event': 'InsertEnter',
    \ })

``dwm.vim``
'''''''''''

    “Tiled Window Management for Vim”

:repo: :repo:`dwm.vim <JNRowe/dwm.vim>`
:config: :doc:`localcfg/plugin_dwm.vim`

Excellent window management, it really does bring dwm_ simplicity to
:command:`vim`!

::

    call dein#add('JNRowe/dwm.vim', {
        \ 'on_func': s:prefix('DWM_', ['Close', 'Focus', 'New', 'Rotate']),
    \ })

``securemodelines``
'''''''''''''''''''

    “A secure alternative to modelines”

:repo: :repo:`securemodelines <JNRowe/securemodelines>`
:config: :doc:`localcfg/plugin_securemodelines`

This lightens the load of dealing with people who can’t follow :ref:`coding
standards <editorconfig-plugin>` without allowing them free access to your
:command:`vim` session.

::

    call dein#add('JNRowe/securemodelines')

``vim-jnrowe``
''''''''''''''

    “Tango inspired colour scheme”

:repo: :repo:`vim-jnrowe <JNRowe/vim-jnrowe>`
:config: :doc:`localcfg/plugin_vim_jnrowe`

.. image:: http://jnrowe.github.io/vim-jnrowe/_images/default.png
   :target: http://jnrowe.github.io/vim-jnrowe/_images/default.png
   :width: 25%

::

    call dein#add('JNRowe/vim-jnrowe')

``delimitMate``
'''''''''''''''

    “Automatic closing of quotes, parenthesis, brackets, etc”

:repo: :repo:`delimitMate <Raimondi/delimitMate>`
:config: :doc:`localcfg/plugin_delimitMate`

The number 1 “Love it or hate it” plugin, to use it well you’ll want to read its
documentation and disable the defaults that get in the way of your favourite
language.

::

    call dein#add('Raimondi/delimitMate', {
        \ 'on_event': 'InsertEnter',
    \ })

``vimproc``
'''''''''''

    “Asynchronous execution plugin”

:repo: :repo:`vimproc <Shougo/vimproc>`

::

    call dein#add('Shougo/vimproc', {
        \ 'build': 'make',
        \ 'on_cmd': s:prefix('VBGstart', ['GBB', 'LLDB', 'PDB3']),
        \ 'on_func': 'vebugger',
    \ })

.. include:: .includes/lazy_rdep.rst

``ultisnips``
'''''''''''''

    “The ultimate plugin for snippets”

:repo: :repo:`ultisnips <SirVer/ultisnips>`
:config: :doc:`localcfg/plugin_ultisnips`

::

    call dein#add('SirVer/ultisnips', {
        \ 'depends': 'vim-snippets',
        \ 'if': has('pythonx') && v:version >= 704,
        \ 'on_event': 'InsertEnter',
    \ })

``vim-gitgutter``
'''''''''''''''''

    “Show :command:`git diff` status in the gutter”

:repo: :repo:`vim-gitgutter <airblade/vim-gitgutter>`
:config: :doc:`localcfg/plugin_vim_gitgutter`

::

    call dein#add('airblade/vim-gitgutter', {
        \ 'if': has('signs') && s:has_exec('git'),
    \ })

``vim-bad-whitespace``
''''''''''''''''''''''

    “Highlights whitespace at the end of lines”

:repo: :repo:`vim-bad-whitespace <bitc/vim-bad-whitespace>`

Highlights or deletes broken whitespace, and removes that ugly
almost-kind-of-works solution from your :file:`.vimrc`.

::

    call dein#add('bitc/vim-bad-whitespace', {
        \ 'on_cmd': s:suffix('BadWhitespace', ['Erase', 'Hide', 'Toggle']),
        \ 'on_event': 'InsertEnter',
    \ })

``Colorizer``
'''''''''''''

    “Colour colour names and codes”

:repo: :repo:`Colorizer <chrisbra/Colorizer>`
:config: :doc:`localcfg/plugin_Colorizer`

::

    call dein#add('chrisbra/Colorizer', {
        \ 'on_cmd':
        \   s:prefix('Color', ['Highlight', 'Toggle']) + ['RGB2Term', ],
    \ })

.. note::

    I don’t automatically enable this on specific filetypes because it
    *severely* slows down vim, enough to make you regret enabling it sometimes.
    However, when it is useful it is *incredibly* useful and definitely worth
    the slow down.

``NrrwRgn``
'''''''''''

    “A narrow region plugin (similar to Emacs)”

:repo: :repo:`NrrwRgn <chrisbra/NrrwRgn>`

If, like me, you’re a partial :command:`emacs` convert ``NrrwRgn`` is wonderful.
If you’re not then simply imagine being able to work in a visual mode hunk for
a full editing session.

::

    call dein#add('chrisbra/NrrwRgn', {
        \ 'hook_post_source': s:airline_enable('nrrwrgn'),
        \ 'if': v:version >= 704,
        \ 'on_cmd': ['NUD', 'NR', 'NW']
    \ })

``Recover``
'''''''''''

    “Show differences for recovered files”

:repo: :repo:`Recover.vim <chrisbra/Recover.vim>`
:config: :doc:`localcfg/plugin_Recover.vim`

::

    call dein#add('chrisbra/Recover.vim', {
        \ 'if': v:version >= 703,
    \ })

``Replay``
''''''''''

    “Record and replay your editing sessions”

:repo: :repo:`Replay <chrisbra/Replay>`
:config: :doc:`localcfg/plugin_Replay`

::

    call dein#add('chrisbra/Replay', {
        \ 'on_cmd': ['ListRecords', 'ScreenCapture', 'StartRecord'],
    \ })

``SaveSigns.vim``
'''''''''''''''''

    “Save signs across sessions”

:repo: :repo:`SaveSigns.vim <chrisbra/SaveSigns.vim>`

::

    call dein#add('chrisbra/SaveSigns.vim', {
        \ 'if': has('signs'),
        \ 'on_cmd': 'SaveSigns',
    \ })

.. _csv.vim-plugin:

``csv.vim``
'''''''''''

    “A filetype plugin for :abbr:`CSV (Comma-separated values)` files”

:repo: :repo:`csv.vim <chrisbra/csv.vim>`

Disturbingly cool editing for :abbr:`CSV (Comma-separated values)` files, ‘nuff
said.

::

    call dein#add('chrisbra/csv.vim', {
        \ 'hook_post_source': "call csv#Init(1, line('$'))",
        \ 'on_ft': 'csv',
    \ })

``unicode.vim``
'''''''''''''''

    “A plugin for handling unicode and digraphs characters”

:repo: :repo:`unicode.vim <chrisbra/unicode.vim>`
:config: :doc:`localcfg/plugin_unicode.vim`

Be like me and annoy your co-workers/friends by littering your mails with
Unicode.  It’s Really Exciting :kbd:`U+2122<C-x><C-z>`.

::

    call dein#add('chrisbra/unicode.vim', {
        \ 'hook_post_source': s:airline_enable('unicode'),
        \ 'if': v:version >= 704,
        \ 'on_cmd':
        \   ['DigraphNew', 'Digraphs']
        \   + s:prefix('Unicode', ['Name', 'Search', 'Table']),
        \ 'on_map': {
        \   'i': ['<C-x><C-z>', '<C-x><C-g>'],
        \   'n': '<Plug>(UnicodeGA)',
        \ },
    \ })

``vim_faq``
'''''''''''

    “The vim :abbr:`FAQ (Frequently Asked Questions)`\”

:repo: :repo:`vim_faq <chrisbra/vim_faq>`

::

    call dein#add('chrisbra/vim_faq', {
        \ 'if': v:version >= 600,
        \ 'lazy': v:true,
    \ })

``vim-capnp``
'''''''''''''

    “Syntax highlighting, folding and indentation rules for `Cap'n Proto`_”

:repo: :repo:`vim-capnp <cstrahan/vim-capnp>`

::

    call dein#add('cstrahan/vim-capnp', {
        \ 'lazy': v:false,
        \ 'on_ft': 'capnp',
    \ })

``jedi-vim``
''''''''''''

    “A VIM binding to the :pypi:`jedi` autocompletion library”

:repo: :repo:`jedi-vim <davidhalter/jedi-vim>`
:config: :doc:`localcfg/plugin_jedi_vim`

::

    call dein#add('davidhalter/jedi-vim', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': 'JediClearCache',
        \ 'on_ft': 'python',
    \ })

``vim-ditto``
'''''''''''''

    “Highlight overused words”

:repo: :repo:`vim-ditto <dbmrq/vim-ditto>`
:config: :doc:`localcfg/plugin_vim_ditto`

::

    call dein#add('dbmrq/vim-ditto', {
        \ 'on_cmd': ['DittoFile', 'DittoOn'],
    \ })

.. _ale-plugin:

``ale``
'''''''

    “Asynchronous Lint Engine”

:repo: :repo:`ale <dense-analysis/ale>`
:config: :doc:`localcfg/plugin_ale`

Start your mind boggling every time someone moans about having to switch from
WingIDE to a real editor when they edit files of different types.

::

    call dein#add('dense-analysis/ale', {
        \ 'if': v:version >= 800 && has('signs'),
    \ })

``vim-table-mode``
''''''''''''''''''

    “An awesome automatic table creator & formatter”

:repo: :repo:`vim-table-mode <dhruvasagar/vim-table-mode>`

::

    call dein#add('dhruvasagar/vim-table-mode', {
        \ 'on_cmd': s:prefix('Table', ['ModeToggle', 'ize']),
        \ 'on_ft': 'rst',
        \ 'on_map': '<LocalLeader>t',
    \ })

``bullets.vim``
'''''''''''''''

    “Automated Bullet Lists in Vim”

:repo: :repo:`bullets.vim <dkarter/bullets.vim>`

::

    call dein#add('dkarter/bullets.vim', {
        \ 'hook_post_source': 'let g:bullets_enabled_file_types += ["rst"]',
        \ 'on_ft': ['gitcommit', 'rst'],
    \ })

.. _editorconfig-plugin:

``editorconfig-vim``
''''''''''''''''''''

    “The EditorConfig_ plugin”

:repo: :repo:`editorconfig-vim <editorconfig/editorconfig-vim>`
:config: :doc:`localcfg/plugin_editorconfig_vim`

::

    call dein#add('editorconfig/editorconfig-vim', {
        \ 'if': has('pythonx'),
        \ 'on_event': 'InsertEnter',
        \ 'on_path': '.editorconfig',
    \ })

``vim-cute-python``
'''''''''''''''''''

    “Cute conceal support for Python”

:repo: :repo:`vim-cute-python <ehamberg/vim-cute-python>`

Make your Python code unreadable to people looking over your shoulder, by
decorating it with glyphs.

::

    call dein#add('ehamberg/vim-cute-python', {
        \ 'if': has('conceal') && v:version >= 703,
        \ 'lazy': v:false,
        \ 'on_ft': 'python',
        \ 'rev': 'moresymbols',
    \ })

.. tip::

    Be sure to try the ``moresymbols`` branch.  It makes a far larger visual
    change to editing Python files.

``visSum.vim``
''''''''''''''

    “Sum numbers that appear in selection”

:repo: :repo:`visSum.vim <elazar/visSum.vim>`

::

    call dein#add('elazar/visSum.vim', {
        \ 'on_map': {'x': '<LocalLeader>su'},
    \ })

``regex``
'''''''''

    “Allows you to test regular expressions”

:repo: :repo:`regex <ervandew/regex>`
:config: :doc:`localcfg/plugin_regex`

Removes the need to jump to your language’s :abbr:`REPL (Read-Eval-Print Loop)`
when writing ugly, ugly :abbr:`RegEx (Regular Expression)`.

::

    call dein#add('ervandew/regex', {
        \ 'on_cmd': 'Regex',
    \ })

``tabular``
'''''''''''

    “Configurable, flexible, intuitive text aligning”

:repo: :repo:`tabular <godlygeek/tabular>`

Fancy text alignment tricks are only seconds away.

This is the one plugin you use to make people who use lesser environments
jealous.

::

    call dein#add('godlygeek/tabular', {
        \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
    \ })

``vim-searchindex``
'''''''''''''''''''

    “Display current & total number of search matches”

:repo: :repo:`vim-searchindex <google/vim-searchindex>`

::

    if !has('patch-8.1.1270')
        call dein#add('google/vim-searchindex', {
            \ 'on_map': {'n': ['/', '?', 'n', 'N']},
        \ })
    endif

.. note::

    This is guarded with ``has()`` because recent releases support
    this functionality `out of the box <matchpos>`_.

``xterm-color-table.vim``
'''''''''''''''''''''''''

    “All 256 :command:`xterm` colours with their RGB equivalents”

:repo: :repo:`xterm-color-table.vim <guns/xterm-color-table.vim>`

::

    call dein#add('guns/xterm-color-table.vim', {
        \ 'on_cmd': s:suffix('XtermColorTable', ['', 'V']),
    \ })

``dein-command.vim``
''''''''''''''''''''

    “Utility commands for ``dein.vim``”

:repo: :repo:`dein-command.vim <haya14busa/dein-command.vim>`

::

    call dein#add('haya14busa/dein-command.vim', {
        \ 'on_cmd': 'Dein',
    \ })

``vim-hjson``
'''''''''''''

    “Hjson_ syntax support“

:repo: :repo:`vim-hjson <hjson/vim-hjson>`

::

    call dein#add('hjson/vim-hjson', {
        \ 'lazy': v:false,
        \ 'on_ft': 'hjson',
    \ })

``vim-snippets``
''''''''''''''''

    “Snippet files for various programming languages”

:repo: :repo:`vim-snippets <honza/vim-snippets>`
:config: :doc:`localcfg/plugin_vim_snippets`

::

    call dein#add('honza/vim-snippets', {
        \ 'if': has('pythonx') && v:version >= 704,
        \ 'on_event': 'InsertEnter',
    \ })

.. include:: .includes/lazy_rdep.rst

``vim-omnipytent``
''''''''''''''''''

    “All powerful Pythonic task runner”

:repo: :repo:`vim-omnipytent <idanarye/vim-omnipytent>`
:config: :doc:`localcfg/plugin_vim_omnipytent`

::

    call dein#add('idanarye/vim-omnipytent', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': s:prefix('OP', ['edit', '2edit', '3edit']),
    \ })

``vim-vebugger``
''''''''''''''''

    “Yet another debugger frontend plugin”

:repo: :repo:`vim-vebugger <idanarye/vim-vebugger>`
:config: :doc:`localcfg/plugin_vim_vebugger`

::

    call dein#add('idanarye/vim-vebugger', {
        \ 'depends': 'vimproc',
        \ 'on_cmd': ['VBGstartGDB', 'VBGstartLLDB', 'VBGstartPDB3'],
        \ 'on_func': 'vebugger',
    \ })

``vim-yankitute``
'''''''''''''''''

    “:abbr:`RegEx (Regular Expression)` powered yank and substitute”

:repo: :repo:`vim-yankitute <idanarye/vim-yankitute>`

::

    call dein#add('idanarye/vim-yankitute', {
        \ 'on_cmd': 'Yankitute',
    \ })

``vim-cursorword``
''''''''''''''''''

    “Underline the word under the cursor”

:repo: :repo:`vim-cursorword <itchyny/vim-cursorword>`

::

    call dein#add('itchyny/vim-cursorword')

``vim-gnupg``
'''''''''''''

    “Transparent editing of gpg_ encrypted files”

:repo: :repo:`vim-gnupg <jamessan/vim-gnupg>`

::

    call dein#add('jamessan/vim-gnupg', {
        \ 'if': s:has_exec('gpg') || s:has_exec('gpg2'),
    \ })

``vim-textobj-css``
'''''''''''''''''''

    “Text objects for working with :abbr:`CSS (Cascading Style Sheets)`”

:repo: :repo:`vim-textobj-css <jasonlong/vim-textobj-css>`

::

    call dein#add('jasonlong/vim-textobj-css', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_ft': ['css', 'html'],
    \ })

``semantic-highlight.vim``
''''''''''''''''''''''''''

    “Where every variable is a different color, an idea popularized by
    `Evan Brooks`_ blog post.

:repo: :repo:`semantic-highlight.vim <jaxbot/semantic-highlight.vim>`
:config: :doc:`localcfg/plugin_semantic_highlight.vim`

::

    call dein#add('jaxbot/semantic-highlight.vim', {
        \ 'on_cmd': 'SemanticHighlight',
    \ })

``vim-editqf``
''''''''''''''

    “Edit and store quickfix/location list entries”

:repo: :repo:`vim-editqf <jceb/vim-editqf>`
:config: :doc:`localcfg/plugin_vim_editqf`

Save all the window hopping key bashes and fix all those compiler warnings
directly.

::

    call dein#add('jceb/vim-editqf', {
        \ 'if': has('quickfix'),
        \ 'on_cmd':
        \   s:prefix('Loc', ['AddNote', 'Load', 'Save'])
        \   + s:prefix('QF', ['AddNote', 'Load', 'Save']),
        \ 'on_map': {'n': '<LocalLeader>n'},
    \ })

``vim-orgmode``
'''''''''''''''

    “Text outlining and task management for Vim based on Emacs’ `Org-Mode`_\”

:repo: :repo:`vim-orgmode <jceb/vim-orgmode>`
:config: :doc:`localcfg/plugin_vim_orgmode`

::

    call dein#add('jceb/vim-orgmode', {
        \ 'depends': ['NrrwRgn', 'SyntaxRange', 'calendar-vim', 'vim-repeat',
        \             'vim-speeddating'],
        \ 'on_ft': 'org',
    \ })

.. note::

    This is artificially set to lazy load, because of the interaction with the
    ``NrrwRgn`` hooks which would otherwise raise an error.

``vimagit``
'''''''''''

    “Ease your :command:`git` workflow”

:repo: :repo:`vimagit <jreybert/vimagit>`

::

    call dein#add('jreybert/vimagit', {
        \ 'hook_post_source': s:airline_enable('vimagit'),
        \ 'if': s:has_exec('git'),
        \ 'on_cmd': 'Magit',
    \ })

``fzf``
'''''''

    “Basic :command:`fzf` integration”

:repo: :repo:`fzf <junegunn/fzf>`
:config: :doc:`localcfg/plugin_fzf`

::

    call dein#add('junegunn/fzf', {
        \ 'if': s:has_exec('fzf'),
        \ 'on_cmd': 'FZF',
        \ 'on_func': 'fzf#run',
    \ })

``fzf.vim``
'''''''''''

    “Advanced :command:`fzf` integration”

:repo: :repo:`fzf.vim <junegunn/fzf.vim>`
:config: :doc:`localcfg/plugin_fzf.vim`

::

    call dein#add('junegunn/fzf.vim', {
        \ 'depends': 'fzf',
        \ 'if': s:has_exec('fzf'),
        \ 'on_cmd': s:prefix(
        \   'FZF',
        \   ['Ag', 'Buffers', 'Colors', 'Commands', 'Files', 'GFiles',
        \    'History', 'Lines', 'Maps', 'Marks', 'Snippets', 'Windows']),
    \ })

.. note::

    This doesn’t list *all* the possible commands, just the ones I’d use enough
    to want to tab complete on.

``goyo.vim``
''''''''''''

    “Distraction-free writing in Vim.”

:repo: :repo:`goyo.vim <junegunn/goyo.vim>`
:config: :doc:`localcfg/plugin_goyo.vim`

::

    call dein#add('junegunn/goyo.vim', {
        \ 'on_cmd': 'Goyo',
    \ })

``vim-emoji``
'''''''''''''

    “Emoji support”

:repo: :repo:`vim-emoji <junegunn/vim-emoji>`

::

    call dein#add('junegunn/vim-emoji', {
        \ 'lazy': v:false,
        \ 'on_func': 'emoji',
    \ })

``patchreview-vim``
'''''''''''''''''''

    “Single, multi-patch or diff code reviews”

:repo: :repo:`patchreview-vim <junkblocker/patchreview-vim>`
:config: :doc:`localcfg/plugin_patchreview_vim`

::

    call dein#add('junkblocker/patchreview-vim', {
        \ 'on_cmd': s:suffix('Review',
        \                    ['Diff', 'Patch', 'ReversePatchReview']),
    \ })

``vim-eighties``
''''''''''''''''

    “Automatically resizes your windows”

:repo: :repo:`vim-eighties <justincampbell/vim-eighties>`
:config: :doc:`localcfg/plugin_vim_eighties`

::

    call dein#add('justincampbell/vim-eighties', {
        \ 'on_cmd': s:prefix('Eighties', ['Disable', 'Enable']),
    \ })

``vim-sneak``
'''''''''''''

    “Motion improved”

:repo: :repo:`vim-sneak <justinmk/vim-sneak>`
:config: :doc:`localcfg/plugin_vim_sneak`

::

    call dein#add('justinmk/vim-sneak', {
        \ 'depends': 'vim-repeat',
        \ 'if': v:version >= 703,
        \ 'on_map': {
        \   'n': ['S', 's'],
        \   'o': ['Z', 'z'],
        \   'x': ['Z', 's'],
        \ },
    \ })

``vim-coiled-snake``
''''''''''''''''''''

    “Enhanced Python folding”

:repo: :repo:`vim-coiled-snake <kalekundert/vim-coiled-snake>`
:config: :doc:`localcfg/plugin_vim_coiled_snake`

::

    call dein#add('kalekundert/vim-coiled-snake', {
        \ 'if': has('folding'),
        \ 'lazy': v:false,
        \ 'on_ft': 'python',
    \ })

``vim-textobj-fold``
''''''''''''''''''''

    “Text objects for folds”

:repo: :repo:`vim-textobj-fold <kana/vim-textobj-fold>`

::

    call dein#add('kana/vim-textobj-fold', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_func': 'textobj',
    \ })

``vim-textobj-user``
''''''''''''''''''''

    “Create your own text objects”

:repo: :repo:`vim-textobj-user <kana/vim-textobj-user>`

::

    call dein#add('kana/vim-textobj-user', {
        \ 'on_func': 'textobj',
    \ })

``nyancat-vim``
---------------

:repo: :repo:`nyancat-vim <koron/nyancat-vim>`

:wikipedia:`nyancat`. bah, grow up!

::

    call dein#add('koron/nyancat-vim', {
        \ 'on_cmd': s:prefix('Nyancat', ['', '2']),
    \ })

``vim-signature``
'''''''''''''''''

    “A plugin to place, toggle and display marks”

:repo: :repo:`vim-signature <kshenoy/vim-signature>`
:config: :doc:`localcfg/plugin_vim_signature`

::

    call dein#add('kshenoy/vim-signature', {
        \ 'if': has('signs'),
    \ })

``moonscript-vim``
''''''''''''''''''

    “Language support for moonscript”

:repo: :repo:`moonscript-vim <leafo/moonscript-vim>`

::

    call dein#add('leafo/moonscript-vim', {
        \ 'lazy': v:false,
        \ 'on_ft': 'moon',
    \ })

.. _ledger-plugin:

``vim-ledger``
''''''''''''''

    “Language support for ledger_”

:repo: :repo:`vim-ledger <ledger/vim-ledger>`
:config: :doc:`localcfg/plugin_vim_ledger`

Combine this with :ref:`csv.vim <csv.vim-plugin>`, and it makes importing and
editing your accounts/expenses an almost nice-ish experience.

::

    call dein#add('ledger/vim-ledger', {
        \ 'lazy': v:false,
        \ 'on_ft': 'ledger',
    \ })

``rainbow``
'''''''''''

    “Help read complex code by showing parentheses in different colours”

:repo: :repo:`rainbow <luochen1990/rainbow>`
:config: :doc:`localcfg/plugin_rainbow`

Make your ``vim`` sessions feel like they have been painted by a three year old
trying to impress their grandpa.  Which is a Good Thing™.

::

    call dein#add('luochen1990/rainbow')

.. _localcfg-config:

``localcfg``
''''''''''''

    “Help for customising based on features”

:repo: :repo:`localcfg <magus/localcfg>`
:config: :doc:`vimrc.d/localcfg`

::

    call dein#add('magus/localcfg')

``calendar-vim``
''''''''''''''''

    “A calendar window you can use within :command:`vim`\”

:repo: :repo:`calendar-vim <mattn/calendar-vim>`
:config: :doc:`localcfg/plugin_calendar_vim`

::

    call dein#add('mattn/calendar-vim', {
        \ 'on_cmd': s:suffix('Calendar', ['', 'H', 'T', 'VR']),
        \ 'on_map': {'n': '[calendar]'},
    \ })

``emmet-vim``
'''''''''''''

    “Plugins for :abbr:`HTML (HyperText Markup Language)` and :abbr:`CSS
    (Cascading Style Sheets)` hi-speed coding”

:repo: :repo:`emmet-vim <mattn/emmet-vim>`
:config: :doc:`localcfg/plugin_emmet_vim`

::

    call dein#add('mattn/emmet-vim', {
        \ 'if': v:version >= 700,
        \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ })

``undotree``
''''''''''''

    “Display your undo history in a graph”

:repo: :repo:`undotree <mbbill/undotree>`
:config: :doc:`localcfg/plugin_undotree`

::

    call dein#add('mbbill/undotree', {
        \ 'if': v:version >= 700,
        \ 'on_cmd': 'UndotreeToggle',
    \ })

``vim-cuesheet``
''''''''''''''''

    “Syntax highlighting of `cue sheet`_\”

:repo: :repo:`vim-cuesheet <mgrabovsky/vim-cuesheet>`

::

    call dein#add('mgrabovsky/vim-cuesheet', {
        \ 'lazy': v:false,
        \ 'on_ft': 'cuesheet',
    \ })

``vim-startify``
''''''''''''''''

    “The fancy start screen”

:repo: :repo:`vim-startify <mhinz/vim-startify>`
:config: :doc:`localcfg/plugin_vim_startify`

::

    call dein#add('mhinz/vim-startify')

``vim-indent-object``
'''''''''''''''''''''

    “Text objects based on indent levels”

:repo: :repo:`vim-indent-object <michaeljsmith/vim-indent-object>`

Makes handling Python code far, far easier.

::

    call dein#add('michaeljsmith/vim-indent-object', {
        \ 'on_ft': ['ledger', 'moon', 'nim', 'python'],
        \ 'on_map': {'ov': ['aI', 'ai', 'iI', 'ii']},
    \ })

``vim-bufmru``
''''''''''''''

    “Order buffers in Most Recently Used order”

:repo: :repo:`vim-bufmru <mildred/vim-bufmru>`
:config: :doc:`localcfg/plugin_vim_bufmru`

::

    call dein#add('mildred/vim-bufmru', {
        \ 'on_cmd': 'BufMRU',
        \ 'on_map': {'n': '[bufmru]'},
    \ })

``vim-jinja``
'''''''''''''

    “Language support for :pypi:`jinja`\”

:repo: :repo:`vim-jinja <mitsuhiko/vim-jinja>`
:config: :doc:`localcfg/plugin_vim_jinja`

::

    call dein#add('mitsuhiko/vim-jinja', {
        \ 'on_ft': 'jinja',
    \ })

``vim-bbye``
''''''''''''

    “Delete buffers without breaking your layout”

:repo: :repo:`vim-bbye <moll/vim-bbye>`
:config: :doc:`localcfg/plugin_vim_bbye`

::

    call dein#add('moll/vim-bbye', {
        \ 'on_cmd': ['Bdelete', 'Bwipeout'],
        \ 'on_map': {'n': '<LocalLeader>q'},
    \ })

``vim-indent-guides``
'''''''''''''''''''''

    “A plugin for visually displaying indent levels”

:repo: :repo:`vim-indent-guides <nathanaelkane/vim-indent-guides>`
:config: :doc:`localcfg/plugin_vim_indent_guides`

::

    call dein#add('nathanaelkane/vim-indent-guides')

``vim-beancount``
'''''''''''''''''

    “Filetype plugin for :pypi:`beancount` files”

:repo: :repo:`vim-beancount <nathangrigg/vim-beancount>`

::

    call dein#add('nathangrigg/vim-beancount', {
        \ 'lazy': v:false,
        \ 'on_ft': 'beancount',
    \ })

``vim-clevertab``
'''''''''''''''''

    “Tiny replacement for Supertab”

:repo: :repo:`vim-clevertab <neitanod/vim-clevertab>`
:config: :doc:`localcfg/plugin_vim_clevertab`

Makes you feel more like a smart :abbr:`IDE (Integrated Developer Environment)`
user, how cool is that?

::

    call dein#add('neitanod/vim-clevertab')

``vim_bridge``
''''''''''''''

    “Allow transparent calls to Python functions in native Vim scripts”

:repo: :repo:`vim_bridge <nvie/vim_bridge>`

::

    call dein#add('nvie/vim_bridge', {
        \ 'lazy': v:false,
        \ 'on_cmd': 'python',
    \ })

``html5.vim``
'''''''''''''

    “:abbr:`HTML (HyperText Markup Language)`\5 + inline :abbr:`SVG (Scalable
    Vector Graphics)` omnicomplete function, indent and syntax”

:repo: :repo:`html5.vim <othree/html5.vim>`

::

    call dein#add('othree/html5.vim', {
        \ 'lazy': v:false,
        \ 'on_ft': 'html',
    \ })

``vim-textobj-quote``
'''''''''''''''''''''

    “Better support for typographic (‘curly’) quote characters”

:repo: :repo:`vim-textobj-quote <reedes/vim-textobj-quote>`
:config: :doc:`localcfg/plugin_vim_textobj_quote`

::

    call dein#add('reedes/vim-textobj-quote', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_cmd': 'ToggleEducate',
        \ 'on_ft': ['gitcommit', 'mail', 'rst', 'text'],
    \ })

``vim-qlist``
'''''''''''''

    “Make working with the quickfix list/window smoother”

:repo: :repo:`vim-qlist <romainl/vim-qlist>`

::

    call dein#add('romainl/vim-qlist', {
        \ 'if': has('quickfix'),
        \ 'on_cmd': s:suffix('list', ['D', 'I']),
        \ 'on_map': {'n': ['[D', ']D', 'I', ']I']},
    \ })

``committia.vim``
'''''''''''''''''

    “More pleasant editing on commit message”

:repo: :repo:`committia.vim <rhysd/committia.vim>`
:config: :doc:`localcfg/plugin_committia.vim`

::

    call dein#add('rhysd/committia.vim', {
        \ 'if': s:has_exec('git'),
    \ })

``git-messenger.vim``
'''''''''''''''''''''

    “Reveal the hidden message by :command:`git` under the cursor quickly”

:repo: :repo:`git-messenger.vim <rhysd/git-messenger.vim>`
:config: :doc:`localcfg/plugin_git_messenger.vim`

::

    call dein#add('rhysd/git-messenger.vim', {
        \ 'if': s:has_exec('git'),
        \ 'on_cmd': 'GitMessenger',
        \ 'on_map': {'n': '[messenger]'},
    \ })

``vim-radon``
'''''''''''''

    “Show cyclomatic complexity of Python code”

:repo: :repo:`vim-radon <rubik/vim-radon>`

::

    call dein#add('rubik/vim-radon', {
        \ 'if': has('signs') && has('pythonx'),
        \ 'lazy': v:false,
        \ 'on_cmd': 'Radon',
        \ 'on_ft': 'python',
    \ })

.. note::

    There is no radon_ check here, because it doesn’t actually use
    :command:`radon`.

``gundo.vim``
'''''''''''''

    “Graph your undo tree”

:repo: :repo:`gundo.vim <sjl/gundo.vim>`
:config: :doc:`localcfg/plugin_gundo.vim`

Finally grasp the :command:`vim` ``undo-tree``, without this the feature can be
really daunting to wrap your head around.

::

    call dein#add('sjl/gundo.vim', {
        \ 'if': has('pythonx') && v:version >= 703,
        \ 'on_cmd': 'GundoToggle',
    \ })

``splice.vim``
''''''''''''''

    “Plugin for resolving conflicts during three-way merges”

:repo: :repo:`splice.vim <sjl/splice.vim>`

::

    call dein#add('sjl/splice.vim', {
        \ 'on_cmd': 'SpliceInit',
    \ })

``vim-space``
'''''''''''''

    “Smart space key”

:repo: :repo:`vim-space <spiiph/vim-space>`
:config: :doc:`localcfg/plugin_vim_space`

::

    call dein#add('spiiph/vim-space', {
        \ 'on_map': {'n': '<space>'},
    \ })

``vim-vimlint``
'''''''''''''''

    “Linter for :command:`vim` script”

:repo: :repo:`vim-vimlint <syngan/vim-vimlint>`

::

    call dein#add('syngan/vim-vimlint', {
        \ 'depends': 'vim-vimlparser',
        \ 'lazy': v:false,
        \ 'on_cmd': 'VimLint',
        \ 'on_ft': 'vim',
    \ })

``vim-maximizer``
'''''''''''''''''

    “Maximizes and restores the current window”

:repo: :repo:`vim-maximizer <szw/vim-maximizer>`
:config: :doc:`localcfg/plugin_vim_maximizer`

::

    call dein#add('szw/vim-maximizer', {
        \ 'on_cmd': 'MaximizerToggle',
        \ 'on_map': {'n': '<C-w>o'},
    \ })

``vim-quick-radon``
'''''''''''''''''''

    “Applies radon_ to your current file”

:repo: :repo:`vim-quick-radon <tell-k/vim-quick-radon>`
:config: :doc:`localcfg/plugin_vim_quick_radon`

::

    call dein#add('tell-k/vim-quick-radon', {
        \ 'if': s:has_exec('radon'),
        \ 'lazy': v:false,
        \ 'on_cmd': 'QuickRadon',
    \ })

``vim-expand-region``
'''''''''''''''''''''

    “Incremental visual selection”

:repo: :repo:`vim-expand-region <terryma/vim-expand-region>`

::

    call dein#add('terryma/vim-expand-region', {
        \ 'on_map': {'nv': ['+', '-']},
    \ })

``vim-multiple-cursors``
''''''''''''''''''''''''

    “True Sublime Text multiple selection”

:repo: :repo:`vim-multiple-cursors <terryma/vim-multiple-cursors>`

::

    call dein#add('terryma/vim-multiple-cursors', {
        \ 'on_map': '<C-n>',
    \ })

``wordnet.vim``
'''''''''''''''

    “Look up word definitions with wordnet_”

:repo: :repo:`wordnet.vim <timcharper/wordnet.vim>`
:config: :doc:`localcfg/plugin_wordnet.vim`

::

    call dein#add('timcharper/wordnet.vim', {
        \ 'if': s:has_exec('wn'),
        \ 'on_map': '<Leader>wn',
    \ })

``molokai``
'''''''''''

    “Vim port of the monokai theme for TextMate”

:repo: :repo:`molokai <tomasr/molokai>`
:config: :doc:`localcfg/plugin_molokai`

::

    call dein#add('tomasr/molokai')

``vim-exchange``
''''''''''''''''

    “Easy text exchange operator”

:repo: :repo:`vim-exchange <tommcdo/vim-exchange>`
:config: :doc:`localcfg/plugin_vim_exchange`

::

    call dein#add('tommcdo/vim-exchange', {
        \ 'on_map': {
        \   'n': 'cx',
        \   'v': 'X',
        \ },
    \ })

``vim-lion``
''''''''''''

    “Defines a code alignment operator”

:repo: :repo:`vim-lion <tommcdo/vim-lion>`

::

    call dein#add('tommcdo/vim-lion', {
        \ 'on_map': {'n': ['gl', 'gL']},
    \ })

``vim-abolish``
'''''''''''''''

    “Language friendly searches, substitutions, and abbreviations”

:repo: :repo:`vim-abolish <tpope/vim-abolish>`

::

    call dein#add('tpope/vim-abolish', {
        \ 'on_cmd': ['Abolish', 'S'],
        \ 'on_map': {'n': 'cr'},
    \ })

``vim-commentary``
''''''''''''''''''

    “Comment stuff out”

:repo: :repo:`vim-commentary <tpope/vim-commentary>`

Comment out those abusive remarks you wrote about a vim plugin with the simple
power of ``gcc``.

::

    call dein#add('tpope/vim-commentary', {
        \ 'on_cmd': 'Commentary',
        \ 'on_map': 'gc',
    \ })

``vim-endwise``
'''''''''''''''

    “Automatically insert block closing structures”

:repo: :repo:`vim-endwise <tpope/vim-endwise>`

::

    call dein#add('tpope/vim-endwise', {
        \ 'on_event': 'InsertEnter',
    \ })

``vim-fugitive``
''''''''''''''''

    “A Git wrapper so awesome, it should be illegal”

:repo: :repo:`vim-fugitive <tpope/vim-fugitive>`
:config: :doc:`localcfg/plugin_vim_fugitive`

Replace most of your use of a shell when working on a project with just another
:command:`vim` buffer.

::

    call dein#add('tpope/vim-fugitive', {
        \ 'if': s:has_exec('git'),
    \ })

``vim-jdaddy``
''''''''''''''

    “:abbr:`JSON (JavaScript Object Notation)` manipulation and pretty printing”

:repo: :repo:`vim-jdaddy <tpope/vim-jdaddy>`

::

    call dein#add('tpope/vim-jdaddy', {
        \ 'on_ft': 'json',
    \ })

``vim-obsession``
'''''''''''''''''

    “Continuously updated session files”

:repo: :repo:`vim-obsession <tpope/vim-obsession>`

::

    call dein#add('tpope/vim-obsession', {
        \ 'hook_post_source': s:airline_enable('obsession'),
        \ 'on_cmd': 'Obsession',
    \ })

``vim-projectionist``
'''''''''''''''''''''

    “Project configuration”

:repo: :repo:`vim-projectionist <tpope/vim-projectionist>`
:config: :doc:`localcfg/plugin_vim_projectionist`

::

    call dein#add('tpope/vim-projectionist')

``vim-repeat``
''''''''''''''

    “Repeat for plugin maps”

:repo: :repo:`vim-repeat <tpope/vim-repeat>`

Make :kbd:`.` work how you think it works… once someone has hacked in support to
your favourite plugin anyway.

::

    call dein#add('tpope/vim-repeat')

``vim-rhubarb``
'''''''''''''''

    “If fugitive.vim is the Git, rhubarb.vim is the Hub”

:repo: :repo:`vim-rhubarb <tpope/vim-rhubarb>`
:config: :doc:`localcfg/plugin_vim_rhubarb`

::

    call dein#add('tpope/vim-rhubarb', {
        \ 'depends': 'vim-fugitive',
        \ 'if': s:has_exec('git'),
    \ })

``vim-rsi``
'''''''''''

    “Readline style insertion”

:repo: :repo:`vim-rsi <tpope/vim-rsi>`

::

    call dein#add('tpope/vim-rsi', {
        \ 'on_event': ['CmdlineEnter', 'InsertEnter'],
    \ })

``vim-sensible``
''''''''''''''''

    “One step above ``nocompatible`` mode”

:repo: :repo:`vim-sensible <tpope/vim-sensible>`

Sane defaults for :command:`vim`, tracking this repo might make your
:command:`vim` experience a little more comfortable.

::

    call dein#add('tpope/vim-sensible', {
        \ 'rev': 'v1.2',
    \ })

.. note::

    This is pinned as it can massively affect functionality, see
    tpope/vim-sensible@2c57c5f4 for an example.

``vim-sleuth``
''''''''''''''

    “Heuristically set buffer options”

:repo: :repo:`vim-sleuth <tpope/vim-sleuth>`

Automagic indentation configuration, that just works.

::

    call dein#add('tpope/vim-sleuth', {
        \ 'on_cmd': 'Sleuth',
    \ })

``vim-speeddating``
'''''''''''''''''''

    “Increment dates, times, and more”

:repo: :repo:`vim-speeddating <tpope/vim-speeddating>`
:config: :doc:`localcfg/plugin_vim_speeddating`

Speed up those ``y`` and ``p`` based :ref:`ledger <ledger-plugin>` entry writing
sessions by at least fifteen orders of magnitude… or your money back.

::

    call dein#add('tpope/vim-speeddating', {
        \ 'depends': 'vim-repeat',
        \ 'on_map': {'n': ['<C-a>', '<C-x>']},
    \ })

``vim-surround``
''''''''''''''''

    “Plugin for deleting, changing, and adding ‘surroundings’”

:repo: :repo:`vim-surround <tpope/vim-surround>`

Make using :command:`ls -1` to produce the headings for your own :command:`vim`
documentation a relatively painless task.

::

    call dein#add('tpope/vim-surround', {
        \ 'depends': 'vim-repeat',
        \ 'on_map': {
        \   'i': ['<C-g>S', '<C-g>s', '<C-s>'],
        \   'n': ['cS', 'cs', 'ds', 'yS', 'ys'],
        \   'x': 'S',
        \ },
    \ })

``vim-unimpaired``
''''''''''''''''''

    “Pairs of handy mappings”

:repo: :repo:`vim-unimpaired <tpope/vim-unimpaired>`
:config: :doc:`localcfg/plugin_vim_unimpaired`

::

    call dein#add('tpope/vim-unimpaired')

``braceless.vim``
'''''''''''''''''

    “Text objects, folding, and more for Python and other indented languages”

:repo: :repo:`tweekmonster/braceless.vim`

::

    call dein#add('tweekmonster/braceless.vim', {
        \ 'on_cmd': 'BracelessEnable',
        \ 'on_ft': ['nim', 'python', 'yaml'],
    \ })

``startuptime.vim``
'''''''''''''''''''

    “1ms could mean the difference between life and death”

:repo: :repo:`startuptime.vim <tweekmonster/startuptime.vim>`

::

    call dein#add('tweekmonster/startuptime.vim', {
        \ 'on_cmd': 'StartupTime',
    \ })

``vim-airline``
'''''''''''''''

    “Lean & mean status/tabline for :command:`vim` that’s light as air”

:repo: :repo:`vim-airline <vim-airline/vim-airline>`
:config: :doc:`localcfg/plugin_vim_airline`

The main reason to use this is not “simply because it is pretty”, but mostly
because you can dump heaps and heaps of custom code you've written in your
:file:`.vimrc` and replace it with a heap of code that is far better maintained.

::

    call dein#add('vim-airline/vim-airline', {
        \ 'depends': [
        \   'vim-airline-themes',
        \   'vim-fugitive',
        \ ],
    \ })

``vim-airline-themes``
''''''''''''''''''''''

    “Official theme repository for vim-airline”

:repo: :repo:`vim-airline-themes <vim-airline/vim-airline-themes>`

::

    call dein#add('vim-airline/vim-airline-themes')

``vim-line``
''''''''''''

    “‘inner line’ text object”

:repo: :repo:`vim-line <vim-utils/vim-line>`

::

    call dein#add('vim-utils/vim-line', {
        \ 'on_map': {'ov': '_'},
    \ })

``vim-man``
'''''''''''

    “Enhanced :command:`man` support”

:repo: :repo:`vim-man <vim-utils/vim-man>`

::

    call dein#add('vim-utils/vim-man', {
        \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
    \ })

``vim-vertical-move``
'''''''''''''''''''''

    “Motions to move a cursor without changing the column”

:repo: :repo:`vim-vertical-move <vim-utils/vim-vertical-move>`

::

    call dein#add('vim-utils/vim-vertical-move', {
        \ 'on_map': ['[v', ']v'],
    \ })

``targets.vim``
'''''''''''''''

    “Provides additional text objects”

:repo: :repo:`targets.vim <wellle/targets.vim>`

::

    call dein#add('wellle/targets.vim')

``vim-misc``
''''''''''''

    “Miscellaneous auto-load Vim scripts”

:repo: :repo:`vim-misc <xolox/vim-misc>`

::

    call dein#add('xolox/vim-misc', {
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

.. include:: .includes/lazy_rdep.rst

``vim-notes``
'''''''''''''

    “Easy note taking in Vim”

:repo: :repo:`vim-notes <xolox/vim-notes>`
:config: :doc:`localcfg/plugin_vim_notes`

::

    call dein#add('xolox/vim-notes', {
        \ 'depends': 'vim-misc',
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

``nim.vim``
'''''''''''

    “Nim language support”

:repo: :repo:`nim.vim <zah/nim.vim>`

::

    call dein#add('zah/nim.vim', {
        \ 'if': s:has_exec('nim'),
        \ 'lazy': v:false,
        \ 'on_ft': 'nim',
    \ })

``vim-vimlparser``
''''''''''''''''''

    “Vimscript parser”

:repo: :repo:`vim-vimlparser <ynkdir/vim-vimlparser>`

::

    call dein#add('ynkdir/vim-vimlparser', {
        \ 'on_cmd': 'VimLint',
        \ 'on_ft': 'vim',
    \ })

.. include:: .includes/lazy_rdep.rst

vim-scripts mirrors
-------------------

``DotOutlineTree``
''''''''''''''''''

    “An outline tree of a buffer”

:repo: :repo:`DotOutlineTree <vim-scripts/DotOutlineTree>`

I write my mail in reST_.  No, really.

::

    call dein#add('vim-scripts/DotOutlineTree', {
        \ 'on_ft': ['mail', 'rst'],
    \ })

.. _SyntaxRange-plugin:

``SyntaxRange``
'''''''''''''''

    “Set up regions within a buffer using their own filetypes”

:repo: :repo:`SyntaxRange <vim-scripts/SyntaxRange>`

::

    call dein#add('vim-scripts/SyntaxRange', {
        \ 'on_cmd': s:prefix('Syntax', ['Ignore', 'Include']),
    \ })

``TaQua``
'''''''''

    “Colour scheme to fit the light/baby/soft colours of the aqua stuff”

:repo: :repo:`TaQua <vim-scripts/TaQua>`

::

    call dein#add('vim-scripts/TaQua')

``bnf.vim``
'''''''''''

    “Highlight :abbr:`BNF (Backus–Naur form)`\s”

:repo: :repo:`bnf.vim <vim-scripts/bnf.vim>`

::

    call dein#add('vim-scripts/bnf.vim', {
        \ 'lazy': v:false,
        \ 'on_ft': 'bnf',
    \ })

``ebnf.vim``
''''''''''''

    “Extended :abbr:`BNF (Backus–Naur form)` (:abbr:`ISO (International
    Organization for Standardization)`/:abbr:`IEC (International
    Electrotechnical Commission)` 14977) Syntax”

:repo: :repo:`ebnf.vim <vim-scripts/ebnf.vim>`

::

    call dein#add('vim-scripts/ebnf.vim', {
        \ 'lazy': v:false,
        \ 'on_ft': 'ebnf',
    \ })

``summerfruit256.vim``
''''''''''''''''''''''

    “88/256 colour version of Armin Ronacher's summerfruit colour scheme”

:repo: :repo:`summerfruit256.vim <vim-scripts/summerfruit256.vim>`

::

    call dein#add('vim-scripts/summerfruit256.vim')

``uri-ref``
'''''''''''

    “Painless footer references”

:repo: :repo:`uri-ref <vim-scripts/uri-ref>`

::

    call dein#add('vim-scripts/uri-ref', {
        \ 'on_ft': 'mail',
    \ })

Nasty bundled packages
----------------------

These packages are being removed, either by finding a usable remote location or
by deletion.

::

    call dein#local('~/.vim/internal/', {
        \ 'on_cmd': 'Snip',
    \ })

.. rubric:: Footnotes

.. [#] ``:Exconfig`` is a mapping defined in :file:`.projections.json` and
       supported via :repo:`projectionist <tpope/vim-projectionist>`.
.. [#] I tend to ignore plugins that aren’t available in this manner, because
       the effort required to manage them otherwise exceeds their usefulness.

.. _github: https://github.com/
.. _dwm: https://dwm.suckless.org/
.. _Cap'n Proto: https://capnproto.org/
.. _EditorConfig: http://editorconfig.org/
.. _Hjson: https://hjson.org/
.. _gpg: https://www.gnupg.org/
.. _Evan Brooks: https://medium.com/@evnbr/coding-in-color-3a6db2743a1e
.. _org-mode: http://orgmode.org/
.. _ledger: https://www.ledger-cli.org/
.. _cue sheet: https://en.wikipedia.org/wiki/Cue_sheet_(computing)
.. _radon: https://radon.readthedocs.io/
.. _wordnet: http://wordnet.princeton.edu/
.. _reST: http://docutils.sourceforge.net/rst.html
