``dein.vim`` - ``dein`` plugins configuration
=============================================

.. tip::

    Modeline is set so that :kbd`:Exconfig <C-r><C-f>` works on plugin names
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

    function! s:prefix(str, args)
        return map(a:args, {_, s -> a:str . s})
    endfunction

    function! s:suffix(str, args)
        return map(a:args, {_, s -> s . a:str})
    endfunction

Enable an airline extension.  This is purely to remove duplication in setup.

::

    function! s:airline_enable(extension)
        return 'let g:airline_extensions += ["' . a:extension . '"]'
    endfunction

Support variables
-----------------

Used in ternaries for fallbacks to upstream sources when ``vcs_cst`` isn’t
available::

    let s:vcs_cst = dein#util#_get_type('vcs_cst') != {}

``executable()`` doesn’t cache results, so we’ll do it ourselves to handle
repeated calls::

    let s:has_exec_cache = {}
    function! s:has_exec(command)
        if !has_key(s:has_exec_cache, a:command)
            let s:has_exec_cache[a:command] = executable(a:command)
        endif
        return s:has_exec_cache[a:command]
    endfunction

Repositories
------------

``dein.vim``
''''''''''''

    “A dark powered Vim/Neovim plugin manager”

::

    call dein#add(expand('~/.vim/external/dein.vim'), {
        \ 'if': v:version >= 800,
    \ })

.. tip::

    Repository names in the :func:`dein#add` calls below are links to their
    source.

.. _sideways.vim-config:

``sideways.vim``
''''''''''''''''

    “Move an item in a delimiter-separated list left or right”

::

    call dein#add('AndrewRadev/sideways.vim', {
        \ 'on_cmd': s:prefix('Sideways', ['Left', 'Right']),
        \ 'on_map': {'n': '[sideways]'},
    \ })

``splitjoin.vim``
'''''''''''''''''

    “Switch between single-line and multiline forms of code”

::

    call dein#add('AndrewRadev/splitjoin.vim', {
        \ 'on_cmd': s:prefix('Splitjoin', ['Join', 'Split']),
        \ 'on_map': {'n': ['gJ', 'gS']},
    \ })

``switch.vim``
''''''''''''''

    “Switch segments of text with predefined replacements”

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

::

    call dein#add('ConradIrwin/vim-bracketed-paste')

``dwm.vim``
'''''''''''

    “Tiled Window Management for Vim”

Excellent window management, it really does bring dwm_ simplicity to
:command:`vim`!

::

    call dein#add('JNRowe/dwm.vim', {
        \ 'on_func': s:prefix('DWM_', ['Close', 'Focus', 'New', 'Rotate']),
    \ })

``securemodelines``
'''''''''''''''''''

    “A secure alternative to modelines”

This lightens the load of dealing with people who can’t follow :ref:`coding
standards <editorconfig-plugin>` without allowing them free access to your
:command:`vim` session.

::

    call dein#add('JNRowe/securemodelines')

``vim-jnrowe``
''''''''''''''

    “Tango inspired colour scheme”

.. image:: http://jnrowe.github.io/vim-jnrowe/_images/default.png
   :target: http://jnrowe.github.io/vim-jnrowe/_images/default.png
   :width: 25%

::

    call dein#add('JNRowe/vim-jnrowe')

``FastFold``
''''''''''''

    “Folding optimization”

::

    call dein#add('Konfekt/FastFold', {
        \ 'if': has('folding'),
    \ })

``delimitMate``
'''''''''''''''

    “Automatic closing of quotes, parenthesis, brackets, etc”

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

::

    call dein#add('SirVer/ultisnips', {
        \ 'depends': 'vim-snippets',
        \ 'if': has('pythonx') && v:version >= 704,
    \ })

``vim-gitgutter``
'''''''''''''''''

    “Show :command:`git diff` status in the gutter”

::

    call dein#add('airblade/vim-gitgutter', {
        \ 'if': has('signs') && s:has_exec('git'),
    \ })

``vim-bad-whitespace``
''''''''''''''''''''''

    “Highlights whitespace at the end of lines”

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

::

    call dein#add('chrisbra/Colorizer', {
        \ 'on_cmd':
        \   s:prefix('Color', ['Highlight', 'Toggle'])
        \   + ['RGB2Term', ],
        \ 'on_ft': ['css', 'less', 'moon', 'python', 'vim', 'xdefaults'],
    \ })

.. note::

    The filetype hooks are *my* hooks.  I often want highlighting in
    :command:`vim` files because I’m always editing my colour scheme, but
    I don’t need it for C in general because it is relatively uncommon for my
    C file to actually be :command:`dwm`\’s :file:`config.h`.

``NrrwRgn``
'''''''''''

    “A narrow region plugin (similar to Emacs)”

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

::

    call dein#add('chrisbra/Recover.vim', {
        \ 'if': v:version >= 703,
    \ })

``Replay``
''''''''''

    “Record and replay your editing sessions”

::

    call dein#add('chrisbra/Replay', {
        \ 'on_cmd': ['ListRecords', 'ScreenCapture', 'StartRecord'],
    \ })

``SaveSigns.vim``
'''''''''''''''''

    “Save signs across sessions”

::

    call dein#add('chrisbra/SaveSigns.vim', {
        \ 'if': has('signs'),
        \ 'on_cmd': 'SaveSigns',
    \ })

.. _csv.vim-plugin:

``csv.vim``
'''''''''''

    “A filetype plugin for :abbr:`CSV (Comma-separated values)` files”

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

::

    call dein#add('chrisbra/vim_faq', {
        \ 'if': v:version >= 600,
    \ })

``jedi-vim``
''''''''''''

    “A VIM binding to the :pypi:`jedi` autocompletion library”

::

    call dein#add('davidhalter/jedi-vim', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': 'JediClearCache',
        \ 'on_ft': 'python',
    \ })

``vim-ditto``
'''''''''''''

    “Highlight overused words”

::

    call dein#add('dbmrq/vim-ditto', {
        \ 'on_cmd': ['DittoFile', 'DittoOn'],
    \ })

``vim-table-mode``
''''''''''''''''''

    “An awesome automatic table creator & formatter”

::

    call dein#add('dhruvasagar/vim-table-mode', {
        \ 'on_cmd': s:prefix('Table', ['ModeToggle', 'ize']),
        \ 'on_ft': 'rst',
        \ 'on_map': '<LocalLeader>t',
    \ })

``bullets.vim``
'''''''''''''''

    “Automated Bullet Lists in Vim”

::

    call dein#add('dkarter/bullets.vim', {
        \ 'hook_post_source': 'let g:bullets_enabled_file_types += ["rst"]',
        \ 'on_ft': ['gitcommit', 'rst'],
    \ })

.. _editorconfig-plugin:

``editorconfig-vim``
''''''''''''''''''''

    “The EditorConfig_ plugin”

::

    call dein#add('editorconfig/editorconfig-vim', {
        \ 'if': has('pythonx'),
        \ 'on_event': 'InsertEnter',
        \ 'on_path': '.editorconfig',
    \ })

``vim-cute-python``
'''''''''''''''''''

    “Cute conceal support for Python”

Make your Python code unreadable to people looking over your shoulder, by
decorating it with glyphs.

::

    call dein#add('ehamberg/vim-cute-python', {
        \ 'if': has('conceal') && v:version >= 703,
        \ 'on_ft': 'python',
        \ 'rev': 'moresymbols',
    \ })

.. tip::

    Be sure to try the ``moresymbols`` branch.  It makes a far larger visual
    change to editing Python files.

``visSum.vim``
''''''''''''''

    “Sum numbers that appear in selection”

::

    call dein#add('elazar/visSum.vim', {
        \ 'on_map': {'x': '<LocalLeader>su'},
    \ })

``regex``
'''''''''

    “Allows you to test regular expressions”

Removes the need to jump to your language’s :abbr:`REPL (Read-Eval-Print Loop)`
when writing ugly, ugly :abbr:`RegEx (Regular Expression)`.

::

    call dein#add('ervandew/regex', {
        \ 'on_cmd': 'Regex',
    \ })

``tabular``
'''''''''''

    “Configurable, flexible, intuitive text aligning”

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

.. todo::

    Not needed with ``shortmess``\’s ``-S``.

::

    call dein#add('google/vim-searchindex', {
        \ 'on_map': {'n': ['/', '?', 'n', 'N']},
    \ })

``xterm-color-table.vim``
'''''''''''''''''''''''''

    “All 256 :command:`xterm` colours with their RGB equivalents”

::

    call dein#add('guns/xterm-color-table.vim', {
        \ 'on_cmd': s:suffix('XtermColorTable', ['', 'V']),
    \ })

``dein-command.vim``
''''''''''''''''''''

    “Utility commands for ``dein.vim``”

::

    call dein#add('haya14busa/dein-command.vim', {
        \ 'on_cmd': 'Dein',
    \ })

``vim-hjson``
'''''''''''''

    “Hjson_ syntax support“

::

    call dein#add('hjson/vim-hjson', {
        \ 'on_ft': 'hjson',
    \ })

``vim-snippets``
''''''''''''''''

    “Snippet files for various programming languages”

::

    call dein#add('honza/vim-snippets')

``vim-omnipytent``
''''''''''''''''''

    “All powerful Pythonic task runner”

::

    call dein#add('idanarye/vim-omnipytent', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': s:prefix('OP', ['edit', '2edit', '3edit']),
    \ })

``vim-vebugger``
''''''''''''''''

    “Yet another debugger frontend plugin”

::

    call dein#add('idanarye/vim-vebugger', {
        \ 'depends': 'vimproc',
        \ 'on_cmd': ['VBGstartGDB', 'VBGstartLLDB', 'VBGstartPDB3'],
        \ 'on_func': 'vebugger',
    \ })

``vim-yankitute``
'''''''''''''''''

    “:abbr:`RegEx (Regular Expression)` powered yank and substitute”

::

    call dein#add('idanarye/vim-yankitute', {
        \ 'on_cmd': 'Yankitute',
    \ })

``vim-cursorword``
''''''''''''''''''

    “Underline the word under the cursor”

::

    call dein#add('itchyny/vim-cursorword')

``vim-gnupg``
'''''''''''''

    “Transparent editing of gpg_ encrypted files”

::

    call dein#add('jamessan/vim-gnupg', {
        \ 'if': s:has_exec('gpg') || s:has_exec('gpg2'),
    \ })

``vim-textobj-css``
'''''''''''''''''''

    “Text objects for working with :abbr:`CSS (Cascading Style Sheets)`”

::

    call dein#add('jasonlong/vim-textobj-css', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_ft': ['css', 'html'],
    \ })

``semantic-highlight.vim``
''''''''''''''''''''''''''

    “Where every variable is a different color, an idea popularized by
    `Evan Brooks`_ blog post.

::

    call dein#add('jaxbot/semantic-highlight.vim', {
        \ 'on_cmd': 'SemanticHighlight',
    \ })

``vim-editqf``
''''''''''''''

    “Edit and store quickfix/location list entries”

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

::

    call dein#add('jceb/vim-orgmode', {
        \ 'depends': ['NrrwRgn', 'SyntaxRange', 'calendar-vim', 'vim-repeat',
        \             'vim-speeddating'],
        \ 'on_ft': 'org',
    \ })

``vimagit``
'''''''''''

    “Ease your :command:`git` workflow”

::

    call dein#add('jreybert/vimagit', {
        \ 'hook_post_source': s:airline_enable('vimagit'),
        \ 'if': s:has_exec('git'),
        \ 'on_cmd': 'Magit',
    \ })

``fzf``
'''''''

    “Basic :command:`fzf` integration”

::

    call dein#add('junegunn/fzf', {
        \ 'if': s:has_exec('fzf'),
        \ 'on_cmd': 'FZF',
        \ 'on_func': 'fzf#run',
    \ })

``fzf.vim``
'''''''''''

    “Advanced :command:`fzf` integration”

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

::

    call dein#add('junegunn/goyo.vim', {
        \ 'on_cmd': 'Goyo',
    \ })

``vim-emoji``
'''''''''''''

    “Emoji support”

::

    call dein#add('junegunn/vim-emoji', {
        \ 'on_func': 'emoji',
    \ })

``vim-eighties``
''''''''''''''''

    “Automatically resizes your windows”

::

    call dein#add('justincampbell/vim-eighties', {
        \ 'on_cmd': s:prefix('Eighties', ['Disable', 'Enable']),
    \ })

``vim-sneak``
'''''''''''''

    “Motion improved”

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

::

    call dein#add('kalekundert/vim-coiled-snake', {
        \ 'if': has('folding'),
        \ 'on_ft': 'python',
    \ })

``vim-textobj-user``
''''''''''''''''''''

    “Create your own text objects”

::

    call dein#add('kana/vim-textobj-user', {
        \ 'on_func': 'textobj',
    \ })

``nyancat-vim``
---------------

:wikipedia:`nyancat`. bah, grow up!

::

    call dein#add('koron/nyancat-vim', {
        \ 'on_cmd': s:prefix('Nyancat', ['', '2']),
    \ })

``vim-signature``
'''''''''''''''''

    “A plugin to place, toggle and display marks”

::

    call dein#add('kshenoy/vim-signature', {
        \ 'if': has('signs'),
    \ })

``moonscript-vim``
''''''''''''''''''

    “Language support for moonscript”

::

    call dein#add('leafo/moonscript-vim', {
        \ 'on_ft': 'moon',
    \ })

.. _ledger-plugin:

``vim-ledger``
''''''''''''''

    “Language support for ledger_”

Combine this with :ref:`csv.vim <csv.vim-plugin>`, and it makes importing and
editing your accounts/expenses an almost nice-ish experience.

::

    call dein#add('ledger/vim-ledger', {
        \ 'on_ft': 'ledger',
    \ })

``rainbow``
'''''''''''

    “Help read complex code by showing parentheses in different colours”

Make your ``vim`` sessions feel like they have been painted by a three year old
trying to impress their grandpa.  Which is a Good Thing™.

::

    call dein#add('luochen1990/rainbow')

.. _localcfg-config:

``localcfg``
''''''''''''

    “Help for customising based on features”

::

    call dein#add('magus/localcfg')

``calendar-vim``
''''''''''''''''

    “A calendar window you can use within :command:`vim`\”

::

    call dein#add('mattn/calendar-vim', {
        \ 'on_cmd': s:suffix('Calendar', ['', 'H', 'T', 'VR']),
        \ 'on_map': {'n': '[calendar]'},
    \ })

``emmet-vim``
'''''''''''''

    “Plugins for :abbr:`HTML (HyperText Markup Language)` and :abbr:`CSS
    (Cascading Style Sheets)` hi-speed coding”

::

    call dein#add('mattn/emmet-vim', {
        \ 'if': v:version >= 700,
        \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ })

``undotree``
''''''''''''

    “Display your undo history in a graph”

::

    call dein#add('mbbill/undotree', {
        \ 'if': v:version >= 700,
        \ 'on_cmd': 'UndotreeToggle',
    \ })

``vim-cuesheet``
''''''''''''''''

    “Syntax highlighting of `cue sheet`_\”

::

    call dein#add('mgrabovsky/vim-cuesheet', {
        \ 'on_ft': 'cuesheet',
    \ })

``vim-startify``
''''''''''''''''

    “The fancy start screen”

::

    call dein#add('mhinz/vim-startify')

``vim-indent-object``
'''''''''''''''''''''

    “Text objects based on indent levels”

Makes handling Python code far, far easier.

::

    call dein#add('michaeljsmith/vim-indent-object', {
        \ 'on_ft': ['ledger', 'moon', 'nim', 'python'],
        \ 'on_map': {'ov': ['aI', 'ai', 'iI', 'ii']},
    \ })

``vim-bufmru``
''''''''''''''

    “Order buffers in Most Recently Used order”

::

    call dein#add('mildred/vim-bufmru', {
        \ 'on_cmd': 'BufMRU',
        \ 'on_map': {'n': '[bufmru]'},
    \ })

``vim-jinja``
'''''''''''''

    “Language support for :pypi:`jinja`\”

::

    call dein#add('mitsuhiko/vim-jinja', {
        \ 'on_ft': 'jinja',
    \ })

``vim-bbye``
''''''''''''

    “Delete buffers without breaking your layout”

::

    call dein#add('moll/vim-bbye', {
        \ 'on_cmd': ['Bdelete', 'Bwipeout'],
        \ 'on_map': {'n': '<LocalLeader>q'},
    \ })

``vim-indent-guides``
'''''''''''''''''''''

    “A plugin for visually displaying indent levels”

::

    call dein#add('nathanaelkane/vim-indent-guides')

``vim-beancount``
'''''''''''''''''

    “Filetype plugin for :pypi:`beancount` files”

::

    call dein#add('nathangrigg/vim-beancount', {
        \ 'on_ft': 'beancount',
    \ })

``vim-clevertab``
'''''''''''''''''

    “Tiny replacement for Supertab”

Makes you feel more like a smart :abbr:`IDE (Integrated Developer Environment)`
user, how cool is that?

::

    call dein#add('neitanod/vim-clevertab')

``vim_bridge``
''''''''''''''

    “Allow transparent calls to Python functions in native Vim scripts”

::

    call dein#add('nvie/vim_bridge', {
        \ 'on_cmd': 'python',
    \ })

``html5.vim``
'''''''''''''

    “:abbr:`HTML (HyperText Markup Language)`\5 + inline :abbr:`SVG (Scalable
    Vector Graphics)` omnicomplete function, indent and syntax”

::

    call dein#add('othree/html5.vim', {
        \ 'on_ft': 'html',
    \ })

``vim-textobj-quote``
'''''''''''''''''''''

    “Better support for typographic (‘curly’) quote characters”

::

    call dein#add('reedes/vim-textobj-quote', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_cmd': 'ToggleEducate',
        \ 'on_ft': ['gitcommit', 'mail', 'rst', 'text'],
    \ })

``vim-qlist``
'''''''''''''

    “Make working with the quickfix list/window smoother”

::

    call dein#add('romainl/vim-qlist', {
        \ 'if': has('quickfix'),
        \ 'on_cmd': s:suffix('list', ['D', 'I']),
        \ 'on_map': {'n': ['[D', ']D', 'I', ']I']},
    \ })

``committia.vim``
'''''''''''''''''

    “More pleasant editing on commit message”

::

    call dein#add('rhysd/committia.vim', {
        \ 'if': s:has_exec('git'),
    \ })

``vim-radon``
'''''''''''''

    “Show cyclomatic complexity of Python code”

::

    call dein#add('rubik/vim-radon', {
        \ 'if': has('signs') && has('pythonx'),
        \ 'on_cmd': 'Radon',
        \ 'on_ft': 'python',
    \ })

.. note::

    There is no radon_ check here, because it doesn’t actually use
    :command:`radon`.

``gundo.vim``
'''''''''''''

    “Graph your undo tree”

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

::

    call dein#add('sjl/splice.vim', {
        \ 'on_cmd': 'SpliceInit',
    \ })

``vim-space``
'''''''''''''

    “Smart space key”

::

    call dein#add('spiiph/vim-space', {
        \ 'on_map': {'n': '<space>'},
    \ })

``vim-vimlint``
'''''''''''''''

    “Linter for :command:`vim` script”

::

    call dein#add('syngan/vim-vimlint', {
        \ 'depends': 'vim-vimlparser',
        \ 'on_cmd': 'VimLint',
        \ 'on_ft': 'vim',
    \ })

``vim-maximizer``
'''''''''''''''''

    “Maximizes and restores the current window”

::

    call dein#add('szw/vim-maximizer', {
        \ 'on_cmd': 'MaximizerToggle',
        \ 'on_map': {'n': '<C-w>o'},
    \ })

``vim-quick-radon``
'''''''''''''''''''

    “Applies radon_ to your current file”

::

    call dein#add('tell-k/vim-quick-radon', {
        \ 'if': s:has_exec('radon'),
        \ 'on_cmd': 'QuickRadon',
    \ })

``vim-expand-region``
'''''''''''''''''''''

    “Incremental visual selection”

::

    call dein#add('terryma/vim-expand-region', {
        \ 'on_map': {'nv': ['+', '-']},
    \ })

``vim-multiple-cursors``
''''''''''''''''''''''''

    “True Sublime Text multiple selection”

::

    call dein#add('terryma/vim-multiple-cursors', {
        \ 'on_map': '<C-n>',
    \ })

``wordnet.vim``
'''''''''''''''

    “Look up word definitions with wordnet_”

::

    call dein#add('timcharper/wordnet.vim', {
        \ 'if': s:has_exec('wn'),
        \ 'on_map': '<Leader>wn',
    \ })

``molokai``
'''''''''''

    “Vim port of the monokai theme for TextMate”

::

    call dein#add('tomasr/molokai')

``vim-exchange``
''''''''''''''''

    “Easy text exchange operator”

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

::

    call dein#add('tommcdo/vim-lion', {
        \ 'on_map': {'n': ['gl', 'gL']},
    \ })

``vim-abolish``
'''''''''''''''

    “Language friendly searches, substitutions, and abbreviations”

::

    call dein#add('tpope/vim-abolish', {
        \ 'on_cmd': ['Abolish', 'S'],
        \ 'on_map': {'n': 'cr'},
    \ })

``vim-commentary``
''''''''''''''''''

    “Comment stuff out”

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

::

    call dein#add('tpope/vim-endwise', {
        \ 'on_event': 'InsertEnter',
    \ })

``vim-fugitive``
''''''''''''''''

    “A Git wrapper so awesome, it should be illegal”

Replace most of your use of a shell when working on a project with just another
:command:`vim` buffer.

::

    call dein#add('tpope/vim-fugitive', {
        \ 'if': s:has_exec('git'),
    \ })

``vim-jdaddy``
''''''''''''''

    “:abbr:`JSON (JavaScript Object Notation)` manipulation and pretty printing”

::

    call dein#add('tpope/vim-jdaddy', {
        \ 'on_ft': 'json',
    \ })

``vim-obsession``
'''''''''''''''''

    “Continuously updated session files”

::

    call dein#add('tpope/vim-obsession', {
        \ 'hook_post_source': s:airline_enable('obsession'),
        \ 'on_cmd': 'Obsession',
    \ })

``vim-projectionist``
'''''''''''''''''''''

    “Project configuration”

::

    call dein#add('tpope/vim-projectionist')

``vim-repeat``
''''''''''''''

    “Repeat for plugin maps”

Make :kbd:`.` work how you think it works… once someone has hacked in support to
your favourite plugin anyway.

::

    call dein#add('tpope/vim-repeat')

``vim-rhubarb``
'''''''''''''''

    “If fugitive.vim is the Git, rhubarb.vim is the Hub”

::

    call dein#add('tpope/vim-rhubarb', {
        \ 'depends': 'vim-fugitive',
        \ 'if': s:has_exec('git'),
    \ })

``vim-rsi``
'''''''''''

    “Readline style insertion”

::

    call dein#add('tpope/vim-rsi', {
        \ 'on_event': ['CmdlineEnter', 'InsertEnter'],
    \ })

``vim-sensible``
''''''''''''''''

    “One step above ``nocompatible`` mode”

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

Automagic indentation configuration, that just works.

::

    call dein#add('tpope/vim-sleuth', {
        \ 'on_cmd': 'Sleuth',
    \ })

``vim-speeddating``
'''''''''''''''''''

    “Increment dates, times, and more”

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

::

    call dein#add('tpope/vim-unimpaired')

``startuptime.vim``
'''''''''''''''''''

    “1ms could mean the difference between life and death”

::

    call dein#add('tweekmonster/startuptime.vim', {
        \ 'on_cmd': 'StartupTime',
    \ })

``vim-airline``
'''''''''''''''

    “Lean & mean status/tabline for :command:`vim` that’s light as air”

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

::

    call dein#add('vim-airline/vim-airline-themes')

``vim-line``
''''''''''''

    “‘inner line’ text object”

::

    call dein#add('vim-utils/vim-line', {
        \ 'on_map': {'ov': '_'},
    \ })

``vim-man``
'''''''''''

    “Enhanced :command:`man` support”

::

    call dein#add('vim-utils/vim-man', {
        \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
    \ })

``vim-vertical-move``
'''''''''''''''''''''

    “Motions to move a cursor without changing the column”

::

    call dein#add('vim-utils/vim-vertical-move', {
        \ 'on_map': ['[v', ']v'],
    \ })

``targets.vim``
'''''''''''''''

    “Provides additional text objects”

::

    call dein#add('wellle/targets.vim')

.. _ale-plugin:

``ale``
'''''''

    “Asynchronous Lint Engine”

Start your mind boggling every time someone moans about having to switch from
WingIDE to a real editor when they edit files of different types.

::

    call dein#add('w0rp/ale', {
        \ 'if': v:version >= 800 && has('signs'),
    \ })

``vim-misc``
''''''''''''

    “Miscellaneous auto-load Vim scripts”

::

    call dein#add('xolox/vim-misc', {
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

.. include:: .includes/lazy_rdep.rst

``vim-notes``
'''''''''''''

    “Easy note taking in Vim”

::

    call dein#add('xolox/vim-notes', {
        \ 'depends': 'vim-misc',
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

``nim.vim``
'''''''''''

    “Nim language support”

::

    call dein#add('zah/nim.vim', {
        \ 'if': s:has_exec('nim'),
        \ 'on_ft': 'nim',
    \ })

``vim-vimlparser``
''''''''''''''''''

    “Vimscript parser”

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

I write my mail in reST_.  No, really.

::

    call dein#add('vim-scripts/DotOutlineTree', {
        \ 'on_ft': ['mail', 'rst'],
    \ })

.. _SyntaxRange-plugin:

``SyntaxRange``
'''''''''''''''

    “Set up regions within a buffer using their own filetypes”

::

    call dein#add('vim-scripts/SyntaxRange', {
        \ 'on_cmd': s:prefix('Syntax', ['Ignore', 'Include']),
    \ })

``TaQua``
'''''''''

    “Colour scheme to fit the light/baby/soft colours of the aqua stuff”

::

    call dein#add('vim-scripts/TaQua')

``bnf.vim``
'''''''''''

    “Highlight :abbr:`BNF (Backus–Naur form)`\s”

::

    call dein#add('vim-scripts/bnf.vim', {
        \ 'on_ft': 'bnf',
    \ })

``ebnf.vim``
''''''''''''

    “Extended :abbr:`BNF (Backus–Naur form)` (:abbr:`ISO (International
    Organization for Standardization)`/:abbr:`IEC (International
    Electrotechnical Commission)` 14977) Syntax”

::

    call dein#add('vim-scripts/ebnf.vim', {
        \ 'on_ft': 'ebnf',
    \ })

``summerfruit256.vim``
''''''''''''''''''''''

    “88/256 colour version of Armin Ronacher's summerfruit colour scheme”

::

    call dein#add('vim-scripts/summerfruit256.vim')

``uri-ref``
'''''''''''

    “Painless footer references”

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
       the effort required to manage them normally exceeds their usefulness.

.. _github: https://github.com/
.. _dwm: https://dwm.suckless.org/
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
