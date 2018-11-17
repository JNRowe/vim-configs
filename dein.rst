``dein.vim`` - ``dein`` plugins configuration
=============================================

.. tip::

    Modeline is set so that ``:Exconfig <C-r><C-f>`` works on plugin names [#]_::

        " vim: set isfname-=/:

These are all hosted on GitHub_ [#]_.  You should try at least a few of them,
they may make your life far simpler!


.. include:: .includes/scriptencoding.rst

.. attention::

    I record requirements even when they’re clearly met because I like to know
    what *may* break if I make changes.  For example, version checks for cases
    where dein_ wouldn't work anyway or using ``has('patch-x.x.x')`` for
    versions prior to 7.4.237.

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
        return 'let g:airline_extensions += ["'. a:extension . '"]'
    endfunction

Support variables
-----------------

Used in ternaries for fallbacks to upstream sources when ``vcs_cst`` isn’t
available::

    let s:vcs_cst = dein#util#_get_type('vcs_cst') != {}

``executable()`` doesn’t cache results, so we’ll do it ourselves for repeated
calls::

    let s:has_git = executable('git')

Repositories
------------

.. Dear reader, all these bare comment markers are here to break ``code-block``
   directives from the following blockquote.

..

    “A dark powered Vim/Neovim plugin manager”

::

    call dein#add(expand('~/.vim/external/dein.vim'), {
        \ 'if': v:version >= 800,
    \ })

.. _sideways.vim-config:

    “Move an item in a delimiter-separated list left or right”

::

    call dein#add('AndrewRadev/sideways.vim', {
        \ 'on_cmd': s:prefix('Sideways', ['Left', 'Right']),
        \ 'on_map': {'n': '[sideways]'},
    \ })

..

    “Switch between single-line and multiline forms of code”

::

    call dein#add('AndrewRadev/splitjoin.vim', {
        \ 'on_cmd': s:prefix('Splitjoin', ['Join', 'Split']),
        \ 'on_map': {'n': ['gJ', 'gS']},
    \ })

..

    “Tiled Window Management for Vim”

Excellent window management, it really does bring dwm_ simplicity to
:command:`vim`!

::

    call dein#add('JNRowe/dwm.vim', {
        \ 'on_func': s:prefix('DWM_', ['Close', 'Focus', 'New', 'Rotate']),
    \ })

..

    “A secure alternative to modelines”

This lightens the load of dealing with people who can’t follow :ref:`coding
standards <editorconfig-plugin>` without allowing them free access to your
:command:`vim` session.

.. code-block:: vim

    call dein#add('JNRowe/securemodelines')

..

    “Tango inspired colourscheme”

.. image:: http://jnrowe.github.io/vim-jnrowe/_images/default.png
   :target: http://jnrowe.github.io/vim-jnrowe/_images/default.png
   :width: 25%

::

    call dein#add('JNRowe/vim-jnrowe')

..

    “Folding optimization”

.. code-block:: vim

    call dein#add('Konfekt/FastFold', {
        \ 'if': has('folding'),
    \ })

..

    “Automatic closing of quotes, parenthesis, brackets, &c”

The number 1 “Love it or hate it” plugin, to use it well you’ll want to read its
documentation and disable the defaults that get in the way of your favourite
language.

::

    call dein#add('Raimondi/delimitMate', {
        \ 'on_event': 'InsertEnter',
    \ })

..

    “Asynchronous execution plugin”

::

    call dein#add('Shougo/vimproc', {
        \ 'build': 'make',
        \ 'on_cmd': s:prefix('VBGstart', ['GBB', 'LLDB', 'PDB3']),
        \ 'on_func': 'vebugger',
    \ })

.. include:: .includes/lazy_rdep.rst

..

    “The ultimate plugin for snippets”

::

    call dein#add('SirVer/ultisnips', {
        \ 'depends': 'vim-snippets',
        \ 'if': has('pythonx') && v:version >= 704,
    \ })

..

    “Show git diff status in the gutter”

::

    call dein#add('airblade/vim-gitgutter', {
        \ 'if': has('signs') && s:has_git,
    \ })

..

    “Run pytest from within vim”

::

    call dein#add('alfredodeza/pytest.vim', {
        \ 'if': executable('pytest'),
        \ 'on_cmd': 'Pytest',
        \ 'on_ft': 'python',
    \ })

..

    “Highlights whitespace at the end of lines”

Highlights or deletes broken whitespace, and removes that ugly
almost-kind-of-works solution from your :file:`.vimrc`.

::

    call dein#add('bitc/vim-bad-whitespace', {
        \ 'on_cmd': s:suffix('BadWhitespace', ['Erase', 'Hide', 'Toggle']),
        \ 'on_event': 'InsertEnter',
    \ })

..

    “Colour colournames and codes”

::

    call dein#add('chrisbra/Colorizer', {
        \ 'on_cmd':
        \   s:prefix('Color', ['Highlight', 'Toggle'])
        \   + ['RGB2Term', ],
        \ 'on_ft': ['css', 'less', 'moon', 'python', 'vim', 'xdefaults'],
    \ })

.. note::

    The filetype hooks are *my* hooks.  I often want highlighting in vim files
    because I’m always editing my colourscheme, but I don’t need it for C in
    general because it is relatively uncommon for my C file to actually be
    dwm’s config.h.

..

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

..

    “Show differences for recovered files”

::

    call dein#add('chrisbra/Recover.vim', {
        \ 'if': v:version >= 703,
    \ })

..

    “Record and replay your editing sessions”

::

    call dein#add('chrisbra/Replay', {
        \ 'on_cmd': ['ListRecords', 'ScreenCapture', 'StartRecord'],
    \ })

..

    “Save signs across sessions”

::

    call dein#add('chrisbra/SaveSigns.vim', {
        \ 'if': has('signs'),
        \ 'on_cmd': 'SaveSigns',
    \ })

.. _csv.vim-plugin:

..

    “A filetype plugin for CSV files”

Disturbingly cool editing for :abbr:`CSV (Comma-separated values)` files, ‘nuff
said.

::

    call dein#add('chrisbra/csv.vim', {
        \ 'on_ft': 'csv',
    \ })

..

    “A plugin for handling unicode and digraphs characters”

Be like me and annoy your co-workers/friends by littering your mails with
Unicode.  It’s Really Exciting``U+2122<C-x><C-z>``.

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

..

    “The vim FAQ”

::

    call dein#add('chrisbra/vim_faq', {
        \ 'if': v:version >= 600,
    \ })

..

    “A VIM binding to the jedi autocompletion library”

::

    call dein#add('davidhalter/jedi-vim', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': 'JediClearCache',
        \ 'on_ft': 'python',
    \ })

..

    “An awesome automatic table creator & formatter”

::

    call dein#add('dhruvasagar/vim-table-mode', {
        \ 'on_cmd': s:prefix('Table', ['ModeToggle', 'ize']),
        \ 'on_ft': 'rst',
        \ 'on_map': '<LocalLeader>t',
    \ })

..

    “Automated Bullet Lists in Vim”

::

    call dein#add('dkarter/bullets.vim', {
        \ 'hook_post_source': 'let g:bullets_enabled_file_types += ["rst"]',
        \ 'on_ft': ['gitcommit', 'rst'],
    \ })

.. _editorconfig-plugin:

..

    “The EditorConfig plugin”

::

    call dein#add('editorconfig/editorconfig-vim', {
        \ 'if': has('pythonx'),
        \ 'on_event': 'InsertEnter',
        \ 'on_path': '.editorconfig',
    \ })

..

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

..

    “Sum numbers that appear in selection”

::

    call dein#add('elazar/visSum.vim', {
        \ 'on_map': {'x': '<LocalLeader>su'},
    \ })

..

    “Allows you to test regular expressions”

Removes the need to jump to your language’s :abbr:`REPL (Read-Eval-Print Loop)`
when writing ugly, ugly :abbr:`regex (Regular Expressions)`.

::

    call dein#add('ervandew/regex', {
        \ 'on_cmd': 'Regex',
    \ })

..

    “Configurable, flexible, intuitive text aligning”

Fancy text alignment tricks are only seconds away.

This is the one plugin you use to make people who use lesser environments
jealous.

::

    call dein#add('godlygeek/tabular', {
        \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
    \ })

..

    “All 256 xterm colours with their RGB equivalents”

::

    call dein#add('guns/xterm-color-table.vim', {
        \ 'on_cmd': s:suffix('XtermColorTable', ['', 'V']),
    \ })

..

    “Utility comamnds for dein.vim”

::

    call dein#add('haya14busa/dein-command.vim', {
        \ 'on_cmd': 'Dein',
    \ })

..

    “Snippet files for various programming languages”

::

    call dein#add('honza/vim-snippets')

..

    “All powerful Pythonic task runner”

::

    call dein#add('idanarye/vim-omnipytent', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': s:prefix('OP', ['edit', '2edit', '3edit']),
    \ })

..

    “Yet another debugger frontend plugin”

::

    call dein#add('idanarye/vim-vebugger', {
        \ 'depends': 'vimproc',
        \ 'on_cmd': ['VBGstartGDB', 'VBGstartLLDB', 'VBGstartPDB3'],
        \ 'on_func': 'vebugger',
    \ })

..

    “Regex powered yank and substitute”

::

    call dein#add('idanarye/vim-yankitute', {
        \ 'on_cmd': 'Yankitute',
    \ })

..

    “Underline the word under the cursor”

::

    call dein#add('itchyny/vim-cursorword')

..

    “Highlight matching parenthesis”

::

    call dein#add('itchyny/vim-parenmatch')

..

    “Transparent editing of gpg encrypted files”

::

    call dein#add('jamessan/vim-gnupg', {
        \ 'if': executable('gpg') || executable('gpg2'),
    \ })

..

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

..

    “Text outlining and task management for Vim based on Emacs’ Org-Mode”

::

    call dein#add('jceb/vim-orgmode', {
        \ 'depends': ['NrrwRgn', 'SyntaxRange', 'calendar-vim', 'vim-repeat',
        \             'vim-speeddating'],
        \ 'on_ft': 'org',
    \ })

..

    “Ease your git workflow”

::

    call dein#add('jreybert/vimagit', {
        \ 'hook_post_source': s:airline_enable('vimagit'),
        \ 'if': s:has_git,
        \ 'on_cmd': 'Magit',
    \ })

..

    “Basic fzf integration”

::

    call dein#add('junegunn/fzf', {
        \ 'if': executable('fzf'),
        \ 'on_cmd': 'FZF',
        \ 'on_func': 'fzf#run',
    \ })

..

    “Advanced fzf integration”

::

    call dein#add('junegunn/fzf.vim', {
        \ 'depends': 'fzf',
        \ 'if': executable('fzf'),
        \ 'on_cmd': s:prefix(
        \   'FZF',
        \   ['Buffers', 'Colors', 'Commands', 'Files', 'GFiles',
        \    'History', 'Lines', 'Maps', 'Marks', 'Snippets', 'Windows']),
    \ })

..

    “Distraction-free writing in Vim.”

::

    call dein#add('junegunn/goyo.vim', {
        \ 'on_cmd': 'Goyo',
    \ })

..

    “Emoji support”

::

    call dein#add('junegunn/vim-emoji', {
        \ 'on_func': 'emoji',
    \ })

..

    “Automatically resizes your windows”

::

    call dein#add('justincampbell/vim-eighties', {
        \ 'on_cmd': s:prefix('Eighties', ['Disable', 'Enable']),
    \ })

..

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

..

    “Enhanced Python folding”

::

    call dein#add('kalekundert/vim-coiled-snake', {
        \ 'if': has('folding'),
        \ 'on_ft': 'python',
    \ })

..

    “Create your own text objects”

::

    call dein#add('kana/vim-textobj-user', {
        \ 'on_func': 'textobj',
    \ })

nyancat. bah, grow up!

::

    call dein#add('koron/nyancat-vim', {
        \ 'on_cmd': s:prefix('Nyancat', ['', '2']),
    \ })

..

    “A plugin to place, toggle and display marks”

::

    call dein#add('kshenoy/vim-signature', {
        \ 'if': has('signs'),
    \ })

..

    “Language support for moonscript”

::

    call dein#add('leafo/moonscript-vim', {
        \ 'on_ft': 'moon',
    \ })

.. _ledger-plugin:

..

    “Language support for ledger”

Combine this with :ref:`csv.vim <csv.vim-plugin>`, and it makes importing and
editing your accounts/expenses an almost nice-ish experience.

::

    call dein#add('ledger/vim-ledger', {
        \ 'on_ft': 'ledger',
    \ })

..

    “Help read complex code by showing parentheses in different colours”

Make your ``vim`` sessions feel like they have been painted by a three year old
trying to impress their grandpa.  Which is a Good Thing™.

::

    call dein#add('luochen1990/rainbow')

..

    “Help for customising based on features”

::

    call dein#add('magus/localcfg')

..

    “A calendar window you can use within vim”

::

    call dein#add('mattn/calendar-vim', {
        \ 'on_cmd': s:suffix('Calendar', ['', 'H', 'T', 'VR']),
        \ 'on_map': {'n': '[calendar]'},
    \ })

..

    “Plugins for HTML and CSS hi-speed coding”

::

    call dein#add('mattn/emmet-vim', {
        \ 'if': v:version >= 700,
        \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ })

..

    “Display your undo history in a graph”

::

    call dein#add('mbbill/undotree', {
        \ 'if': v:version >= 700,
        \ 'on_cmd': 'UndotreeToggle',
    \ })

..

    “The fancy start screen”

::

    call dein#add('mhinz/vim-startify')

..

    “Text objects based on indent levels”

Makes handling Python code far, far easier.

::

    call dein#add('michaeljsmith/vim-indent-object', {
        \ 'on_ft': ['ledger', 'moon', 'nim', 'python'],
        \ 'on_map': {'ov': ['aI', 'ai', 'iI', 'ii']},
    \ })

..

    “Order buffers in Most Recently Used order”

::

    call dein#add('mildred/vim-bufmru', {
        \ 'on_cmd': 'BufMRU',
        \ 'on_map': {'n': '[bufmru]'},
    \ })

..

    “Run your favorite search tool from Vim, with an enhanced results list”

::

    call dein#add('mileszs/ack.vim', {
        \ 'if': executable('ag'),
        \ 'on_cmd': ['Ack', 'LAck'],
    \ })

..

    “Language support for jinja”

::

    call dein#add('mitsuhiko/vim-jinja', {
        \ 'on_ft': 'jinja',
    \ })

..

    “Delete buffers without breaking your layout”

::

    call dein#add('moll/vim-bbye', {
        \ 'on_cmd': ['Bdelete', 'Bwipeout'],
        \ 'on_map': {'n': '<LocalLeader>q'},
    \ })

..

    “A plugin for visually displaying indent levels”

::

    call dein#add('nathanaelkane/vim-indent-guides')

..

    “Filetype plugin for beancount files”

::

    call dein#add('nathangrigg/vim-beancount', {
        \ 'on_ft': 'beancount',
    \ })

..

    “Tiny replacement for Supertab”

Makes you feel more like a smart :abbr:`IDE (Integrated Developer Environment)`
user, how cool is that?

::

    call dein#add('neitanod/vim-clevertab')

..

    “Allow transparent calls to Python functions in native Vim scripts”

::

    call dein#add('nvie/vim_bridge', {
        \ 'on_cmd': 'python',
    \ })

..

    “HTML5 + inline SVG omnicomplete function, indent and syntax”

::

    call dein#add('othree/html5.vim', {
        \ 'on_ft': 'html',
    \ })

..

    “Better support for typographic (‘curly’) quote characters”

::

    call dein#add('reedes/vim-textobj-quote', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_cmd': 'ToggleEducate',
        \ 'on_ft': ['gitcommit', 'mail', 'rst', 'text'],
    \ })

..

    “Make working with the quickfix list/window smoother”

::

    call dein#add('romainl/vim-qlist', {
        \ 'if': has('quickfix'),
        \ 'on_cmd': s:suffix('list', ['D', 'I']),
        \ 'on_map': {'n': ['[D', ']D', 'I', ']I']},
    \ })

..

    “More pleasant editing on commit message”

::

    call dein#add('rhysd/committia.vim', {
        \ 'if': s:has_git,
    \ })

..

    “Show cyclomatic complexity of Python code”

::

    call dein#add('rubik/vim-radon', {
        \ 'if': has('signs') && has('pythonx'),
        \ 'on_cmd': 'Radon',
        \ 'on_ft': 'python',
    \ })

..

    “Graph your undo tree”

Finally grasp the :command:`vim` ``undo-tree``, without this the feature can be
really daunting to wrap your head around.

::

    call dein#add('sjl/gundo.vim', {
        \ 'if': has('pythonx') && v:version >= 703,
        \ 'on_cmd': 'GundoToggle',
    \ })

..

    “Plugin for resolving conflicts during three-way merges”

::

    call dein#add('sjl/splice.vim', {
        \ 'on_cmd': 'SpliceInit',
    \ })

..

    “Smart space key”

::

    call dein#add('spiiph/vim-space', {
        \ 'on_map': {'n': '<space>'},
    \ })

..

    “Linter for vim script”

::

    call dein#add('syngan/vim-vimlint', {
        \ 'depends': 'vim-vimlparser',
        \ 'on_cmd': 'VimLint',
        \ 'on_ft': 'vim',
    \ })

..

    “Maximizes and restores the current window”

::

    call dein#add('szw/vim-maximizer', {
        \ 'on_cmd': 'MaximizerToggle',
        \ 'on_map': {'n': '<C-w>o'},
    \ })

..

    “Incremental visual selection”

::

    call dein#add('terryma/vim-expand-region', {
        \ 'on_map': {'nv': ['+', '-']},
    \ })

..

    “True Sublime Text multiple selection”

::

    call dein#add('terryma/vim-multiple-cursors', {
        \ 'on_map': '<C-n>',
    \ })

..

    “Look up word definitions with wordnet”

::

    call dein#add('timcharper/wordnet.vim', {
        \ 'if': executable('wn'),
        \ 'on_map': '<Leader>wn',
    \ })

..

    “Vim port of the monokai theme for TextMate”

::

    call dein#add('tomasr/molokai')

..

    “Easy text exchange operator”

::

    call dein#add('tommcdo/vim-exchange', {
        \ 'on_map': {
        \   'n': 'cx',
        \   'v': 'X',
        \ },
    \ })

..

    “Defines a code alignment operator”

::

    call dein#add('tommcdo/vim-lion', {
        \ 'on_map': {'n': ['gl', 'gL']},
    \ })

..

    “Language friendly searches, substitutions, and abbreviations”

::

    call dein#add('tpope/vim-abolish', {
        \ 'on_cmd': ['Abolish', 'S'],
        \ 'on_map': {'n': 'cr'},
    \ })

..

    “Comment stuff out”

Comment out those abusive remarks you wrote about a vim plugin with the simple
power of ``gcc``.

::

    call dein#add('tpope/vim-commentary', {
        \ 'on_cmd': 'Commentary',
        \ 'on_map': 'gc',
    \ })

..

    “Automatically insert block closing structures”

::

    call dein#add('tpope/vim-endwise', {
        \ 'on_event': 'InsertEnter',
    \ })

..

    “A Git wrapper so awesome, it should be illegal”

Replace most of your use of a shell when working on a project with just another
:command:`vim` buffer.

::

    call dein#add('tpope/vim-fugitive', {
        \ 'if': s:has_git,
    \ })

..

    “JSON manipulation and pretty printing”

::

    call dein#add('tpope/vim-jdaddy', {
        \ 'on_ft': 'json',
    \ })

..

    “Continuously updated session files”

::

    call dein#add('tpope/vim-obsession', {
        \ 'hook_post_source': s:airline_enable('obsession'),
        \ 'on_cmd': 'Obsession',
    \ })

..

    “Project configuration”

::

    call dein#add('tpope/vim-projectionist')

..

    “Repeat for plugin maps”

Make ``.`` work how you think it works… once someone has hacked in support to
your favourite plugin anyway.

::

    call dein#add('tpope/vim-repeat')

..

    “If fugitive.vim is the Git, rhubarb.vim is the Hub”

::

    call dein#add('tpope/vim-rhubarb', {
        \ 'depends': 'vim-fugitive',
        \ 'if': s:has_git,
    \ })

..

    “Readline style insertion”

::

    call dein#add('tpope/vim-rsi', {
        \ 'on_event': ['CmdlineEnter', 'InsertEnter'],
    \ })

..

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

..

    “Heuristically set buffer options”

Automagic indentation configuration, that just works.

::

    call dein#add('tpope/vim-sleuth', {
        \ 'on_cmd': 'Sleuth',
    \ })

..

    “Increment dates, times, and more”

Speed up those ``y`` and ``p`` based :ref:`ledger <ledger-plugin>` entry writing
sessions by at least fifteen orders of magnitude… or your money back.

::

    call dein#add('tpope/vim-speeddating', {
        \ 'depends': 'vim-repeat',
        \ 'on_map': {'n': ['<C-a>', '<C-x>']},
    \ })

..

    “Plugin for deleting, changing, and adding “surroundings””

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

..

    “Pairs of handy mappings”

::

    call dein#add('tpope/vim-unimpaired')

..

    “1ms could mean the difference between life and death”

::

    call dein#add('tweekmonster/startuptime.vim', {
        \ 'on_cmd': 'StartupTime',
    \ })

..

    “Lean & mean status/tabline for vim that’s light as air”

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

..

    “Official theme repository for vim-airline”

::

    call dein#add('vim-airline/vim-airline-themes')

..

    ““inner line” text object”

::

    call dein#add('vim-utils/vim-line', {
        \ 'on_map': {'ov': '_'},
    \ })

..

    “Enhanced man support”

::

    call dein#add('vim-utils/vim-man', {
        \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
    \ })

..

    “Motions to move a cursor without changing the column”

::

    call dein#add('vim-utils/vim-vertical-move', {
        \ 'on_map': ['[v', ']v'],
    \ })

..

    “A personal wiki”

::

    call dein#add('vimwiki/vimwiki', {
        \ 'on_cmd': s:prefix('Vimwiki', ['DiaryIndex', 'Index', 'MakeDiaryNote']),
        \ 'on_ft': 'vimwiki',
    \ })

..

    “Provides additional text objects”

::

    call dein#add('wellle/targets.vim')

..

    “Asynchronous Lint Engine”

Start your mind boggling every time someone moans about having to switch from
WingIDE to a real editor when they edit files of different types.

::

    call dein#add('w0rp/ale', {
        \ 'if': v:version >= 800 && has('signs'),
    \ })

..

    “Miscellaneous auto-load Vim scripts”

::

    call dein#add('xolox/vim-misc', {
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

.. include:: .includes/lazy_rdep.rst

..

    “Easy note taking in Vim”

::

    call dein#add('xolox/vim-notes', {
        \ 'depends': 'vim-misc',
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

..

    “Nim language support”

::

    call dein#add('zah/nim.vim', {
        \ 'if': executable('nim'),
        \ 'on_ft': 'nim',
    \ })

..

    “Vimscript parser”

::

    call dein#add('ynkdir/vim-vimlparser', {
        \ 'on_cmd': 'VimLint',
        \ 'on_ft': 'vim',
    \ })

.. include:: .includes/lazy_rdep.rst

vim-scripts mirrors
-------------------

..

    “An outline tree of a buffer”

I write my mail in reST.”  No, really.

::

    call dein#add('vim-scripts/DotOutlineTree', {
        \ 'on_ft': ['mail', 'rst'],
    \ })

..

    “Set up regions within a buffer using their own filetypes”

::

    call dein#add('vim-scripts/SyntaxRange', {
        \ 'on_cmd': s:prefix('Syntax', ['Ignore', 'Include']),
    \ })

..

    “Toggle values under the cursor”

Edit your config files like they had a fancy dialog box to fiddle with their
preferences.

::

    call dein#add('vim-scripts/Toggle', {
        \ 'on_func': 'Toggle',
        \ 'on_map': {
        \   'i': '<C-T>',
        \   'n': '+',
        \ },
    \ })

..

    “Highlight BNFs”

::

    call dein#add('vim-scripts/bnf.vim', {
        \ 'on_ft': 'bnf',
    \ })

..

    “Extended BNF (ISO/IEC 14977) Syntax”

::

    call dein#add('vim-scripts/ebnf.vim', {
        \ 'on_ft': 'ebnf',
    \ })

..

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
       supported via vim-projectionist_.
.. [#] I tend to ignore plugins that aren’t available in this manner, because
       the effort required to manage them normally exceeds their usefulness.

.. _github: https://github.com/
.. _dein: https://github.com/Shougo/dein.vim
.. _dwm: https://dwm.suckless.org/
.. _vim-projectionist: https://github.com/tpope/vim-projectionist
