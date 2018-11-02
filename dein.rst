``dein.vim`` - ``dein`` plugins configuration
=============================================

Modeline is set so that ``:Exconfig <C-r><C-f>`` works

.. code-block:: vim

    " vim: set isfname-=/:

.. include:: .includes/scriptencoding.rst

.. note::

    I record requirements even when they’re clearly met because I like to know
    what *may* break if I make changes.  For example, version checks for cases
    where dein wouldn't work anyway or using ``has('patch-x.x.x')`` for
    versions prior to 7.4.237.

.. note::

    In places where I could use a prefix, in sideways.vim’s ``on_cmd`` for
    example, I’ll often not do so because I prefer to have tab completion
    available for the commands that I use from the outset.

Utility functions for adding {pre,suf}fix to a list of strings.  This greatly
improves readability in my opinion.

.. code-block:: vim

    function! s:prefix(str, args)
        return map(a:args, {s -> a:str . v:val})
    endfunction

    function! s:suffix(str, args)
        return map(a:args, {s -> v:val . a:str})
    endfunction

Utility function to enable an airline extension.  This is purely to remove
duplication in setup.

.. code-block:: vim

    function! s:airline_enable(extension)
        return 'let g:airline_extensions += ["'. a:extension . '"]'
    endfunction

Used in ternaries for fallbacks to upstream sources when ``vcs_cst`` isn’t
available

.. code-block:: vim

    let s:vcs_cst = dein#util#_get_type('vcs_cst') != {}

``executable()`` doesn’t cache results, so we’ll do it ourselves

.. code-block:: vim

    let s:has_git = executable('git')

.. Dear reader, all these bare comment markers are here to break ``code-block``
   directives from the following blockquote.

..

    “A dark powered Vim/Neovim plugin manager”

.. code-block:: vim

    call dein#add(expand('~/.vim/external/dein.vim'), {
        \ 'if': v:version >= 800,
    \ })

..

    “Move an item in a delimiter-separated list left or right”

.. code-block:: vim

    call dein#add('AndrewRadev/sideways.vim', {
        \ 'on_cmd': s:prefix('Sideways', ['Left', 'Right']),
        \ 'on_map': {'n': '[sideways]'},
    \ })

..

    “Switch between single-line and multiline forms of code”

.. code-block:: vim

    call dein#add('AndrewRadev/splitjoin.vim', {
        \ 'on_cmd': s:prefix('Splitjoin', ['Join', 'Split']),
        \ 'on_map': {'n': ['gJ', 'gS']},
    \ })

..

    “Folding optimization”

.. code-block:: vim

    call dein#add('Konfekt/FastFold', {
        \ 'if': has('folding'),
    \ })

..

    “Tango inspired colourscheme”

.. code-block:: vim

    call dein#add('JNRowe/vim-jnrowe')

..

    “Automatic closing of quotes, parenthesis, brackets, &c”

.. code-block:: vim

    call dein#add('Raimondi/delimitMate', {
        \ 'on_event': 'InsertEnter',
    \ })

..

    “Asynchronous execution plugin”

.. code-block:: vim

    call dein#add('Shougo/vimproc', {
        \ 'build': 'make',
        \ 'on_cmd': s:prefix('VBGstart', ['GBB', 'LLDB', 'PDB3']),
        \ 'on_func': 'vebugger',
    \ })

.. include:: .includes/lazy_rdep.rst

..

    “The ultimate plugin for snippets”

.. code-block:: vim

    call dein#add('SirVer/ultisnips', {
        \ 'depends': 'vim-snippets',
        \ 'if': has('pythonx') && v:version >= 704,
    \ })

..

    “Show git diff status in the gutter”

.. code-block:: vim

    call dein#add('airblade/vim-gitgutter', {
        \ 'if': has('signs') && s:has_git,
    \ })

..

    “Run pytest from within vim”

.. code-block:: vim

    call dein#add('alfredodeza/pytest.vim', {
        \ 'if': executable('pytest'),
        \ 'on_cmd': 'Pytest',
        \ 'on_ft': 'python',
    \ })

..

    “Highlights whitespace at the end of lines”

.. code-block:: vim

    call dein#add('bitc/vim-bad-whitespace', {
        \ 'on_cmd': s:suffix('BadWhitespace', ['Erase', 'Hide', 'Toggle']),
        \ 'on_event': 'InsertEnter',
    \ })

..

    “Colour colournames and codes”

.. code-block:: vim

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

.. code-block:: vim

    call dein#add('chrisbra/NrrwRgn', {
        \ 'hook_post_source': s:airline_enable('nrrwrgn'),
        \ 'if': v:version >= 704,
        \ 'on_cmd': ['NUD', 'NR', 'NW']
    \ })

..

    “Show differences for recovered files”

.. code-block:: vim

    call dein#add('chrisbra/Recover.vim', {
        \ 'if': v:version >= 703,
    \ })

..

    “Record and replay your editing sessions”

.. code-block:: vim

    call dein#add('chrisbra/Replay', {
        \ 'on_cmd': ['ListRecords', 'ScreenCapture', 'StartRecord'],
    \ })

..

    “Save signs across sessions”

.. code-block:: vim

    call dein#add('chrisbra/SaveSigns.vim', {
        \ 'if': has('signs'),
        \ 'on_cmd': 'SaveSigns',
    \ })

..

    “A filetype plugin for CSV files”

.. code-block:: vim

    call dein#add('chrisbra/csv.vim', {
        \ 'on_ft': 'csv',
    \ })

..

    “A plugin for handling unicode and digraphs characters”

.. code-block:: vim

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

.. code-block:: vim

    call dein#add('chrisbra/vim_faq', {
        \ 'if': v:version >= 600,
    \ })

..

    “A secure alternative to modelines”

.. code-block:: vim

    call dein#add('JNRowe/securemodelines')

..

    “A VIM binding to the jedi autocompletion library”

.. code-block:: vim

    call dein#add('davidhalter/jedi-vim', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': 'JediClearCache',
        \ 'on_ft': 'python',
    \ })

..

    “An awesome automatic table creator & formatter”

.. code-block:: vim

    call dein#add('dhruvasagar/vim-table-mode', {
        \ 'on_cmd': s:prefix('Table', ['ModeToggle', 'ize']),
        \ 'on_ft': 'rst',
        \ 'on_map': '<LocalLeader>t',
    \ })

..

    “Automated Bullet Lists in Vim”

.. code-block:: vim

    call dein#add('dkarter/bullets.vim', {
        \ 'hook_post_source': 'let g:bullets_enabled_file_types += ["rst"]',
        \ 'on_ft': ['gitcommit', 'rst'],
    \ })

..

    “The EditorConfig plugin”

.. code-block:: vim

    call dein#add('editorconfig/editorconfig-vim', {
        \ 'if': has('pythonx'),
        \ 'on_event': 'InsertEnter',
    \ })

..

    “Cute conceal support for Python”

.. code-block:: vim

    call dein#add('ehamberg/vim-cute-python', {
        \ 'if': has('conceal') && v:version >= 703,
        \ 'on_ft': 'python',
        \ 'rev': 'moresymbols',
    \ })

..

    “Sum numbers that appear in selection”

.. code-block:: vim

    call dein#add('elazar/visSum.vim', {
        \ 'on_map': {'x': '<LocalLeader>su'},
    \ })

..

    “Allows you to test regular expressions”

.. code-block:: vim

    call dein#add('ervandew/regex', {
        \ 'on_cmd': 'Regex',
    \ })

..

    “Configurable, flexible, intuitive text aligning”

.. code-block:: vim

    call dein#add('godlygeek/tabular', {
        \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
    \ })

..

    “All 256 xterm colours with their RGB equivalents”

.. code-block:: vim

    call dein#add('guns/xterm-color-table.vim', {
        \ 'on_cmd': s:suffix('XtermColorTable', ['', 'V']),
    \ })

..

    “Utility comamnds for dein.vim”

.. code-block:: vim

    call dein#add('haya14busa/dein-command.vim', {
        \ 'on_cmd': 'Dein',
    \ })

..

    “Snippet files for various programming languages”

.. code-block:: vim

    call dein#add('honza/vim-snippets')

..

    “All powerful Pythonic task runner”

.. code-block:: vim

    call dein#add('idanarye/vim-omnipytent', {
        \ 'if': has('pythonx'),
        \ 'on_cmd': s:prefix('OP', ['edit', '2edit', '3edit']),
    \ })

..

    “Yet another debugger frontend plugin”

.. code-block:: vim

    call dein#add('idanarye/vim-vebugger', {
        \ 'depends': 'vimproc',
        \ 'on_cmd': ['VBGstartGDB', 'VBGstartLLDB', 'VBGstartPDB3'],
        \ 'on_func': 'vebugger',
    \ })

..

    “Regex powered yank and substitute”

.. code-block:: vim

    call dein#add('idanarye/vim-yankitute', {
        \ 'on_cmd': 'Yankitute',
    \ })

..

    “Meson build system support”

.. code-block:: vim

    call dein#add('igankevich/mesonic', {
        \ 'on_cmd': 'MesonInit',
    \ })

..

    “Underline the word under the cursor”

.. code-block:: vim

    call dein#add('itchyny/vim-cursorword')

..

    “Highlight matching parenthesis”

.. code-block:: vim

    call dein#add('itchyny/vim-parenmatch')

..

    “Transparent editing of gpg encrypted files”

.. code-block:: vim

    call dein#add('jamessan/vim-gnupg', {
        \ 'if': executable('gpg') || executable('gpg2'),
    \ })

..

    “Edit and store quickfix/location list entries”

.. code-block:: vim

    call dein#add('jceb/vim-editqf', {
        \ 'if': has('quickfix'),
        \ 'on_cmd':
        \   s:prefix('Loc', ['AddNote', 'Load', 'Save'])
        \   + s:prefix('QF', ['AddNote', 'Load', 'Save']),
        \ 'on_map': {'n': '<LocalLeader>n'},
    \ })

..

    “Text outlining and task management for Vim based on Emacs’ Org-Mode”

.. code-block:: vim

    call dein#add('jceb/vim-orgmode', {
        \ 'depends': ['NrrwRgn', 'SyntaxRange', 'calendar-vim', 'vim-repeat',
        \             'vim-speeddating'],
        \ 'on_ft': 'org',
    \ })

..

    “Ease your git workflow”

.. code-block:: vim

    call dein#add('jreybert/vimagit', {
        \ 'hook_post_source': s:airline_enable('vimagit'),
        \ 'if': s:has_git,
        \ 'on_cmd': 'Magit',
    \ })

..

    “Basic fzf integration”

.. code-block:: vim

    call dein#add('junegunn/fzf', {
        \ 'if': executable('fzf'),
        \ 'on_cmd': 'FZF',
        \ 'on_func': 'fzf#run',
    \ })

..

    “Advanced fzf integration”

.. code-block:: vim

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

.. code-block:: vim

    call dein#add('junegunn/goyo.vim', {
        \ 'on_cmd': 'Goyo',
    \ })

..

    “Emoji support”

.. code-block:: vim

    call dein#add('junegunn/vim-emoji', {
        \ 'on_func': 'emoji',
    \ })

..

    “Automatically resizes your windows”

.. code-block:: vim

    call dein#add('justincampbell/vim-eighties', {
        \ 'on_cmd': s:prefix('Eighties', ['Disable', 'Enable']),
    \ })

..

    “Motion improved”

.. code-block:: vim

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

.. code-block:: vim

    call dein#add('kalekundert/vim-coiled-snake', {
        \ 'if': has('folding'),
        \ 'on_ft': 'python',
    \ })

..

    “Create your own text objects”

.. code-block:: vim

    call dein#add('kana/vim-textobj-user', {
        \ 'on_func': 'textobj',
    \ })

nyancat. bah, grow up!

.. code-block:: vim

    call dein#add('koron/nyancat-vim', {
        \ 'on_cmd': s:prefix('Nyancat', ['', '2']),
    \ })

..

    “A plugin to place, toggle and display marks”

.. code-block:: vim

    call dein#add('kshenoy/vim-signature', {
        \ 'if': has('signs'),
    \ })

..

    “Language support for moonscript”

.. code-block:: vim

    call dein#add('leafo/moonscript-vim', {
        \ 'on_ft': 'moon',
    \ })

..

    “Language support for ledger”

.. code-block:: vim

    call dein#add('ledger/vim-ledger', {
        \ 'on_ft': 'ledger',
    \ })

..

    “Help read complex code by showing parentheses in different colours”

.. code-block:: vim

    call dein#add('luochen1990/rainbow')

..

    “Help for customising based on features”

.. code-block:: vim

    call dein#add('magus/localcfg')

..

    “A calendar window you can use within vim”

.. code-block:: vim

    call dein#add('mattn/calendar-vim', {
        \ 'on_cmd': s:suffix('Calendar', ['', 'H', 'T', 'VR']),
        \ 'on_map': {'n': '[calendar]'},
    \ })

..

    “Plugins for HTML and CSS hi-speed coding”

.. code-block:: vim

    call dein#add('mattn/emmet-vim', {
        \ 'if': v:version >= 700,
        \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ })

..

    “Display your undo history in a graph”

.. code-block:: vim

    call dein#add('mbbill/undotree', {
        \ 'if': v:version >= 700,
        \ 'on_cmd': 'UndotreeToggle',
    \ })

..

    “The fancy start screen”

.. code-block:: vim

    call dein#add('mhinz/vim-startify')

..

    “Text objects based on indent levels”

.. code-block:: vim

    call dein#add('michaeljsmith/vim-indent-object', {
        \ 'on_ft': ['ledger', 'moon', 'nim', 'python'],
        \ 'on_map': {'ov': ['aI', 'ai', 'iI', 'ii']},
    \ })

..

    “Order buffers in Most Recently Used order”

.. code-block:: vim

    call dein#add('mildred/vim-bufmru', {
        \ 'on_cmd': 'BufMRU',
        \ 'on_map': {'n': '[bufmru]'},
    \ })

..

    “Run your favorite search tool from Vim, with an enhanced results list”

.. code-block:: vim

    call dein#add('mileszs/ack.vim', {
        \ 'if': executable('ag'),
        \ 'on_cmd': ['Ack', 'LAck'],
    \ })

..

    “Language support for jinja”

.. code-block:: vim

    call dein#add('mitsuhiko/vim-jinja', {
        \ 'on_ft': 'jinja',
    \ })

..

    “Delete buffers without breaking your layout”

.. code-block:: vim

    call dein#add('moll/vim-bbye', {
        \ 'on_cmd': ['Bdelete', 'Bwipeout'],
        \ 'on_map': {'n': '<LocalLeader>q'},
    \ })

..

    “A plugin for visually displaying indent levels”

.. code-block:: vim

    call dein#add('nathanaelkane/vim-indent-guides')

..

    “Filetype plugin for beancount files”

.. code-block:: vim

    call dein#add('nathangrigg/vim-beancount', {
        \ 'on_ft': 'beancount',
    \ })

..

    “Tiny replacement for Supertab”

.. code-block:: vim

    call dein#add('neitanod/vim-clevertab')

..

    “Allow transparent calls to Python functions in native Vim scripts”

.. code-block:: vim

    call dein#add('nvie/vim_bridge', {
        \ 'on_cmd': 'python',
    \ })

..

    “HTML5 + inline SVG omnicomplete function, indent and syntax”

.. code-block:: vim

    call dein#add('othree/html5.vim', {
        \ 'on_ft': 'html',
    \ })

..

    “Better support for typographic (‘curly’) quote characters”

.. code-block:: vim

    call dein#add('reedes/vim-textobj-quote', {
        \ 'depends': 'vim-textobj-user',
        \ 'on_cmd': 'ToggleEducate',
        \ 'on_ft': ['gitcommit', 'mail', 'rst', 'text'],
    \ })

..

    “Make working with the quickfix list/window smoother”

.. code-block:: vim

    call dein#add('romainl/vim-qlist', {
        \ 'if': has('quickfix'),
        \ 'on_cmd': s:suffix('list', ['D', 'I']),
        \ 'on_map': {'n': ['[D', ']D', 'I', ']I']},
    \ })

..

    “More pleasant editing on commit message”

.. code-block:: vim

    call dein#add('rhysd/committia.vim', {
        \ 'if': s:has_git,
    \ })

..

    “Show cyclomatic complexity of Python code”

.. code-block:: vim

    call dein#add('rubik/vim-radon', {
        \ 'if': has('signs') && has('pythonx'),
        \ 'on_cmd': 'Radon',
        \ 'on_ft': 'python',
    \ })

..

    “Graph your undo tree”

.. code-block:: vim

    call dein#add('sjl/gundo.vim', {
        \ 'if': has('pythonx') && v:version >= 703,
        \ 'on_cmd': 'GundoToggle',
    \ })

..

    “Plugin for resolving conflicts during three-way merges”

.. code-block:: vim

    call dein#add('sjl/splice.vim', {
        \ 'on_cmd': 'SpliceInit',
    \ })

..

    “Smart space key”

.. code-block:: vim

    call dein#add('spiiph/vim-space', {
        \ 'on_map': {'n': '<space>'},
    \ })

..

    “Tiled Window Management for Vim”

.. code-block:: vim

    call dein#add('JNRowe/dwm.vim', {
        \ 'on_func': s:prefix('DWM_', ['Close', 'Focus', 'New', 'Rotate']),
    \ })

..

    “Linter for vim script”

.. code-block:: vim

    call dein#add('syngan/vim-vimlint', {
        \ 'depends': 'vim-vimlparser',
        \ 'on_cmd': 'VimLint',
        \ 'on_ft': 'vim',
    \ })

..

    “Maximizes and restores the current window”

.. code-block:: vim

    call dein#add('szw/vim-maximizer', {
        \ 'on_cmd': 'MaximizerToggle',
        \ 'on_map': {'n': '<C-w>o'},
    \ })

..

    “Incremental visual selection”

.. code-block:: vim

    call dein#add('terryma/vim-expand-region', {
        \ 'on_map': {'nv': ['+', '-']},
    \ })

..

    “True Sublime Text multiple selection”

.. code-block:: vim

    call dein#add('terryma/vim-multiple-cursors', {
        \ 'on_map': '<C-n>',
    \ })

..

    “Look up word definitions with wordnet”

.. code-block:: vim

    call dein#add('timcharper/wordnet.vim', {
        \ 'if': executable('wn'),
        \ 'on_map': '<Leader>wn',
    \ })

..

    “Vim port of the monokai theme for TextMate”

.. code-block:: vim

    call dein#add('tomasr/molokai')

..

    “Easy text exchange operator”

.. code-block:: vim

    call dein#add('tommcdo/vim-exchange', {
        \ 'on_map': {
        \   'n': 'cx',
        \   'v': 'X',
        \ },
    \ })

..

    “Defines a code alignment operator”

.. code-block:: vim

    call dein#add('tommcdo/vim-lion', {
        \ 'on_map': {'n': ['gl', 'gL']},
    \ })

..

    “Language friendly searches, substitutions, and abbreviations”

.. code-block:: vim

    call dein#add('tpope/vim-abolish', {
        \ 'on_cmd': ['Abolish', 'S'],
        \ 'on_map': {'n': 'cr'},
    \ })

..

    “Comment stuff out”

.. code-block:: vim

    call dein#add('tpope/vim-commentary', {
        \ 'on_cmd': 'Commentary',
        \ 'on_map': 'gc',
    \ })

..

    “Automatically insert block closing structures”

.. code-block:: vim

    call dein#add('tpope/vim-endwise', {
        \ 'on_event': 'InsertEnter',
    \ })

..

    “A Git wrapper so awesome, it should be illegal”

.. code-block:: vim

    call dein#add('tpope/vim-fugitive', {
        \ 'if': s:has_git,
    \ })

..

    “JSON manipulation and pretty printing”

.. code-block:: vim

    call dein#add('tpope/vim-jdaddy', {
        \ 'on_ft': 'json',
    \ })

..

    “Continuously updated session files”

.. code-block:: vim

    call dein#add('tpope/vim-obsession', {
        \ 'hook_post_source': s:airline_enable('obsession'),
        \ 'on_cmd': 'Obsession',
    \ })

..

    “Project configuration”

.. code-block:: vim

    call dein#add('tpope/vim-projectionist')

..

    “Repeat for plugin maps”

.. code-block:: vim

    call dein#add('tpope/vim-repeat')

..

    “If fugitive.vim is the Git, rhubarb.vim is the Hub”

.. code-block:: vim

    call dein#add('tpope/vim-rhubarb', {
        \ 'depends': 'vim-fugitive',
        \ 'if': s:has_git,
    \ })

..

    “Readline style insertion”

.. code-block:: vim

    call dein#add('tpope/vim-rsi', {
        \ 'on_event': ['CmdlineEnter', 'InsertEnter'],
    \ })

..

    “One step above ``nocompatible`` mode”

.. code-block:: vim

    call dein#add('tpope/vim-sensible', {
        \ 'rev': 'v1.2',
    \ })

.. note::

    This is pinned as it can massively affect functionality, see
    tpope/vim-sensible@2c57c5f4 for an example.

..

    “Heuristically set buffer options”

.. code-block:: vim

    call dein#add('tpope/vim-sleuth', {
        \ 'on_cmd': 'Sleuth',
    \ })

..

    “Increment dates, times, and more”

.. code-block:: vim

    call dein#add('tpope/vim-speeddating', {
        \ 'depends': 'vim-repeat',
        \ 'on_map': {'n': ['<C-a>', '<C-x>']},
    \ })

..

    “Plugin for deleting, changing, and adding “surroundings””

.. code-block:: vim

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

.. code-block:: vim

    call dein#add('tpope/vim-unimpaired')

..

    “1ms could mean the difference between life and death”

.. code-block:: vim

    call dein#add('tweekmonster/startuptime.vim', {
        \ 'on_cmd': 'StartupTime',
    \ })

..

    “Lean & mean status/tabline for vim that’s light as air”

.. code-block:: vim

    call dein#add('vim-airline/vim-airline', {
        \ 'depends': [
        \   'vim-airline-themes',
        \   'vim-fugitive',
        \ ],
    \ })

..

    “Official theme repository for vim-airline”

.. code-block:: vim

    call dein#add('vim-airline/vim-airline-themes')

..

    ““inner line” text object”

.. code-block:: vim

    call dein#add('vim-utils/vim-line', {
        \ 'on_map': {'ov': '_'},
    \ })

..

    “Enhanced man support”

.. code-block:: vim

    call dein#add('vim-utils/vim-man', {
        \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
    \ })

..

    “Motions to move a cursor without changing the column”

.. code-block:: vim

    call dein#add('vim-utils/vim-vertical-move', {
        \ 'on_map': ['[v', ']v'],
    \ })

..

    “A personal wiki”

.. code-block:: vim

    call dein#add('vimwiki/vimwiki', {
        \ 'on_cmd': s:prefix('Vimwiki', ['DiaryIndex', 'Index', 'MakeDiaryNote']),
        \ 'on_ft': 'vimwiki',
    \ })

..

    “Provides additional text objects”

.. code-block:: vim

    call dein#add('wellle/targets.vim')

..

    “Asynchronous Lint Engine”

.. code-block:: vim

    call dein#add('w0rp/ale', {
        \ 'if': v:version >= 800 && has('signs'),
    \ })

..

    “Miscellaneous auto-load Vim scripts”

.. code-block:: vim

    call dein#add('xolox/vim-misc', {
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

.. include:: .includes/lazy_rdep.rst

..

    “Easy note taking in Vim”

.. code-block:: vim

    call dein#add('xolox/vim-notes', {
        \ 'depends': 'vim-misc',
        \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
        \ 'on_map': {'ov': '<LocalLeader>en'},
    \ })

..

    “Nim language support”

.. code-block:: vim

    call dein#add('zah/nim.vim', {
        \ 'if': executable('nim'),
        \ 'on_ft': 'nim',
    \ })

..

    “Vimscript parser”

.. code-block:: vim

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

.. code-block:: vim

    call dein#add('vim-scripts/DotOutlineTree', {
        \ 'on_ft': ['mail', 'rst'],
    \ })

..

    “Set up regions within a buffer using their own filetypes”

.. code-block:: vim

    call dein#add('vim-scripts/SyntaxRange', {
        \ 'on_cmd': s:prefix('Syntax', ['Ignore', 'Include']),
    \ })

..

    “Toggle values under the cursor”

.. code-block:: vim

    call dein#add('vim-scripts/Toggle', {
        \ 'on_func': 'Toggle',
        \ 'on_map': {
        \   'i': '<C-T>',
        \   'n': '+',
        \ },
    \ })

..

    “Highlight BNFs”

.. code-block:: vim

    call dein#add('vim-scripts/bnf.vim', {
        \ 'on_ft': 'bnf',
    \ })

..

    “Extended BNF (ISO/IEC 14977) Syntax”

.. code-block:: vim

    call dein#add('vim-scripts/ebnf.vim', {
        \ 'on_ft': 'ebnf',
    \ })

..

    “Painless footer references”

.. code-block:: vim

    call dein#add('vim-scripts/uri-ref', {
        \ 'on_ft': 'mail',
    \ })

Nasty bundled packages
----------------------

These packages are being removed, either by finding a usable remote location or
by deletion.

.. code-block:: vim

    call dein#local('~/.vim/internal/', {
        \ 'on_cmd': 'Snip',
    \ })
