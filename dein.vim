" vim: set isfname-=/:
" Above modeline is so that ':Exconfig <C-r><C-f>' works

scriptencoding utf-8

" Note: I record requirements even when they're clearly met because I like to
" know what /may/ break if I make changes.  For example, version checks for
" cases where dein wouldn't work anyway or using "has('patch-x.x.x')" for
" versions prior to 7.4.237.

let g:vcs_cst = dein#util#_get_type('vcs_cst') != {}

" A dark powered Vim/Neovim plugin manager
call dein#add(expand('~/.vim/external/dein.vim'))

" Move an item in a delimiter-separated list left or right
call dein#add('AndrewRadev/sideways.vim', {
    \ 'on_cmd': ['SidewaysLeft', 'SidewaysRight'],
    \ 'on_map': [['n', '[sideways]']],
\ })

" Switch between single-line and multiline forms of code
call dein#add('AndrewRadev/splitjoin.vim', {
    \ 'on_cmd': ['SplitjoinJoin', 'SplitjoinSplit'],
    \ 'on_map': [['n', 'gJ', 'gS']],
\ })

" Tango inspired colourscheme
call dein#add('JNRowe/vim-jnrowe')

" Speed up folding by reducing recalculations
call dein#add('Konfekt/FastFold', {
    \ 'if': has('folding'),
\ })

" Automatic closing of quotes, parenthesis, brackets, etc
call dein#add('Raimondi/delimitMate', {
    \ 'on_event': 'InsertEnter',
\ })

" Context sensitive filetypes
" Note: Lazy loaded for rdeps hooks
call dein#add('Shougo/context_filetype.vim', {
    \ 'on_map': [['iv', '<C-k>']],
    \ 'if': v:version >= 704,
\ })

" A dark powered plugin for Neovim/Vim to unite all interfaces
call dein#add('Shougo/denite.nvim', {
    \ 'if': has('python3') && v:version >= 800,
\ })

" Adds snippet support to Vim
call dein#add('Shougo/neosnippet', {
    \ 'depends': ['context_filetype.vim', 'neosnippet-snippets'],
    \ 'hook_post_source': 'call Neosnippet_Map()',
    \ 'on_ft': 'neosnippet',
    \ 'on_map': [['iv', '<C-k>']],
    \ 'if': v:version >= 704,
\ })

" The standard snippets repository for neosnippet
" Note: Lazy loaded for rdeps hooks
call dein#add('Shougo/neosnippet-snippets', {
    \ 'on_map': [['iv', '<C-k>']],
    \ 'if': v:version >= 704,
\ })

" Asynchronous execution plugin
" Note: Lazy loaded for rdeps hooks
call dein#add('Shougo/vimproc', {
    \ 'build': 'make',
    \ 'on_cmd': ['VBGstartGBB', 'VBGstartLLDB', 'VBGstartPDB3'],
    \ 'on_func': 'vebugger',
\ })

" Super simple, super minimal, super light-weight tab-completion
call dein#add('ajh17/VimCompletesMe', {
    \ 'on_map': [['i', '<Tab>']],
\ })

" Highlights whitespace at the end of lines
call dein#add('bitc/vim-bad-whitespace', {
    \ 'on_cmd': [
    \   'EraseBadWhitespace',
    \   'HideBadWhitespace',
    \   'ToggleBadWhitespace'
    \ ],
    \ 'on_event': 'InsertEnter',
\ })

" Colour colournames and codes
" Note: The filetype hooks are *my* hooks.  I often want highlighting in vim
" files because I’m always editing my colourscheme, but I don’t need it for
" C in general because it is relatively uncommon for my C file to actually be
" dwm’s config.h.
call dein#add('chrisbra/Colorizer', {
    \ 'on_cmd': ['ColorHighlight', 'ColorToggle', 'RGB2Term'],
    \ 'on_ft': ['css', 'less', 'moon', 'python', 'vim', 'xdefaults'],
\ })

" A narrow region plugin (similar to Emacs)
call dein#add('chrisbra/NrrwRgn', {
    \ 'hook_post_source': 'let g:airline_extensions += ["nrrwrgn"]',
    \ 'if': v:version >= 704,
    \ 'on_cmd': ['NUD', 'NR', 'NW']
\ })

" Show differences for recovered files
call dein#add('chrisbra/Recover.vim', {
    \ 'if': v:version >= 703,
\ })

" Record and replay your editing sessions
call dein#add('chrisbra/Replay', {
    \ 'on_cmd': ['ListRecords', 'ScreenCapture', 'StartRecord'],
\ })

" Save signs across sessions
call dein#add('chrisbra/SaveSigns.vim', {
    \ 'if': has('signs'),
    \ 'on_cmd': 'SaveSigns',
\ })

" A filetype plugin for CSV files
call dein#add('chrisbra/csv.vim', {
    \ 'on_ft': 'csv',
\ })

" A plugin for handling unicode and digraphs characters
call dein#add('chrisbra/unicode.vim', {
    \ 'hook_post_source': 'let g:airline_extensions += ["unicode"]',
    \ 'if': v:version >= 704,
    \ 'on_cmd': ['DigraphNew', 'Digraphs', 'UnicodeSearch', 'UnicodeName',
    \            'UnicodeTable'],
    \ 'on_map': [
    \   ['i', '<C-x><C-z>', '<C-x><C-g>'],
    \   ['n', '<Plug>(UnicodeGA)'],
    \ ],
\ })

" The vim FAQ
call dein#add('chrisbra/vim_faq', {
    \ 'if': v:version >= 600,
\ })

" A secure alternative to modelines
call dein#add((g:vcs_cst ? 'vcs_cst::JNRowe' : 'ciaranm') . '/securemodelines')

" A VIM binding to the jedi autocompletion library
call dein#add('davidhalter/jedi-vim', {
    \ 'if': has('python'),
    \ 'on_cmd': 'JediClearCache',
    \ 'on_ft': 'python',
\ })

" An awesome automatic table creator & formatter
call dein#add('dhruvasagar/vim-table-mode', {
    \ 'on_cmd': ['TableModeToggle', 'Tableize'],
    \ 'on_ft': 'rst',
    \ 'on_map': [['nx', '<LocalLeader>t']],
\ })

" Automated Bullet Lists in Vim
call dein#add('dkarter/bullets.vim', {
    \ 'hook_post_source': 'let g:bullets_enabled_file_types += ["rst"]',
    \ 'on_ft': ['gitcommit', 'rst'],
\ })

" Better rainbow parentheses
call dein#add('eapache/rainbow_parentheses.vim')

" The EditorConfig plugin
call dein#add('editorconfig/editorconfig-vim', {
    \ 'if': has('python'),
    \ 'on_event': 'InsertEnter',
\ })

" Cute conceal support for Python
call dein#add('ehamberg/vim-cute-python', {
    \ 'if': has('conceal') && v:version >= 703,
    \ 'rev': 'moresymbols',
\ })

" Sum numbers that appear in selection
call dein#add('elazar/visSum.vim', {
    \ 'on_map': [['x', '<LocalLeader>su']],
\ })

" An implementation of the PlainTasks format
call dein#add('elentok/plaintasks.vim', {
    \ 'on_ft': 'plaintasks',
\ })

" Allows you to test regular expressions
call dein#add('ervandew/regex', {
    \ 'on_cmd': 'Regex',
\ })

" Show cyclomatic complexity of Python code
call dein#add('garybernhardt/pycomplexity', {
    \ 'if': has('signs') && has('python'),
    \ 'on_cmd': 'Complexity',
    \ 'on_ft': 'python',
    \ 'rtp': 'pycomplexity.vim',
\ })

" Configurable, flexible, intuitive text aligning
call dein#add('godlygeek/tabular', {
    \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
\ })

" All 256 xterm colors with their RGB equivalents
call dein#add('guns/xterm-color-table.vim', {
    \ 'on_cmd': ['XtermColorTable', 'VXtermColorTable'],
\ })

" Utility comamnds for dein.vim
call dein#add('haya14busa/dein-command.vim', {
    \ 'on_cmd': 'Dein',
\ })

" All powerful Pythonic task runner
call dein#add('idanarye/vim-omnipytent', {
    \ 'if': has('python') || has('python3'),
    \ 'on_cmd': ['OPedit', 'OP2edit', 'OP3edit']
\ })

" Yet another debugger frontend plugin
call dein#add('idanarye/vim-vebugger', {
    \ 'depends': 'vimproc',
    \ 'on_cmd': ['VBGstartGDB', 'VBGstartLLDB', 'VBGstartPDB3'],
    \ 'on_func': 'vebugger',
\ })

" Regex powered yank and substitute
call dein#add('idanarye/vim-yankitute', {
    \ 'on_cmd': 'Yankitute',
\ })

" Meson build system support
call dein#add('igankevich/mesonic', {
    \ 'on_cmd': 'MesonInit',
\ })

" Underline the word under the cursor
call dein#add('itchyny/vim-cursorword')

" Highlight matching parenthesis
call dein#add('itchyny/vim-parenmatch')

" Transparent editing of gpg encrypted files
call dein#add('jamessan/vim-gnupg', {
    \ 'if': executable('gpg') || executable('gpg2'),
\ })

" Edit and store quickfix/location list entries
call dein#add('jceb/vim-editqf', {
    \ 'if': has('quickfix'),
    \ 'on_cmd': [
    \   'LocAddNote', 'LocLoad', 'LocSave',
    \   'QFAddNote', 'QFLoad', 'QFSave'
    \ ],
    \ 'on_map': [['n', '<LocalLeader>n']],
\ })

" Text outlining and task management for Vim based on Emacs' Org-Mode
call dein#add('jceb/vim-orgmode', {
    \ 'depends': ['NrrwRgn', 'SyntaxRange', 'calendar-vim', 'vim-repeat',
    \             'vim-speeddating'],
    \ 'on_ft': 'org',
\ })

" Ease your git workflow
call dein#add('jreybert/vimagit', {
    \ 'hook_post_source': 'let g:airline_extensions += ["vimagit"]',
    \ 'if': executable('git'),
    \ 'on_cmd': 'Magit',
\ })

" Distraction-free writing in Vim.
call dein#add('junegunn/goyo.vim', {
    \ 'on_cmd': 'Goyo',
\ })

" Emoji support
call dein#add('junegunn/vim-emoji', {
    \ 'on_func': 'emoji',
\ })

" Automatically resizes your windows
call dein#add('justincampbell/vim-eighties', {
    \ 'on_cmd': ['EightiesDisable', 'EightiesEnable'],
\ })

" Motion improved
call dein#add('justinmk/vim-sneak', {
    \ 'depends': 'vim-repeat',
    \ 'if': v:version >= 703,
    \ 'on_map': [
    \   ['n', 'S', 's'],
    \   ['o', 'Z', 'z'],
    \   ['x', 'Z', 's'],
    \ ],
\ })

" Create your own text objects
call dein#add('kana/vim-textobj-user', {
    \ 'on_func': 'textobj',
\ })

" nyancat. bah, grow up!
call dein#add('koron/nyancat-vim', {
    \ 'on_cmd': 'Nyancat',
\ })

" A plugin to place, toggle and display marks
call dein#add('kshenoy/vim-signature', {
    \ 'if': has('signs'),
\ })

" Language support for moonscript
call dein#add('leafo/moonscript-vim', {
    \ 'on_ft': 'moon',
\ })

" Language support for ledger
call dein#add('ledger/vim-ledger', {
    \ 'on_ft': 'ledger',
\ })

" Help for customising based on features
call dein#add('magus/localcfg')

" A calendar window you can use within vim
call dein#add('mattn/calendar-vim', {
    \ 'on_cmd': ['Calendar', 'CalendarH', 'CalendarT', 'CalendarVR'],
    \ 'on_map': [['n', '<Leader>cal', '<Leader>caL']],
\ })

" Plugins for HTML and CSS hi-speed coding
call dein#add('mattn/emmet-vim', {
    \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ 'if': v:version >= 700,
\ })

" Display your undo history in a graph
call dein#add('mbbill/undotree', {
    \ 'if': v:version >= 700,
    \ 'on_cmd': 'UndotreeToggle',
\ })

" Use signs to indicate VCS state
call dein#add('mhinz/vim-signify', {
    \ 'if': has('signs') && (executable('git') || executable('hg')),
\ })

" The fancy start screen.
call dein#add('mhinz/vim-startify')

" Text objects based on indent levels
call dein#add('michaeljsmith/vim-indent-object', {
    \ 'on_ft': ['ledger', 'moon', 'nim', 'python'],
    \ 'on_map': [['ov', 'aI', 'ai', 'iI', 'ii']],
\ })

" Order buffers in Most Recently Used order
call dein#add('mildred/vim-bufmru', {
    \ 'on_cmd': 'BufMRU',
    \ 'on_map': [['n', '[bufmru]']],
\ })

" Run your favorite search tool from Vim, with an enhanced results list
call dein#add('mileszs/ack.vim', {
    \ 'if': executable('ag'),
    \ 'on_cmd': ['Ack', 'LAck'],
\ })

" Language support for jinja
call dein#add('mitsuhiko/vim-jinja', {
    \ 'on_ft': 'jinja',
\ })

" delete buffers without breaking your layout
call dein#add('moll/vim-bbye', {
    \ 'on_cmd': 'Bdelete',
    \ 'on_map': [['n', '<LocalLeader>q']],
\ })

" Refreshingly sane ``cursorcolumn`` and ``cursorline`` handling
call dein#add('mtth/cursorcross.vim')

" A plugin for visually displaying indent levels
call dein#add('nathanaelkane/vim-indent-guides')

" Allow transparent calls to Python functions in native Vim scripts
call dein#add('nvie/vim_bridge', {
    \ 'on_cmd': 'python',
\ })

" HTML5 + inline SVG omnicomplete function, indent and syntax
call dein#add('othree/html5.vim', {
    \ 'on_ft': 'html',
\ })

" Better support for typographic (‘curly’) quote characters
call dein#add('reedes/vim-textobj-quote', {
    \ 'depends': 'vim-textobj-user',
    \ 'on_cmd': 'ToggleEducate',
    \ 'on_ft': ['mail', 'rst', 'text'],
\ })

" Make working with the quickfix list/window smoother
call dein#add('romainl/vim-qf', {
    \ 'if': has('quickfix'),
    \ 'on_cmd': [
    \   'ListLists', 'LoadList', 'SaveList',
    \   'Keep', 'Reject',
    \ ],
\ })

" Make working with the quickfix list/window smoother
call dein#add('romainl/vim-qlist', {
    \ 'if': has('quickfix'),
    \ 'on_cmd': ['Dlist', 'Ilist'],
    \ 'on_map': [['n', '[D', ']D', 'I', ']I']],
\ })

" More pleasant editing on commit message
call dein#add('rhysd/committia.vim', {
    \ 'if': executable('git'),
\ })

" Graph your undo tree
call dein#add('sjl/gundo.vim', {
    \ 'if': v:version >= 700,
    \ 'on_cmd': 'GundoToggle',
\ })

" Plugin for resolving conflicts during three-way merges
call dein#add('sjl/splice.vim', {
    \ 'on_cmd': 'SpliceInit',
\ })

" Smart space key
call dein#add('spiiph/vim-space', {
    \ 'on_map': [['n', '<space>']],
\ })

" Tiled Window Management for Vim
call dein#add('spolu/dwm.vim', {
    \ 'on_func': ['DWM_Focus', 'DWM_New', 'DWM_Rotate'],
\ })

" Linter for vim script
call dein#add('syngan/vim-vimlint', {
    \ 'depends': 'vim-vimlparser',
    \ 'on_cmd': 'VimLint',
    \ 'on_ft': 'vim',
\ })

" Maximizes and restores the current window
call dein#add('szw/vim-maximizer', {
    \ 'on_cmd': 'MaximizerToggle',
    \ 'on_map': [['n', '<C-w>o']],
\ })

" Incremental visual selection
call dein#add('terryma/vim-expand-region', {
    \ 'on_map': [['nv', '+', '-']],
\ })

" True Sublime Text multiple selection
call dein#add('terryma/vim-multiple-cursors', {
    \ 'on_map': [['nx', '<C-n>']],
\ })

" Vim port of the monokai theme for TextMate
call dein#add('tomasr/molokai')

" Defines a code alignment operator
call dein#add('tommcdo/vim-lion', {
    \ 'on_map': ['gl', 'gL'],
\ })

" Comment stuff out
call dein#add('tpope/vim-commentary', {
    \ 'on_cmd': 'Commentary',
    \ 'on_map': 'gc',
\ })

" A Git wrapper so awesome, it should be illegal
call dein#add('tpope/vim-fugitive', {
    \ 'if': executable('git'),
\ })

" JSON manipulation and pretty printing
call dein#add('tpope/vim-jdaddy', {
    \ 'on_ft': 'json',
\ })

" Continuously updated session files
call dein#add('tpope/vim-obsession', {
    \ 'hook_post_source': 'let g:airline_extensions += ["obsession"]',
    \ 'on_cmd': 'Obsession',
\ })

" Project configuration
call dein#add('tpope/vim-projectionist')

" Repeat for plugin maps
call dein#add('tpope/vim-repeat')

" If fugitive.vim is the Git, rhubarb.vim is the Hub
call dein#add('tpope/vim-rhubarb', {
    \ 'depends': 'vim-fugitive',
    \ 'hook_post_source': 'let g:github_password = systemlist("pass github.com")[0]',
    \ 'if': executable('curl') && executable('git'),
    \ 'on_cmd': 'Gbrowse',
    \ 'on_ft': 'gitcommit',
    \ 'on_map': [['i', '<C-x><C-o>']],
\ })

" One step above 'nocompatible' mode
"
" This is pinned as it can massively affect functionality, see
" tpope/vim-sensible@2c57c5f4 for an example.
call dein#add('tpope/vim-sensible', {
    \ 'rev': '49ee3642',
\ })

" Heuristically set buffer options
call dein#add('tpope/vim-sleuth', {
    \ 'on_cmd': 'Sleuth',
\ })

" Increment dates, times, and more
call dein#add('tpope/vim-speeddating', {
    \ 'depends': 'vim-repeat',
    \ 'on_map': ['n', '<C-a>', '<C-x>'],
\ })

" Plugin for deleting, changing, and adding “surroundings”
call dein#add('tpope/vim-surround', {
    \ 'depends': 'vim-repeat',
    \ 'on_map': [
    \   ['i', '<C-G>S', '<C-G>s', '<C-s>'],
    \   ['n', 'cS', 'cs', 'ds', 'yS', 'ys'],
    \   ['x', 'S'],
    \ ],
\ })

" Pairs of handy mappings
call dein#add('tpope/vim-unimpaired')

" 1ms could mean the difference between life and death
call dein#add('tweekmonster/startuptime.vim', {
    \ 'on_cmd': 'StartupTime',
\ })

" Lean & mean status/tabline for vim that's light as air
call dein#add('vim-airline/vim-airline', {
    \ 'depends': [
    \   'denite.nvim',
    \   'vim-airline-themes',
    \   'vim-signify',
    \   'vim-fugitive',
    \ ],
\ })

" Official theme repository for vim-airline
call dein#add('vim-airline/vim-airline-themes')

" Mappings that boost command line mode
call dein#add('vim-utils/vim-husk')

" “inner line” text object
call dein#add('vim-utils/vim-line', {
    \ 'on_map': [['ov', '_']],
\ })

" Enhanced man support
call dein#add('vim-utils/vim-man', {
    \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
\ })

" Motions to move a cursor without changing the column
call dein#add('vim-utils/vim-vertical-move', {
    \ 'on_map': ['[v', ']v'],
\ })

" Provides additional text objects
call dein#add('wellle/targets.vim')

" Asynchronous Lint Engine
call dein#add('w0rp/ale', {
    \ 'if': v:version >= 800 && has('signs'),
\ })

" Miscellaneous auto-load Vim scripts
" Note: Lazy loaded for rdeps hooks
call dein#add('xolox/vim-misc', {
    \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
    \ 'on_map': [['ov', '<LocalLeader>en']],
\ })

" Easy note taking in Vim
call dein#add('xolox/vim-notes', {
    \ 'depends': 'vim-misc',
    \ 'on_cmd': ['NoteFromSelectedText', 'Note', 'SearchNotes'],
    \ 'on_map': [['ov', '<LocalLeader>en']],
\ })

" vim-scripts bundles {{{

" Set up regions within a buffer using their own filetypes
call dein#add('vim-scripts/SyntaxRange', {
    \ 'on_cmd': ['SyntaxIgnore', 'SyntaxInclude'],
\ })

" Toggle values under the cursor
call dein#add('vim-scripts/Toggle', {
    \ 'on_func': 'Toggle',
    \ 'on_map': [
    \   ['i', '<C-T>'],
    \   ['n', '+'],
    \ ],
\ })

" Highlight BNFs
call dein#add('vim-scripts/bnf.vim', {
    \ 'on_ft': 'bnf',
\ })

" Extended BNF (ISO/IEC 14977) Syntax
call dein#add('vim-scripts/ebnf.vim', {
    \ 'on_ft': 'ebnf',
\ })

" Extended support for GNU gettext
call dein#add('vim-scripts/po.vim--Jelenak', {
    \ 'on_ft': 'po',
\ })

" Painless footer references
call dein#add('vim-scripts/uri-ref', {
    \ 'on_ft': 'mail',
\ })
" }}}

" Vimscript parser
" Note: Lazy loaded for rdeps hooks
call dein#add('ynkdir/vim-vimlparser', {
    \ 'on_cmd': 'VimLint',
    \ 'on_ft': 'vim',
\ })

" Nasty bundled packages {{{
" These packages are being removed, either by finding a usable remote location
" or by deletion.

call dein#local('~/.vim/internal/', {
    \ 'on_cmd': 'Snip',
\ })

" }}}
