" vim: set isfname-=/:
" Above modeline is so that ':Exconfig <C-r><C-f>' works

" Note: I record requirements even when they're clearly met because I like to
" know what /may/ break if I make changes.  For example, version checks for
" cases where dein wouldn't work anyway or using "has('patch-x.x.x')" for
" versions prior to 7.4.237.

let g:vcs_cst = dein#util#_get_type('vcs_cst') != {}

" A dark powered Vim/Neovim plugin manager
call dein#add(expand('~/.vim/external/dein.vim'))

" Motion support for ag.vim
call dein#add('Chun-Yang/vim-action-ag', {
    \ 'depends': 'ag.vim',
    \ 'if': executable('ag'),
    \ 'on_map': [['nv', 'gag']],
\ })

" Move an item in a delimiter-separated list left or right
call dein#add('AndrewRadev/sideways.vim', {
    \ 'on_cmd': ['SidewaysLeft', 'SidewaysRight'],
    \ 'on_map': [['n', '[sideways]']],
\ })

" Tango inspired colourscheme
call dein#add('JNRowe/vim-jnrowe')

" A much simpler way to use some motions in vim
call dein#add((g:vcs_cst ? 'vcs_cst::cstrager' : 'Lokaltog') . '/vim-easymotion', {
    \ 'if': v:version >= 704,
    \ 'on_map': '<Leader><Leader>',
\ })

" Speed up folding by reducing recalculations
call dein#add('Konfekt/FastFold')

" Automatic closing of quotes, parenthesis, brackets, etc
call dein#add('Raimondi/delimitMate', {
    \ 'on_event': 'InsertEnter',
\ })

" Context sensitive filetypes
call dein#add('Shougo/context_filetype.vim')

" Create junk files
call dein#add('Shougo/junkfile.vim')

" Syntax source for neocomplete
call dein#add('Shougo/neco-syntax', {
    \ 'if': has('lua'),
\ })

" Next generation of auto completion framework
call dein#add('Shougo/neocomplete.vim', {
    \ 'depends': ['neco-syntax', 'neopairs.vim'],
    \ 'if': has('lua') && has('patch-7.3.885'),
    \ 'on_event': 'InsertEnter',
\ })

" MRU plugin includes unite.vim MRU sources
call dein#add('Shougo/neomru.vim', {
    \ 'depends': 'unite.vim',
\ })

" Auto insert pairs neocomplete support
call dein#add('Shougo/neopairs.vim', {
    \ 'depends': 'neocomplete.vim',
    \ 'if': has('lua') && has('patch-7.4.774'),
    \ 'on_event': 'InsertEnter',
\ })

" Adds snippet support to Vim
call dein#add('Shougo/neosnippet', {
    \ 'depends': ['context_filetype.vim', 'neosnippet-snippets'],
    \ 'hook_post_source': 'call Neosnippet_Map()',
    \ 'on_ft': 'snippet',
    \ 'on_map': [['iv', '<C-k>']],
\ })

" The standard snippets repository for neosnippet
call dein#add('Shougo/neosnippet-snippets')

" Yank source for unite.vim
call dein#add('Shougo/neoyank.vim', {
    \ 'depends': 'unite.vim',
    \ 'on_path': '.*',
\ })

" Unite and create user interfaces
call dein#add('Shougo/unite.vim', {
    \ 'if': executable('xdg-open'),
\ })

" Outline source for unite.vim
call dein#add('Shougo/unite-outline', {
    \ 'depends': 'unite.vim',
    \ 'if': executable('ctags'),
\ })

" Powerful file explorer
call dein#add('Shougo/vimfiler.vim', {
    \ 'depends': 'unite.vim',
    \ 'on_cmd':  ['VimFiler', 'VimFilerDouble', 'VimFilerExplorer'],
    \ 'on_map': [['n', '<Plug>']],
    \ 'on_path': '.*',
\ })

" Asynchronous execution plugin
call dein#add('Shougo/vimproc', {
    \ 'build': 'make',
\ })

" Ultimate hex editing system
call dein#add('Shougo/vinarise.vim', {
    \ 'depends': 'unite.vim',
    \ 'on_cmd': 'Vinarise',
\ })

" Multi-language colour colouriser
call dein#add('ap/vim-css-color', {
    \ 'on_ft': ['css', 'less', 'moon', 'python', 'vim', 'xdefaults'],
\ })

" Highlights whitespace at the end of lines
call dein#add('bitc/vim-bad-whitespace', {
    \ 'on_cmd': ['HideBadWhitespace', 'ToggleBadWhitespace'],
    \ 'on_event': 'InsertEnter',
\ })

" An interface for Taskwarrior
call dein#add('blindFS/vim-taskwarrior', {
    \ 'depends': 'unite.vim',
    \ 'hook_post_source': 'let g:airline_extensions += ["taskwarrior"]',
    \ 'if': executable('task'),
    \ 'on_cmd': ['TW', 'TWEditTaskrc'],
\ })

" A narrow region plugin (similar to Emacs)
call dein#add('chrisbra/NrrwRgn', {
    \ 'if': v:version >= 704,
\ })

" Show differences for recovered files
call dein#add('chrisbra/Recover.vim', {
    \ 'if': v:version >= 703,
\ })

" A filetype plugin for CSV files
call dein#add('chrisbra/csv.vim', {
    \ 'on_ft': 'csv',
\ })

" A plugin for handling unicode and digraphs characters
call dein#add('chrisbra/unicode.vim', {
    \ 'hook_post_source': 'let g:airline_extensions += ["unicode"]',
    \ 'if': v:version >= 704,
    \ 'on_cmd': ['Digraphs', 'SearchUnicode', 'UnicodeName', 'UnicodeTable'],
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
    \ 'on_ft': 'python',
\ })

" An awesome automatic table creator & formatter
call dein#add('dhruvasagar/vim-table-mode', {
    \ 'on_cmd': ['TableModeToggle', 'Tableize'],
    \ 'on_ft': 'rst',
    \ 'on_map': [['nx', '<Leader>t']],
\ })

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

" An implementation of the PlainTasks format
call dein#add('elentok/plaintasks.vim')

" Enhanced JSON support
call dein#add('elzr/vim-json')

" Allows you to test regular expressions
call dein#add('ervandew/regex', {
    \ 'on_cmd': 'Regex',
\ })

" Vala language support
call dein#add('fishman/vim-vala')

" Enhanced Markdown support
call dein#add('gabrielelana/vim-markdown')

" Configurable, flexible, intuitive text aligning
call dein#add('godlygeek/tabular', {
    \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
\ })

" All 256 xterm colors with their RGB equivalents
call dein#add('guns/xterm-color-table.vim', {
    \ 'on_cmd': ['XtermColorTable', 'VXtermColorTable'],
\ })

" Aims provide a nice interface for dealing with Git branches
call dein#add('idanarye/vim-merginal', {
    \ 'depends': 'vim-fugitive',
    \ 'on_cmd': ['Merginal', 'MerginalToggle'],
\ })

" Transparent editing of gpg encrypted files
call dein#add('jamessan/vim-gnupg', {
    \ 'if': executable('gpg'),
\ })

" Edit and store quickfix/location list entries
call dein#add('jceb/vim-editqf', {
    \ 'on_cmd': [
    \   'LocAddNote', 'LocLoad', 'LocSave',
    \   'QFAddNote', 'QFLoad', 'QFSave'
    \ ],
    \ 'on_map': [['n', '<Leader>n']],
\ })

" Editing support through autocompletion
call dein#add('jceb/vim-fastwordcompleter', {
    \ 'on_cmd': 'AutocompletionStart',
    \ 'on_ft': ['genie', 'python', 'vim'],
\ })

" Text outlining and task management for Vim based on Emacs' Org-Mode
call dein#add('jceb/vim-orgmode', {
    \ 'depends': ['NrrwRgn', 'SyntaxRange', 'calendar-vim', 'vim-repeat',
    \             'vim-speeddating'],
    \ 'on_ft': 'org',
\ })

" A git commit browser
call dein#add('junegunn/gv.vim', {
    \ 'depends': 'vim-fugitive',
    \ 'if': executable('git'),
    \ 'on_cmd': 'GV',
\ })

" Automatically resizes your windows
call dein#add('justincampbell/vim-eighties')

" Better rainbow parentheses
call dein#add('kien/rainbow_parentheses.vim')

" A plugin to place, toggle and display marks
call dein#add('kshenoy/vim-signature', {
    \ 'if': has('signs'),
\ })

" Language support for moonscript
call dein#add('leafo/moonscript-vim')

" Language support for ledger
call dein#add('ledger/vim-ledger')

" Help for customising based on features
call dein#add('magus/localcfg')

" A calendar window you can use within vim
call dein#add('mattn/calendar-vim', {
    \ 'on_cmd': ['Calendar', 'CalendarH', 'CalendarT', 'CalendarVR'],
    \ 'on_map': [['n', '<Leader>cal', '<leader>caL']],
\ })

" Plugins for HTML and CSS hi-speed coding
call dein#add('mattn/emmet-vim', {
    \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ 'if': v:version >= 700,
\ })

" An interface to web APIs
call dein#add('mattn/webapi-vim', {
    \ 'external_commanpd': 'curl',
    \ 'if': v:version >= 700,
\ })

" Use signs to indicate VCS state
call dein#add('mhinz/vim-signify', {
    \ 'if': executable('git'),
\ })

" Text objects based on indent levels
call dein#add('michaeljsmith/vim-indent-object', {
    \ 'on_ft': ['ledger', 'moon', 'python'],
    \ 'on_map': [['ov', 'aI', 'ai', 'iI', 'ii']],
\ })

" Language support for jinja
call dein#add('mitsuhiko/vim-jinja', {
    \ 'on_ft': 'jinja',
\ })

" Enhanced reST support
call dein#add('mitsuhiko/vim-rst')

" Comment on GitHub directly
call dein#add('mmozuras/vim-github-comment', {
    \ 'depends': 'webapi-vim',
    \ 'if': executable('git') && executable('xdg-open'),
    \ 'on_cmd': 'GHComment',
\ })

" delete buffers without breaking your layout
call dein#add('moll/vim-bbye', {
    \ 'on_cmd': 'Bdelete',
    \ 'on_map': [['n', '<Leader>q']],
\ })

" A plugin for visually displaying indent levels
call dein#add('nathanaelkane/vim-indent-guides')

" More pleasant editing on commit message
call dein#add('rhysd/committia.vim', {
    \ 'if': executable('git'),
\ })

" A plugin for the_silver_searcher
call dein#add('rking/ag.vim', {
    \ 'if': executable('ag'),
    \ 'on_cmd': ['Ag', 'AgBuffer'],
\ })

" Language support for rust
call dein#add('rust-lang/rust.vim', {
    \ 'on_ft': 'rust',
\ })

" Syntax checking on the fly
call dein#add((g:vcs_cst ? 'vcs_cst::JNRowe' : 'scrooloose') . '/syntastic', {
    \ 'if': has('quickfix'),
\ })

" Easily work with shell commands
call dein#add('sjl/clam.vim', {
    \ 'on_cmd': ['Clam', 'ClamVisual'],
\ })

" Graph your undo tree
call dein#add('sjl/gundo.vim', {
    \ 'on_cmd': 'GundoToggle',
\ })

" Smart space key
call dein#add('spiiph/vim-space', {
    \ 'on_map': [['n', '<space>']],
\ })

" Tiled Window Management for Vim
call dein#add('spolu/dwm.vim', {
    \ 'on_func': ['DWM_Focus', 'DWM_New', 'DWM_Rotate'],
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

" Project configuration
call dein#add('tpope/vim-projectionist')

" Repeat for plugin maps
call dein#add('tpope/vim-repeat')

" One step above 'nocompatible' mode
"
" This is pinned as it can massively affect functionality, see
" tpope/vim-sensible@2c57c5f4 for an example.
call dein#add('tpope/vim-sensible', {
    \ 'rev': '680a5c69',
\ })

" Increment dates, times, and more
call dein#add('tpope/vim-speeddating')

" Heuristically set buffer options
call dein#add('tpope/vim-sleuth')

" Plugin for deleting, changing, and adding "surroundings"
call dein#add('tpope/vim-surround', {
    \ 'on_map': [
    \   ['i', '<C-G>S', '<C-G>s', '<C-s>'],
    \   ['n', 'cS', 'cs', 'ds', 'yS', 'ys'],
    \   ['x', 'S'],
    \ ],
\ })

" Colourscheme source for unite.vim
call dein#add('ujihisa/unite-colorscheme', {
    \ 'depends': 'unite.vim',
\ })

" Lean & mean status/tabline for vim that's light as air
call dein#add('vim-airline/vim-airline', {
    \ 'depends': [
    \   'NrrwRgn',
    \   'syntastic',
    \   'vim-airline-themes',
    \   'vim-signify',
    \   'vim-fugitive',
    \ ],
\ })

" Official theme repository for vim-airline
call dein#add('vim-airline/vim-airline-themes')

" Mappings that boost command line mode
call dein#add('vim-utils/vim-husk')

" "inner line" text object
call dein#add('vim-utils/vim-line')

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

" vim-scripts bundles {{{

" Set up regions within a buffer using their own filetypes
call dein#add('SyntaxRange', {
    \ 'on_cmd': ['SyntaxIgnore', 'SyntaxInclude'],
\ })

" Toggle values under the cursor
call dein#add('Toggle', {
    \ 'on_func': 'Toggle',
    \ 'on_map': [
    \   ['i', '<C-T>'],
    \   ['n', '+'],
    \ ],
\ })

" Extended support for GNU gettext
call dein#add('po.vim--Jelenak')

" Painless footer references
call dein#add('uri-ref', {
    \ 'on_ft': 'mail',
\ })
" }}}

" Nasty bundled packages {{{
" These packages are being removed, either by finding a usable remote location
" or by deletion.
call dein#local("~/.vim/internal/", {
    \ 'on_cmd': 'Snip',
\ })
" }}}
