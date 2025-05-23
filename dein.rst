``dein.vim`` - ``dein.vim`` plugins configuration
=================================================

These are all hosted on GitHub_ [#]_.  You should try at least a few of them,
they may make your life far simpler!

.. include:: .includes/vim9script.rst

.. include:: .includes/scriptencoding.rst

.. attention::

    I record requirements even when they’re clearly met because I like to know
    what *may* break if I make changes.  For example, version checks for cases
    where :repo:`dein.vim <Shougo/dein.vim>` wouldn't work anyway or using
    ``has('patch-x.x.x')`` for versions prior to 7.4.237.

.. note::

    In places where I could use a prefix, in `on_cmd setup
    <sideways.vim-config>`_ for example, I’ll often not do so because I prefer
    to have tab completion available for the commands that I use from the
    outset.

.. seealso::

    * :doc:`autoloaded functions <autoload/plugins/dein>` used in this file

Repositories
------------

``dein.vim``
''''''''''''

    “A dark powered Vim/Neovim plugin manager”

:repository: :repo:`Shougo/dein.vim`
:config: :doc:`vimrc.d/dein`
:functions: :doc:`autoload/plugins/dein`

::

    dein#add(expand('~/.vim/external/dein.vim'), {
        if: v:version >= 802,
    })

.. _sideways.vim-config:

``sideways.vim``
''''''''''''''''

    “Move an item in a delimiter-separated list left or right”

:repository: :repo:`AndrewRadev/sideways.vim`
:early setup: :ref:`maps <sideways-vim-custom-maps>`

::

    dein#add('AndrewRadev/sideways.vim', {
        on_cmd: plugins#dein#prefix('Sideways', ['Left', 'Right']),
        on_map: {n: ['[sideways]', ]},
     })

``splitjoin.vim``
'''''''''''''''''

    “Switch between single-line and multiline forms of code”

:repository: :repo:`AndrewRadev/splitjoin.vim`
:config: :doc:`localcfg/plugins/splitjoin.vim`

::

    dein#add('AndrewRadev/splitjoin.vim', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: plugins#dein#prefix('Splitjoin', ['Join', 'Split']),
        on_map: {n: ['gJ', 'gS']},
    })

``switch.vim``
''''''''''''''

    “Switch segments of text with predefined replacements”

:repository: :repo:`AndrewRadev/switch.vim`
:early setup: :ref:`maps <switch-vim-custom-maps>`

Edit your configuration files like they had a fancy dialog box to fiddle with
their preferences.

::

    dein#add('AndrewRadev/switch.vim', {
        on_cmd: ['Switch', ],
        on_func: ['switch#Switch', ],
        on_map: {n: ['gs', ]},
    })

``vim-bracketed-paste``
'''''''''''''''''''''''

    “Enables transparent pasting into |vim|\”

:repository: :repo:`ConradIrwin/vim-bracketed-paste`

::

    dein#add('ConradIrwin/vim-bracketed-paste', {
        on_event: ['InsertEnter', ],
    })

``dwm.vim``
'''''''''''

    “Tiled Window Management for Vim”

:repository: :repo:`JNRowe/dwm.vim`
:early setup: :ref:`maps <dwm-vim-custom-maps>`

Excellent window management, it really does bring dwm_ simplicity to |vim|!

::

    dein#add('JNRowe/dwm.vim', {
        on_map: {n: ['<Plug>DWM', ]},
    })

``securemodelines``
'''''''''''''''''''

    “A secure alternative to modelines”

:repository: :repo:`JNRowe/securemodelines`
:config: :doc:`localcfg/plugins/securemodelines`

This lightens the load of dealing with people who can’t follow :ref:`coding
standards <editorconfig-plugin>` without allowing them free access to your |vim|
session.

::

    dein#add('JNRowe/securemodelines', {
        hook_source: 'call plugins#dein#load_config()',
    })

``vim-illuminate``
''''''''''''''''''

    “Selectively illuminate other uses of the current word”

:repository: :repo:`RRethy/vim-illuminate`
:config: :doc:`localcfg/plugins/vim_illuminate`

::

    dein#add('RRethy/vim-illuminate', {
        hook_source: 'call plugins#dein#load_config()',
        on_event: ['CursorHold', ],
    })

``delimitMate``
'''''''''''''''

    “Automatic closing of quotes, parenthesis, brackets, etc”

:repository: :repo:`Raimondi/delimitMate`
:config: :doc:`localcfg/plugins/delimitMate`

The number 1 “love it or hate it” plugin, to use it well you’ll want to read its
documentation and disable the defaults that get in the way of your chosen
languages.

::

    dein#add('Raimondi/delimitMate', {
        hook_source: 'call plugins#dein#load_config()',
        on_event: ['InsertEnter', ],
    })

``vimproc``
'''''''''''

    “Asynchronous execution plugin”

:repository: :repo:`Shougo/vimproc`

::

    dein#add('Shougo/vimproc', {
        build: 'make',
        lazy: v:true,
    })

.. include:: .includes/lazy_rdep.rst

``ultisnips``
'''''''''''''

    “The ultimate plugin for snippets”

:repository: :repo:`SirVer/ultisnips`
:config: :doc:`localcfg/plugins/ultisnips`
:functions: :doc:`autoload/plugins/ultisnips`

::

    dein#add('SirVer/ultisnips', {
        depends: ['vim-snippets', ],
        hook_source: 'call plugins#dein#load_config()',
        if: has('insert_expand') && has('pythonx') && v:version >= 704,
        on_event: ['InsertEnter', ],
        on_ft: ['snippets', ],
    })

``vim-gitgutter``
'''''''''''''''''

    “Show :command:`git diff` status in the gutter”

:repository: :repo:`airblade/vim-gitgutter`
:early setup: :ref:`maps <vim-gitgutter-custom-maps>`
:config: :doc:`localcfg/plugins/vim_gitgutter`

::

    dein#add('airblade/vim-gitgutter', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('signs') && plugins#dein#has_exec('git'),
    })

.. _vim-matchup-plugin:

``vim-matchup``
'''''''''''''''

    “Visualize, navigate, and operate on matching sets of text”

:repository: :repo:`andymass/vim-matchup`
:config: :doc:`localcfg/plugins/vim_matchup`

::

    dein#add('andymass/vim-matchup', {
        hook_source: 'call plugins#dein#load_config()',
        if: v:version >= 704,
        on_cmd: ['MatchupWhereAmI?', ],
        on_map: {nx: ['%', ]},
    })

``vim-bad-whitespace``
''''''''''''''''''''''

    “Highlights whitespace at the end of lines”

:repository: :repo:`bitc/vim-bad-whitespace`

Highlights or deletes broken whitespace, and removes that ugly
almost-kind-of-works solution from your :file:`.vimrc`.

::

    dein#add('bitc/vim-bad-whitespace', {
        on_cmd: plugins#dein#suffix('BadWhitespace',
                                    ['Erase', 'Hide', 'Toggle']),
        on_event: ['InsertEnter', ],
    })

``vim-toml``
''''''''''''

    “Syntax for :repo:`TOML <toml-lang/toml>`\”

:repository: :repo:`cespare/vim-toml`

::

    dein#add('cespare/vim-toml')

``Colorizer``
'''''''''''''

    “Colour colour names and codes”

:repository: :repo:`chrisbra/Colorizer`

::

    dein#add('chrisbra/Colorizer', {
        on_cmd: plugins#dein#prefix('Color',
                                    ['Highlight', 'Toggle']) + ['RGB2Term', ],
    })

.. note::

    I don’t automatically enable this on specific filetypes because it
    *severely* slows down |vim|, sometimes even enough to make you regret
    enabling it.  However, it is *incredibly* useful and definitely worth the
    slow down when you’re editing themes.

.. _nrrwrgn-plugin:

``NrrwRgn``
'''''''''''

    “A narrow region plugin (similar to Emacs)”

:repository: :repo:`chrisbra/NrrwRgn`

If, like me, you’re a partial emacs_ convert ``:NrrwRgn`` is wonderful.  If
you’re not then simply imagine being able to work in a visual mode hunk for
a full editing session.

::

    dein#add('chrisbra/NrrwRgn')

.. include:: .includes/vim_airline_dep.rst

``Recover``
'''''''''''

    “Show differences for recovered files”

:repository: :repo:`chrisbra/Recover.vim`
:config: :doc:`localcfg/plugins/Recover.vim`

::

    dein#add('chrisbra/Recover.vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: v:version >= 703,
        on_cmd: ['RecoverPluginEnable', ],
    })

``Replay``
''''''''''

    “Record and replay your editing sessions”

:repository: :repo:`chrisbra/Replay`
:config: :doc:`localcfg/plugins/Replay`

::

    dein#add('chrisbra/Replay', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['ListRecords', 'ScreenCapture', 'StartRecord'],
    })

``SaveSigns.vim``
'''''''''''''''''

    “Save signs across sessions”

:repository: :repo:`chrisbra/SaveSigns.vim`

::

    dein#add('chrisbra/SaveSigns.vim', {
        if: has('signs'),
        on_cmd: ['SaveSigns', ],
    })

.. _csv.vim-plugin:

``csv.vim``
'''''''''''

    “A filetype plugin for |CSV| files”

:repository: :repo:`chrisbra/csv.vim`
:config: :doc:`localcfg/plugins/csv.vim`

Disturbingly cool editing for |CSV| files, ‘nuff said.

::

    dein#add('chrisbra/csv.vim', {
        hook_source: 'call plugins#dein#load_config()',
        on_ft: ['csv', ],
    })

``unicode.vim``
'''''''''''''''

    “A plugin for handling Unicode and digraphs characters”

:repository: :repo:`chrisbra/unicode.vim`
:early setup: :ref:`maps <unicode-vim-custom-maps>`
:config: :doc:`localcfg/plugins/unicode.vim`

Be like me and annoy your co-workers/friends by littering your mails with
Unicode.  It’s Really Exciting :kbd:`U+2122<C-x><C-z>`.

::

    dein#add('chrisbra/unicode.vim', {
        hook_source: 'call plugins#dein#load_config()',
    })

.. include:: .includes/vim_airline_dep.rst

``vim_faq``
'''''''''''

    “The vim :abbr:`FAQ (Frequently Asked Questions)`\”

:repository: :repo:`chrisbra/vim_faq`

::

    dein#add('chrisbra/vim_faq', {
        if: v:version >= 600,
        lazy: v:true,
    })

``vim-codereview``
''''''''''''''''''

    “GitHub pull request-based code reviews”

:repository: :repo:`codegram/vim-codereview`

::

    dein#add('codegram/vim-codereview', {
        depends: ['patchreview-vim', ],
        hook_source: 'call plugins#dein#load_config()',
        if: has('ruby') && plugins#dein#has_exec('curl'),
        on_cmd: ['CodeReview', ],
    })

``vim-capnp``
'''''''''''''

    “Syntax highlighting, folding and indentation rules for `Cap'n Proto`_\”

:repository: :repo:`cstrahan/vim-capnp`

::

    dein#add('cstrahan/vim-capnp', {
        lazy: v:false,
        on_ft: ['capnp', ],
    })

``jedi-vim``
''''''''''''

    “A VIM binding to the :pypi:`jedi` autocompletion library”

:repository: :repo:`davidhalter/jedi-vim`
:config: :doc:`localcfg/plugins/jedi_vim`

::

    dein#add('davidhalter/jedi-vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('pythonx'),
        on_cmd: ['JediClearCache', ],
        on_ft: ['python', ],
    })

``vim-ditto``
'''''''''''''

    “Highlight overused words”

:repository: :repo:`dbmrq/vim-ditto`
:config: :doc:`localcfg/plugins/vim_ditto`

::

    dein#add('dbmrq/vim-ditto', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: plugins#dein#prefix('Ditto', ['File', 'On']),
    })

.. _ale-plugin:

``ale``
'''''''

    “Asynchronous Lint Engine”

:repository: :repo:`dense-analysis/ale`
:early setup: :ref:`maps <ale-custom-maps>`
:config: :doc:`localcfg/plugins/ale`

Start your mind boggling every time someone moans about having to switch from
WingIDE to a real editor when they edit files of different types.

::

    dein#add('dense-analysis/ale', {
        hook_source: 'call plugins#dein#load_config()',
        if: v:version >= 800 && has('signs'),
    })

``vim-table-mode``
''''''''''''''''''

    “An awesome automatic table creator & formatter”

:repository: :repo:`dhruvasagar/vim-table-mode`

::

    dein#add('dhruvasagar/vim-table-mode', {
        on_cmd: plugins#dein#prefix('Table', ['ModeToggle', 'ize']),
        on_ft: ['rst', ],
        on_map: {nx: ['<LocalLeader>t', ]},
    })

``bullets.vim``
'''''''''''''''

    “Automated Bullet Lists in Vim”

:repository: :repo:`dkarter/bullets.vim`

::

    dein#add('dkarter/bullets.vim', {
        hook_post_source: 'let g:bullets_enabled_file_types += ["rst"]',
        on_ft: ['gitcommit', 'rst'],
    })

.. note::

    We set ``g:bullets_enabled_file_types`` in a post source hook as the option
    isn’t additive, and this allows us to catch updates to the supported
    filetypes in the plugin.

.. _editorconfig-plugin:

``editorconfig-vim``
''''''''''''''''''''

    “The EditorConfig_ plugin”

:repository: :repo:`editorconfig/editorconfig-vim`
:config: :doc:`localcfg/plugins/editorconfig_vim`

::

    dein#add('editorconfig/editorconfig-vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('pythonx'),
        on_event: ['InsertEnter', ],
        on_path: ['.editorconfig', ],
    })

``vim-cute-python``
'''''''''''''''''''

    “Cute conceal support for Python”

:repository: :repo:`ehamberg/vim-cute-python`

Make your Python code unreadable to people looking over your shoulder, by
decorating it with glyphs.

::

    dein#add('ehamberg/vim-cute-python', {
        if: has('conceal') && v:version >= 703,
        lazy: v:false,
        on_ft: ['python', ],
        rev: 'moresymbols',
    })

.. tip::

    Be sure to try the ``moresymbols`` branch.  It makes a far larger visual
    change to editing Python files.

``visSum.vim``
''''''''''''''

    “Sum numbers that appear in selection”

:repository: :repo:`elazar/visSum.vim`

::

    dein#add('elazar/visSum.vim', {
        on_map: {x: ['<LocalLeader>su', ]},
    })

``regex``
'''''''''

    “Allows you to test regular expressions”

:repository: :repo:`ervandew/regex`
:config: :doc:`localcfg/plugins/regex`
:functions: :doc:`autoload/plugins/regex`

Removes the need to jump to your language’s :abbr:`REPL (Read-Eval-Print Loop)`
when writing ugly, ugly |RegEx|.

::

    dein#add('ervandew/regex', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['Regex', ],
    })

``tabular``
'''''''''''

    “Configurable, flexible, intuitive text aligning”

:repository: :repo:`godlygeek/tabular`

Fancy text alignment tricks are only seconds away.

This is the one plugin you use to make people who use lesser environments
jealous.

::

    dein#add('godlygeek/tabular', {
        on_cmd: ['Tabularize', 'AddTabularPipeline'],
    })

``xterm-color-table.vim``
'''''''''''''''''''''''''

    “All 256 :command:`xterm` colours with their RGB equivalents”

:repository: :repo:`guns/xterm-color-table.vim`

::

    dein#add('guns/xterm-color-table.vim', {
        on_cmd: plugins#dein#suffix('XtermColorTable', ['', 'V']),
    })

``dein-command.vim``
''''''''''''''''''''

    “Utility commands for ``dein.vim``\”

:repository: :repo:`haya14busa/dein-command.vim`

::

    dein#add('haya14busa/dein-command.vim', {
        on_cmd: ['Dein', ],
    })

``vim-snippets``
''''''''''''''''

    “Snippet files for various programming languages”

:repository: :repo:`honza/vim-snippets`
:config: :doc:`localcfg/plugins/vim_snippets`

::

    dein#add('honza/vim-snippets', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('insert_expand') && has('pythonx') && v:version >= 704,
        lazy: v:true,
    })

.. include:: .includes/lazy_rdep.rst

``vim-vebugger``
''''''''''''''''

    “Yet another debugger frontend plugin”

:repository: :repo:`idanarye/vim-vebugger`
:early setup: :ref:`maps <vim-vebugger-custom-maps>`
:config: :doc:`localcfg/plugins/vim_vebugger`

::

    var vebugger_commands: list<string> = []
    for [cmd, arg] in [
        ['gdb', ''],
        ['lldb', ''],
        ['python3', 'PDB3'],
        ['ruby', 'RDebug'],
    ]
        if plugins#dein#has_exec(cmd)
            vebugger_commands += [arg ?? toupper(cmd)]
        endif
    endfor
    dein#add('idanarye/vim-vebugger', {
        depends: ['vimproc', ],
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: plugins#dein#prefix('VBGstart', vebugger_commands),
        on_func: ['vebugger', ],
    })

``vim-yankitute``
'''''''''''''''''

    “|RegEx| powered yank and substitute”

:repository: :repo:`idanarye/vim-yankitute`

::

    dein#add('idanarye/vim-yankitute', {
        on_cmd: ['Yankitute', ],
    })

``vim-gnupg``
'''''''''''''

    “Transparent editing of gpg_ encrypted files”

:repository: :repo:`jamessan/vim-gnupg`

::

    dein#add('jamessan/vim-gnupg', {
        if: plugins#dein#has_exec('gpg') || plugins#dein#has_exec('gpg2'),
        on_path: ['.*\.gpg', ],
    })

``vim-textobj-css``
'''''''''''''''''''

    “Text objects for working with :abbr:`CSS (Cascading Style Sheets)`\”

:repository: :repo:`jasonlong/vim-textobj-css`

::

    dein#add('jasonlong/vim-textobj-css', {
        depends: ['vim-textobj-user', ],
        on_ft: ['css', 'html'],
    })

``semantic-highlight.vim``
''''''''''''''''''''''''''

    “Where every variable is a different color, an idea popularized by
    `Evan Brooks`_ blog post.

:repository: :repo:`jaxbot/semantic-highlight.vim`
:config: :doc:`localcfg/plugins/semantic_highlight.vim`

::

    dein#add('jaxbot/semantic-highlight.vim', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['SemanticHighlight', ],
    })

.. _vim-editqf-plugin:

``vim-editqf``
''''''''''''''

    “Edit and store quickfix/location list entries”

:repository: :repo:`jceb/vim-editqf`
:early setup: :ref:`maps <vim-editqf-custom-maps>`
:config: :doc:`localcfg/plugins/vim_editqf`
:functions: :doc:`autoload/plugins/vim_editqf`

Add your own “todo” entries to the quickfix list, and hold them across sessions.

::

    dein#add('jceb/vim-editqf', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('quickfix'),
        on_cmd:
            plugins#dein#prefix('Loc', ['AddNote', 'Load', 'Save'])
            + plugins#dein#prefix('QF', ['AddNote', 'Load', 'Save']),
        on_ft: ['qf', ],
        on_map: {n: ['<Plug>QFAdd', ]},
    })

``vimagit``
'''''''''''

    “Ease your :command:`git` workflow”

:repository: :repo:`jreybert/vimagit`

::

    dein#add('jreybert/vimagit')

.. include:: .includes/vim_airline_dep.rst

``fzf``
'''''''

    “Basic :command:`fzf` integration”

:repository: :repo:`junegunn/fzf`
:config: :doc:`localcfg/plugins/fzf`

::

    dein#add('junegunn/fzf', {
        hook_source: 'call plugins#dein#load_config()',
        if: plugins#dein#has_exec('fzf'),
        on_cmd: ['FZF', ],
        on_func: ['fzf#run', ],
    })

``fzf.vim``
'''''''''''

    “Advanced :command:`fzf` integration”

:repository: :repo:`junegunn/fzf.vim`
:early setup: :ref:`maps <fzf-vim-custom-maps>`
:config: :doc:`localcfg/plugins/fzf.vim`

Setup lazy loading for commonly used commands and test for optional commands::

    if plugins#dein#has_exec('fzf')
        dein#add('junegunn/fzf.vim', {
            depends: ['fzf', ],
            hook_source: 'call plugins#dein#load_config()',
            if: plugins#dein#has_exec('fzf'),
            on_cmd: plugins#dein#prefix('FZF', g:fzf_commands),
        })
    endif

.. note::

    This doesn’t list *all* the possible commands, just the ones I’d use enough
    to want to tab complete on.

``goyo.vim``
''''''''''''

    “Distraction-free writing in Vim.”

:repository: :repo:`junegunn/goyo.vim`
:config: :doc:`localcfg/plugins/goyo.vim`

::

    dein#add('junegunn/goyo.vim', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['Goyo', ],
    })

``vim-emoji``
'''''''''''''

    “Emoji support”

:repository: :repo:`junegunn/vim-emoji`

::

    dein#add('junegunn/vim-emoji', {
        lazy: v:false,
        on_func: ['emoji', ],
    })

``vim-peekaboo``
''''''''''''''''

    “Preview support for registers”

:repository: :repo:`junegunn/vim-peekaboo`
:config: :doc:`localcfg/plugins/vim_peekaboo`
:functions: :doc:`autoload/plugins/vim_peekaboo`

::

    dein#add('junegunn/vim-peekaboo', {
        hook_source:
            'call plugins#dein#load_config() | ' ..
            'call plugins#vim_peekaboo#set_compact()',
        hook_post_source: 'doautocmd <nomodeline> peekaboo_init BufEnter',
        on_map: {
            i: ['<C-r>', ],
            n: ['@', '"'],
            x: ['"', ],
        },
    })

``patchreview-vim``
'''''''''''''''''''

    “Single, multi-patch or diff code reviews”

:repository: :repo:`junkblocker/patchreview-vim`
:config: :doc:`localcfg/plugins/patchreview_vim`

::

    dein#add('junkblocker/patchreview-vim', {
        on_cmd: plugins#dein#suffix('Review',
                                    ['Diff', 'Patch', 'ReversePatchReview']),
    })

``vim-eighties``
''''''''''''''''

    “Automatically resizes your windows”

:repository: :repo:`justincampbell/vim-eighties`
:config: :doc:`localcfg/plugins/vim_eighties`

::

    dein#add('justincampbell/vim-eighties', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: plugins#dein#prefix('Eighties', ['Disable', 'Enable']),
    })

``vim-sneak``
'''''''''''''

    “Motion improved”

:repository: :repo:`justinmk/vim-sneak`
:config: :doc:`localcfg/plugins/vim_sneak`
:functions: :doc:`autoload/plugins/vim_sneak`

::

    dein#add('justinmk/vim-sneak', {
        depends: ['vim-repeat', ],
        hook_source: 'call plugins#dein#load_config()',
        if: v:version >= 703,
        on_map: {
            n: ['S', 's'],
            o: ['Z', 'z'],
            x: ['Z', 's'],
        },
    })

``vim-coiled-snake``
''''''''''''''''''''

    “Enhanced Python folding”

:repository: :repo:`kalekundert/vim-coiled-snake`
:config: :doc:`localcfg/plugins/vim_coiled_snake`

::

    dein#add('kalekundert/vim-coiled-snake', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('folding'),
        lazy: v:false,
        on_ft: ['python', ],
    })

``vim-textobj-fold``
''''''''''''''''''''

    “Text objects for folds”

:repository: :repo:`kana/vim-textobj-fold`

::

    dein#add('kana/vim-textobj-fold', {
        depends: ['vim-textobj-user', ],
        on_func: ['textobj', ],
    })

``vim-textobj-user``
''''''''''''''''''''

    “Create your own text objects”

:repository: :repo:`kana/vim-textobj-user`

::

    dein#add('kana/vim-textobj-user', {
        lazy: v:false,
        on_func: ['textobj', ],
    })

``nyancat-vim``
'''''''''''''''

:repository: :repo:`koron/nyancat-vim`

:wikipedia:`nyancat`. bah, grow up!

::

    dein#add('koron/nyancat-vim', {
        on_cmd: plugins#dein#prefix('Nyancat', ['', '2']),
    })

``vim-signature``
'''''''''''''''''

    “A plugin to place, toggle and display marks”

:repository: :repo:`kshenoy/vim-signature`
:config: :doc:`localcfg/plugins/vim_signature`

::

    dein#add('kshenoy/vim-signature', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('signs'),
    })

``moonscript-vim``
''''''''''''''''''

    “Language support for :repo:`moonscript <leafo/moonscript>`\”

:repository: :repo:`leafo/moonscript-vim`

::

    dein#add('leafo/moonscript-vim', {
        lazy: v:false,
        on_ft: ['moon', ],
    })

.. _ledger-plugin:

``vim-ledger``
''''''''''''''

    “Language support for |ledger|\”

:repository: :repo:`ledger/vim-ledger`
:early setup: :ref:`maps <vim-ledger-custom-maps>`
:config: :doc:`localcfg/plugins/vim_ledger`

Combine this with :ref:`csv.vim <csv.vim-plugin>`, and it makes importing and
editing your accounts/expenses an almost nice-ish experience.

::

    dein#add('ledger/vim-ledger', {
        hook_source: 'call plugins#dein#load_config()',
        lazy: v:false,
        on_ft: ['ledger', ],
    })

.. _rainbow-plugin:

``rainbow``
'''''''''''

    “Help read complex code by showing parentheses in different colours”

:repository: :repo:`luochen1990/rainbow`
:config: :doc:`localcfg/plugins/rainbow`

Make your |vim| sessions feel like they have been painted by a three year old
trying to impress their grandpa.  Which is a Good Thing™.

::

    dein#add('luochen1990/rainbow', {
        hook_source: 'call plugins#dein#load_config()',
    })

``calendar-vim``
''''''''''''''''

    “A calendar window you can use within |vim|\”

:repository: :repo:`mattn/calendar-vim`
:early setup: :ref:`maps <calendar-vim-custom-maps>`
:config: :doc:`localcfg/plugins/calendar_vim`

::

    dein#add('mattn/calendar-vim', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: plugins#dein#suffix('Calendar', ['', 'H', 'T', 'VR']),
        on_map: {n: ['[calendar]', ]},
    })

``emmet-vim``
'''''''''''''

    “Plugins for |HTML| and :abbr:`CSS (Cascading Style Sheets)` hi-speed
    coding”

:repository: :repo:`mattn/emmet-vim`
:config: :doc:`localcfg/plugins/emmet_vim`

::

    dein#add('mattn/emmet-vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('insert_expand') && v:version >= 700,
        on_ft: ['html', 'htmljinja', 'xhtml', 'xml', 'xsl'],
    })

``vim-cuesheet``
''''''''''''''''

    “Syntax highlighting of `cue sheet`_\”

:repository: :repo:`mgrabovsky/vim-cuesheet`

::

    dein#add('mgrabovsky/vim-cuesheet', {
        lazy: v:false,
        on_ft: ['cuesheet', ],
    })

``vim-startify``
''''''''''''''''

    “The fancy start screen”

:repository: :repo:`mhinz/vim-startify`
:config: :doc:`localcfg/plugins/vim_startify`
:functions: :doc:`autoload/plugins/vim_startify`

::

    dein#add('mhinz/vim-startify', {
        hook_source:
            'call plugins#dein#load_config() | ' ..
            'call plugins#vim_startify#set_header_display()',
        on_cmd: ['Startify', ],
        on_map: ['<S-F1>', ],
    })

``vim-indent-object``
'''''''''''''''''''''

    “Text objects based on indent levels”

:repository: :repo:`michaeljsmith/vim-indent-object`

Makes handling Python code far, far easier.

::

    dein#add('michaeljsmith/vim-indent-object', {
        on_ft: ['ledger', 'moon', 'nim', 'python'],
        on_map: {ov: ['aI', 'ai', 'iI', 'ii']},
    })

``vim-bufmru``
''''''''''''''

    “Order buffers in :abbr:`MRU (Most Recently Used)` order”

:repository: :repo:`mildred/vim-bufmru`
:early setup: :ref:`maps <vim-bufmru-custom-maps>`

::

    dein#add('mildred/vim-bufmru', {
        on_cmd: ['BufMRU', ],
        on_map: {n: ['[bufmru]', ]},
    })

``vim-jinja``
'''''''''''''

    “Language support for :pypi:`jinja`\”

:repository: :repo:`mitsuhiko/vim-jinja`
:config: :doc:`localcfg/plugins/vim_jinja`

::

    dein#add('mitsuhiko/vim-jinja', {
        hook_source: 'call plugins#dein#load_config()',
        on_ft: ['jinja', ],
    })

``vim-bbye``
''''''''''''

    “Delete buffers without breaking your layout”

:repository: :repo:`moll/vim-bbye`
:config: :doc:`localcfg/plugins/vim_bbye`

::

    dein#add('moll/vim-bbye', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['Bdelete', 'Bwipeout'],
        on_map: {n: ['<LocalLeader>q', ]},
    })

``vim-indent-guides``
'''''''''''''''''''''

    “A plugin for visually displaying indent levels”

:repository: :repo:`nathanaelkane/vim-indent-guides`
:config: :doc:`localcfg/plugins/vim_indent_guides`

::

    dein#add('nathanaelkane/vim-indent-guides', {
        hook_source: 'call plugins#dein#load_config()',
    })

``vim-beancount``
'''''''''''''''''

    “Filetype plugin for :pypi:`beancount` files”

:repository: :repo:`nathangrigg/vim-beancount`

::

    dein#add('nathangrigg/vim-beancount', {
        lazy: v:false,
        on_ft: ['beancount', ],
    })

``vim-clevertab``
'''''''''''''''''

    “Tiny replacement for Supertab”

:repository: :repo:`neitanod/vim-clevertab`
:config: :doc:`localcfg/plugins/vim_clevertab`

Makes you feel more like a smart :abbr:`IDE (Integrated Developer Environment)`
user, how cool is that?

::

    dein#add('neitanod/vim-clevertab', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('insert_expand'),
    })

``vim_bridge``
''''''''''''''

    “Allow transparent calls to Python functions in native Vim scripts”

:repository: :repo:`nvie/vim_bridge`

::

    dein#add('nvie/vim_bridge', {
        lazy: v:false,
        on_cmd: ['python', ],
    })

``html5.vim``
'''''''''''''

    “|HTML|\5 + inline :abbr:`SVG (Scalable Vector Graphics)` omnicomplete
    function, indent and syntax”

:repository: :repo:`othree/html5.vim`

::

    dein#add('othree/html5.vim', {
        lazy: v:false,
        on_ft: ['html', ],
    })

``Yuescript-vim``
'''''''''''''''''

    “Adds syntax highlighting and indent support for YueScript”

:repository: :repo:`pigpigyyy/Yuescript-vim`

::

    call dein#add('pigpigyyy/Yuescript-vim', {
       lazy: v:false,
       on_ft: ['yue', ],
     })

.. _vim-textobj-quote-plugin:

``vim-textobj-quote``
'''''''''''''''''''''

    “Better support for typographic (‘curly’) quote characters”

:repository: :repo:`reedes/vim-textobj-quote`
:config: :doc:`localcfg/plugins/vim_textobj_quote`
:functions: :doc:`autoload/plugins/vim_textobj_quote`

::

    dein#add('reedes/vim-textobj-quote', {
        depends: ['vim-textobj-user', ],
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['ToggleEducate', ],
        on_ft: ['gitcommit', 'gitrebase', 'mail', 'note', 'rst', 'text'],
    })

``vim-qlist``
'''''''''''''

    “Make working with the quickfix list/window smoother”

:repository: :repo:`romainl/vim-qlist`

::

    dein#add('romainl/vim-qlist', {
        if: has('quickfix'),
        on_cmd: plugins#dein#suffix('list', ['D', 'I']),
        on_ft: ['qf', ],
        on_map: {n: ['[D', ']D', 'I', ']I']},
    })

``committia.vim``
'''''''''''''''''

    “More pleasant editing on commit message”

:repository: :repo:`rhysd/committia.vim`
:early setup: :ref:`filetype <committia-vim-filetype>`
:config: :doc:`localcfg/plugins/committia.vim`

::

    dein#add('rhysd/committia.vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: plugins#dein#has_exec('git'),
        on_ft: ['gitcommit', ],
    })

``git-messenger.vim``
'''''''''''''''''''''

    “Reveal the hidden message by :command:`git` under the cursor quickly”

:repository: :repo:`rhysd/git-messenger.vim`
:early setup: :ref:`maps <git-messenger-vim-custom-maps>`
:config: :doc:`localcfg/plugins/git_messenger.vim`

::

    dein#add('rhysd/git-messenger.vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: plugins#dein#has_exec('git'),
        on_cmd: ['GitMessenger', ],
        on_map: {n: ['[messenger]', ]},
    })

``vim-radon``
'''''''''''''

    “Show cyclomatic complexity of Python code”

:repository: :repo:`rubik/vim-radon`

::

    dein#add('rubik/vim-radon', {
        if: has('signs') && has('python'),
        lazy: v:false,
        on_cmd: ['Radon', ],
        on_ft: ['python', ],
    })

.. note::

    There is no radon_ check here, because it doesn’t actually use
    :command:`radon`.

``vim-mundo``
'''''''''''''

    “Visualizes the Vim undo tree”

:repository: :repo:`simnalamburt/vim-mundo`
:early setup: :ref:`maps <vim-mundo-custom-maps>`
:config: :doc:`localcfg/plugins/vim_mundo`

Finally grasp the |vim| ``undo-tree``, without this the feature can be really
daunting to wrap your head around.

::

    dein#add('simnalamburt/vim-mundo', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('pythonx') && v:version >= 703,
        on_cmd: ['MundoToggle', ],
    })

``splice.vim``
''''''''''''''

    “Plugin for resolving conflicts during three-way merges”

:repository: :repo:`sjl/splice.vim`

::

    dein#add('sjl/splice.vim', {
        on_cmd: ['SpliceInit', ],
    })

``vim-space``
'''''''''''''

    “Smart space key”

:repository: :repo:`spiiph/vim-space`
:config: :doc:`localcfg/plugins/vim_space`

::

    dein#add('spiiph/vim-space', {
        hook_source: 'call plugins#dein#load_config()',
        on_map: {n: ['<space>', ]},
    })

``vim-vimlint``
'''''''''''''''

    “Linter for |vim| script”

:repository: :repo:`syngan/vim-vimlint`
:config: :doc:`localcfg/plugins/vim_vimlint`

::

    dein#add('syngan/vim-vimlint', {
        depends: ['vim-vimlparser', ],
        hook_source: 'call plugins#dein#load_config()',
        lazy: v:false,
        on_cmd: ['VimLint', ],
        on_ft: ['vim', ],
    })

``vim-quick-radon``
'''''''''''''''''''

    “Applies radon_ to your current file”

:repository: :repo:`tell-k/vim-quick-radon`
:early setup: :ref:`maps <vim-quick-radon-custom-maps>`
:config: :doc:`localcfg/plugins/vim_quick_radon`
:functions: :doc:`autoload/plugins/vim_quick_radon`

::

    dein#add('tell-k/vim-quick-radon', {
        hook_source: 'call plugins#dein#load_config()',
        if: plugins#dein#has_exec('radon'),
        lazy: v:false,
        on_cmd: ['QuickRadon', ],
    })

``vim-expand-region``
'''''''''''''''''''''

    “Incremental visual selection”

:repository: :repo:`terryma/vim-expand-region`

::

    dein#add('terryma/vim-expand-region', {
        on_map: {v: ['+', '_']},
    })

``vim-visual-multi``
''''''''''''''''''''

    “Multiple selections/cursors”

:repository: :repo:`mg979/vim-visual-multi`
:config: doc:`localcfg/plugins/vim_visual_multi`

::

    dein#add('mg979/vim-visual-multi', {
        hook_source: 'call plugins#dein#load_config()',
        if: has('pythonx') && v:version >= 800,
        on_map: {nx: ['<C-n>', '<C-Down>', '<C-Up>']},
    })

``nerdtree``
''''''''''''

    “A tree explorer plugin to rule the Vim world. Bwahahaha!!”

:repository: :repo:`preservim/nerdtree`
:early setup: :ref:`maps <nerdtree-custom-maps>`
:config: :doc:`localcfg/plugins/nerdtree`

::

    dein#add('preservim/nerdtree', {
        on_cmd: ['NERDTree', ],
    })

``wordnet.vim``
'''''''''''''''

    “Look up word definitions with wordnet_”

:repository: :repo:`timcharper/wordnet.vim`
:early setup: :ref:`maps <wordnet-vim-custom-maps>`
:config: :doc:`localcfg/plugins/wordnet.vim`
:functions: :doc:`autoload/plugins/wordnet_vim`

::

    dein#add('timcharper/wordnet.vim', {
        hook_source: 'call plugins#dein#load_config()',
        if: plugins#dein#has_exec('wn'),
        on_func: ['WordNetOverviews', ],
        on_map: {nx: ['<Leader>wn']},
    })

``molokai``
'''''''''''

    “Vim port of the monokai theme for TextMate”

:repository: :repo:`tomasr/molokai`
:config: :doc:`localcfg/plugins/molokai`

::

    dein#add('tomasr/molokai', {
        hook_source: 'call plugins#dein#load_config()',
    })

``vim-exchange``
''''''''''''''''

    “Easy text exchange operator”

:repository: :repo:`tommcdo/vim-exchange`
:config: :doc:`localcfg/plugins/vim_exchange`

::

    dein#add('tommcdo/vim-exchange', {
        hook_source: 'call plugins#dein#load_config()',
        on_map: {
            n: ['cx', ],
            v: ['X', ],
        },
    })

``vim-lion``
''''''''''''

    “Defines a code alignment operator”

:repository: :repo:`tommcdo/vim-lion`

::

    dein#add('tommcdo/vim-lion', {
        on_map: {n: ['gl', 'gL']},
    })

``vim-abolish``
'''''''''''''''

    “Language friendly searches, substitutions, and abbreviations”

:repository: :repo:`tpope/vim-abolish`

::

    dein#add('tpope/vim-abolish', {
        on_cmd: ['Abolish', 'S'],
        on_map: {n: ['cr', ]},
    })

``vim-commentary``
''''''''''''''''''

    “Comment stuff out”

:repository: :repo:`tpope/vim-commentary`

Comment out those abusive remarks you wrote about a vim plugin with the simple
power of :kbd:`gcc`.

::

    dein#add('tpope/vim-commentary', {
        on_cmd: ['Commentary', ],
        on_map: {nx: ['gc', ]},
    })

``vim-fugitive``
''''''''''''''''

    “A Git wrapper so awesome, it should be illegal”

:repository: :repo:`tpope/vim-fugitive`
:early setup: :ref:`maps <vim-fugitive-custom-maps>`

Replace most of your use of a shell when working on a project with just another
|vim| buffer.

::

    dein#add('tpope/vim-fugitive', {
        if: plugins#dein#has_exec('git'),
    })

``vim-jdaddy``
''''''''''''''

    “:abbr:`JSON (JavaScript Object Notation)` manipulation and pretty printing”

:repository: :repo:`tpope/vim-jdaddy`

::

    dein#add('tpope/vim-jdaddy', {
        on_ft: ['json', ],
    })

.. _vim-obsession-plugin:

``vim-obsession``
'''''''''''''''''

    “Continuously updated session files”

:repository: :repo:`tpope/vim-obsession`

::

    dein#add('tpope/vim-obsession')

.. include:: .includes/vim_airline_dep.rst

``vim-projectionist``
'''''''''''''''''''''

    “Project configuration”

:repository: :repo:`tpope/vim-projectionist`
:config: :doc:`localcfg/plugins/vim_projectionist`
:functions: :doc:`autoload/plugins/vim_projectionist`

::

    dein#add('tpope/vim-projectionist', {
        hook_source: 'call plugins#dein#load_config()',
    })

``vim-repeat``
''''''''''''''

    “Repeat for plugin maps”

:repository: :repo:`tpope/vim-repeat`

Make :kbd:`.` work how you think it works… once someone has hacked in support to
your favourite plugin anyway.

::

    dein#add('tpope/vim-repeat')

``vim-rhubarb``
'''''''''''''''

    “If fugitive.vim is the Git, rhubarb.vim is the Hub”

:repository: :repo:`tpope/vim-rhubarb`

::

    dein#add('tpope/vim-rhubarb', {
        depends: ['vim-fugitive', ],
        if: plugins#dein#has_exec('git'),
    })

``vim-rsi``
'''''''''''

    “Readline_ style insertion”

:repository: :repo:`tpope/vim-rsi`

::

    dein#add('tpope/vim-rsi', {
        on_event: ['CmdlineEnter', 'InsertEnter'],
    })

``vim-sensible``
''''''''''''''''

    “One step above ``'nocompatible'`` mode”

:repository: :repo:`tpope/vim-sensible`

Sane defaults for |vim|, tracking this repo might make your |vim| experience
a little more comfortable.

::

    dein#add('tpope/vim-sensible', {
        rev: 'v1.2',
    })

.. attention::

    This is pinned as it can massively affect functionality, see :repo:`this
    commit <tpope/vim-sensible/commit/2c57c5f4c5446865db532064c763a6a67db2d0bb>`
    for an example.

``vim-sleuth``
''''''''''''''

    “Heuristically set buffer options”

:repository: :repo:`tpope/vim-sleuth`

Automagic indentation configuration, that just works.

::

    dein#add('tpope/vim-sleuth', {
        on_cmd: ['Sleuth', ],
        on_func: ['SleuthIndicator', ],
    })

``vim-speeddating``
'''''''''''''''''''

    “Increment dates, times, and more”

:repository: :repo:`tpope/vim-speeddating`
:config: :doc:`localcfg/plugins/vim_speeddating`

Speed up those :kbd:`y` and :kbd:`p` based :ref:`ledger <ledger-plugin>` entry
writing sessions by at least fifteen orders of magnitude… or your money back.

::

    dein#add('tpope/vim-speeddating', {
        hook_source: 'call plugins#dein#load_config()',
        depends: ['vim-repeat', ],
        on_map: {n: ['<C-a>', '<C-x>']},
    })

``vim-surround``
''''''''''''''''

    “Plugin for deleting, changing, and adding ‘surroundings’”

:repository: :repo:`tpope/vim-surround`

Make using :command:`ls -1` to produce the headings for your own |vim|
documentation a relatively painless task.

::

    dein#add('tpope/vim-surround', {
        depends: ['vim-repeat', ],
        on_map: {
            i: ['<C-g>S', '<C-g>s', '<C-s>'],
            n: ['cS', 'cs', 'ds', 'yS', 'ys'],
            x: ['S', ],
        },
    })

``vim-unimpaired``
''''''''''''''''''

    “Pairs of handy mappings”

:repository: :repo:`tpope/vim-unimpaired`
:config: :doc:`localcfg/plugins/vim_unimpaired`

::

    dein#add('tpope/vim-unimpaired', {
        hook_source: 'call plugins#dein#load_config()',
    })

``zoomwintab.vim``
''''''''''''''''''

    “A simple zoom window plugin”

:repository: :repo:`troydm/zoomwintab.vim`

::

    dein#add('troydm/zoomwintab.vim', {
        on_cmd: ['ZoomWinTabToggle', ],
        on_map: {n: ['<C-w>o', ]},
    })

.. tip::

    Should you need the standard behaviour for :kbd:`<C-w>o`, then it still
    available as ``:only``.

``braceless.vim``
'''''''''''''''''

    “Text objects, folding, and more for Python and other indented languages”

:repository: :repo:`tweekmonster/braceless.vim`

::

    dein#add('tweekmonster/braceless.vim', {
        on_cmd: ['BracelessEnable', ],
        on_ft: ['nim', 'python', 'yaml'],
    })

``startuptime.vim``
'''''''''''''''''''

    “1ms could mean the difference between life and death”

:repository: :repo:`tweekmonster/startuptime.vim`

::

    dein#add('tweekmonster/startuptime.vim', {
        on_cmd: ['StartupTime', ],
    })

``vim-airline``
'''''''''''''''

    “Lean & mean status/tabline for |vim| that’s light as air”

:repository: :repo:`vim-airline/vim-airline`
:config: :doc:`localcfg/plugins/vim_airline`

The main reason to use this is not “simply because it is pretty”, but mostly
because you can dump heaps and heaps of custom code you've written in your
:file:`.vimrc` and replace it with a heap of code that is far better maintained.

::

    dein#add('vim-airline/vim-airline', {
        depends: [
            'vim-airline-themes',
            'vim-fugitive',
        ],
        hook_source: 'call plugins#dein#load_config()',
    })

``vim-airline-themes``
''''''''''''''''''''''

    “Official theme repository for vim-airline”

:repository: :repo:`vim-airline/vim-airline-themes`

::

    dein#add('vim-airline/vim-airline-themes')

``vim-line``
''''''''''''

    “‘inner line’ text object”

:repository: :repo:`vim-utils/vim-line`

::

    dein#add('vim-utils/vim-line', {
        on_map: {ov: ['_', ]},
    })

.. _vim-man-plugin:

``vim-man``
'''''''''''

    “Enhanced :command:`man` support”

:repository: :repo:`vim-utils/vim-man`
:config: :doc:`localcfg/plugins/vim_man`

::

    dein#add('vim-utils/vim-man', {
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['Man', 'Mangrep', 'Vman'],
    })

``vim-vertical-move``
'''''''''''''''''''''

    “Motions to move a cursor without changing the column”

:repository: :repo:`vim-utils/vim-vertical-move`

::

    dein#add('vim-utils/vim-vertical-move', {
        on_map: {nx: ['[v', ']v']},
    })

``targets.vim``
'''''''''''''''

    “Provides additional text objects”

:repository: :repo:`wellle/targets.vim`

::

    dein#add('wellle/targets.vim')

``vim-misc``
''''''''''''

    “Miscellaneous auto-load Vim scripts”

:repository: :repo:`xolox/vim-misc`

::

    dein#add('xolox/vim-misc', {
        lazy: v:true,
    })

.. include:: .includes/lazy_rdep.rst

``vim-notes``
'''''''''''''

    “Easy note taking in Vim”

:repository: :repo:`xolox/vim-notes`
:config: :doc:`localcfg/plugins/vim_notes`

::

    dein#add('xolox/vim-notes', {
        depends: ['vim-misc', ],
        hook_source: 'call plugins#dein#load_config()',
        on_cmd: ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        on_map: {ov: ['<LocalLeader>en', ]},
    })

``vim-vimlparser``
''''''''''''''''''

    “Vimscript parser”

:repository: :repo:`ynkdir/vim-vimlparser`

::

    dein#add('ynkdir/vim-vimlparser', {
        lazy: v:true,
    })

.. include:: .includes/lazy_rdep.rst

``nim.vim``
'''''''''''

    “Nim language support”

:repository: :repo:`zah/nim.vim`

::

    dein#add('zah/nim.vim', {
        if: plugins#dein#has_exec('nim'),
        lazy: v:false,
        on_ft: ['nim', ],
    })

``zig.vim``
'''''''''''

    “File detection and syntax highlighting for the zig_ programming language.”

:repository: :repo:`ziglang/zig.vim`

::

    dein#add('ziglang/zig.vim', {
        if: plugins#dein#has_exec('zig'),
        on_ft: ['zig', ],
    })

vim-scripts mirrors
-------------------

``DotOutlineTree``
''''''''''''''''''

    “An outline tree of a buffer”

:repository: :repo:`vim-scripts/DotOutlineTree`
:config: :doc:`localcfg/plugins/DotOutlineTree`

I write my mail in |reST|.  No, really.

::

    dein#add('vim-scripts/DotOutlineTree', {
        hook_source: 'call plugins#dein#load_config()',
        on_ft: ['mail', 'rst'],
    })

``TaQua``
'''''''''

    “Colour scheme to fit the light/baby/soft colours of the aqua stuff”

:repository: :repo:`vim-scripts/TaQua`

::

    dein#add('vim-scripts/TaQua')

``bnf.vim``
'''''''''''

    “Highlight :abbr:`BNF (Backus–Naur form)`\s”

:repository: :repo:`vim-scripts/bnf.vim`

::

    dein#add('vim-scripts/bnf.vim', {
        lazy: v:false,
        on_ft: ['bnf', ],
    })

``ebnf.vim``
''''''''''''

    “Extended :abbr:`BNF (Backus–Naur form)` (:abbr:`ISO (International
    Organization for Standardization)`/:abbr:`IEC (International
    Electrotechnical Commission)` 14977) Syntax”

:repository: :repo:`vim-scripts/ebnf.vim`

::

    dein#add('vim-scripts/ebnf.vim', {
        lazy: v:false,
        on_ft: ['ebnf', ],
    })

``summerfruit256.vim``
''''''''''''''''''''''

    “88/256 colour version of Armin Ronacher's summerfruit colour scheme”

:repository: :repo:`vim-scripts/summerfruit256.vim`

::

    dein#add('vim-scripts/summerfruit256.vim')

``uri-ref``
'''''''''''

    “Painless footer references”

:repository: :repo:`vim-scripts/uri-ref`

::

    dein#add('vim-scripts/uri-ref', {
        on_ft: ['mail', ],
    })

.. rubric:: Footnotes

.. [#] I tend to ignore plugins that aren’t available in this manner, because
       the effort required to manage them otherwise exceeds their usefulness.

.. _github: https://github.com/
.. _dwm: https://dwm.suckless.org/
.. _emacs: https://www.gnu.org/software/emacs/
.. _Cap'n Proto: https://capnproto.org/
.. _EditorConfig: http://editorconfig.org/
.. _gpg: https://www.gnupg.org/
.. _Evan Brooks: https://medium.com/@evnbr/coding-in-color-3a6db2743a1e
.. _fzf: https://github.com/junegunn/fzf
.. _cue sheet: https://en.wikipedia.org/wiki/Cue_sheet_(computing)
.. _radon: https://radon.readthedocs.io/
.. _wordnet: http://wordnet.princeton.edu/
.. _Readline: http://www.gnu.org/software/readline/
.. _zig: https://ziglang.org/

.. spelling::

    Automagic
    Linter
    Neovim
    Nim
    Ronacher
    Supertab
    Vimscript
    Bwahahaha
    color
    cyclomatic
    dialog
    etc
    modelines
    monokai
    nuff
    omnicomplete
    summerfruit
