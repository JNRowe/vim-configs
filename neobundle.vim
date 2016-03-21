" vim: set isfname-=/:
" Above modeline is so that ':Econfig <C-r><C-f>' works

let g:vcs_cst = neobundle#config#get_types('vcs_cst') != {}
if !neobundle#load_cache('~/.vim/neobundle.vim')
    finish
end

NeoBundleFetch 'Shougo/neobundle.vim', {
    \ 'depends': 'vimproc',
    \ 'description': 'A next generation Vim plugin manager',
    \ 'vim_version': '7.2',
\ }

NeoBundleLazy 'AndrewRadev/sideways.vim', {
    \ 'description': 'Move an item in a delimiter-separated list left or right',
    \ 'on_cmd': ['SidewaysLeft', 'SidewaysRight'],
    \ 'on_map': [['n', '[sideways]']],
\ }

NeoBundle 'JNRowe/vim-jnrowe', {
    \ 'description': 'Tango inspired colourscheme',
    \ 'gui': 1,
\ }

NeoBundleLazy (g:vcs_cst ? 'vcs_cst::cstrager' : 'Lokaltog') . '/vim-easymotion', {
    \ 'description': 'A much simpler way to use some motions in vim',
    \ 'on_map': '<Leader><Leader>',
    \ 'vim_version': '7.4',
\ }

NeoBundleLazy 'Raimondi/delimitMate', {
    \ 'description': 'Automatic closing of quotes, parenthesis, brackets, etc',
    \ 'on_i': 1,
\ }

NeoBundleLazy 'Shougo/context_filetype.vim', {
    \ 'description': 'Context sensitive filetypes',
    \ 'on_i': 1,
\ }

NeoBundleLazy 'Shougo/junkfile.vim', {
    \ 'on_cmd': 'JunkfileOpen',
    \ 'description': 'Create junk files',
    \ 'on_unite': 'junkfile',
\ }

" Choose based on has('lua') {{{
NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'description': 'Next generation of auto completion framework',
    \ 'disabled': !has('lua'),
    \ 'on_i': 1,
    \ 'vim_version':'7.3.885',
\ }

NeoBundleLazy 'Shougo/neocomplcache', {
    \ 'description': 'Ultimate auto completion system for Vim',
    \ 'disabled': has('lua'),
    \ 'external_command': 'ctags',
    \ 'on_i': 1,
\ }
" }}}

NeoBundleLazy 'Shougo/neomru.vim', {
    \ 'description': 'MRU plugin includes unite.vim MRU sources',
    \ 'on_unite': 'neomru',
\ }

NeoBundleLazy 'Shougo/neosnippet', {
    \ 'depends': 'neosnippet-snippets',
    \ 'description': 'Adds snippet support to Vim',
    \ 'on_i': 1,
    \ 'on_map': [['iv', '<C-k>']],
\ }

NeoBundleLazy 'Shougo/neosnippet-snippets', {
    \ 'description': 'The standard snippets repository for neosnippet',
    \ 'on_i': 1,
\ }

NeoBundleLazy 'Shougo/neoyank.vim', {
    \ 'description': 'Yank source for unite.vim',
    \ 'on_unite': 'history/yank',
\ }

NeoBundle 'Shougo/unite.vim', {
    \ 'description': 'Unite and create user interfaces',
    \ 'external_command': 'xdg-open',
\ }

NeoBundleLazy 'Shougo/unite-outline', {
    \ 'depends': 'unite.vim',
    \ 'description': 'Outline source for unite.vim',
    \ 'external_command': 'ctags',
\ }

NeoBundleLazy 'Shougo/vimfiler.vim', {
    \ 'depends': 'unite.vim',
    \ 'description': 'Powerful file explorer',
    \ 'on_cmd': [
    \   {
    \       'name': ['VimFiler', 'VimFilerDouble'],
    \       'complete': 'customlist,vimfiler#complete',
    \   },
    \   'VimFilerExplorer',
    \ ],
    \ 'on_map': [['n', '<Plug>']],
    \ 'on_path': '.*',
\ }

NeoBundle 'Shougo/vimproc', {
    \ 'build': 'make',
    \ 'description': 'Asynchronous execution plugin',
\ }

NeoBundle 'airblade/vim-rooter', {
    \ 'description': "Identify project's root directory",
\ }

NeoBundleLazy 'bitc/vim-bad-whitespace', {
    \ 'description': 'Highlights whitespace at the end of lines',
    \ 'on_cmd': ['HideBadWhitespace', 'ToggleBadWhitespace'],
    \ 'on_i': 1,
\ }

NeoBundleLazy 'blindFS/vim-taskwarrior', {
    \ 'depends': 'unite.vim',
    \ 'description': 'An interface for Taskwarrior',
    \ 'external_command': 'task',
    \ 'on_cmd': ['TW', 'TWEditTaskrc'],
    \ 'on_unite': 'taskwarrior',
\ }
let s:bundle = neobundle#get('vim-taskwarrior')
function! s:bundle.hooks.on_post_source(bundle)
    let g:airline_extensions += ['taskwarrior']
endfunction

NeoBundle 'chrisbra/NrrwRgn', {
    \ 'description': 'A narrow region plugin (similar to Emacs)',
    \ 'vim_version': '7.4',
\ }

NeoBundle 'chrisbra/Recover.vim', {
    \ 'description': 'Show differences for recovered files',
    \ 'vim_version': '7.3',
\ }

NeoBundleLazy 'chrisbra/csv.vim', {
    \ 'description': 'A filetype plugin for CSV files',
    \ 'on_ft': 'csv',
\ }

NeoBundleLazy 'chrisbra/unicode.vim', {
    \ 'description': 'A plugin for handling unicode and digraphs characters',
    \ 'on_cmd': ['Digraphs', 'SearchUnicode', 'UnicodeName', 'UnicodeTable'],
    \ 'on_map': [
    \   ['i', '<C-x><C-z>', '<C-x><C-g>'],
    \   ['n', '<Plug>(UnicodeGA)'],
    \ ],
    \ 'vim_version': '7.4',
\ }
let s:bundle = neobundle#get('unicode.vim')
function! s:bundle.hooks.on_post_source(bundle)
    let g:airline_extensions += ['unicode']
endfunction

NeoBundle 'chrisbra/vim_faq', {
    \ 'description': 'The vim FAQ',
    \ 'vim_version': '6.0',
\ }

NeoBundle 'ciaranm/securemodelines', {
    \ 'description': 'A secure alternative to modelines',
\ }
let s:bundle = neobundle#get('securemodelines')
function! s:bundle.hooks.on_post_source(bundle)
    let g:secure_modelines_allowed_items += [
        \ "isfname", "isf",
        \ "spl",
        \ "scrolloff", "so",
    \ ]
endfunction

NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'description': 'A VIM binding to the jedi autocompletion library',
    \ 'disabled': !has('python'),
    \ 'on_ft': 'python',
\ }

NeoBundleLazy 'dhruvasagar/vim-table-mode', {
    \ 'description': 'An awesome automatic table creator & formatter',
    \ 'on_cmd': ['TableModeToggle', 'Tableize'],
    \ 'on_ft': 'rst',
    \ 'on_map': [['nx', '<Leader>t']],
\ }

NeoBundleLazy 'editorconfig/editorconfig-vim', {
    \ 'description': 'The EditorConfig plugin',
    \ 'disabled': !has('python'),
    \ 'on_i': 1,
\ }

NeoBundleLazy 'ehamberg/vim-cute-python', 'moresymbols', {
    \ 'description': 'Cute conceal support for Python',
    \ 'disabled': !has('conceal'),
    \ 'on_ft': 'python',
    \ 'vim_version': '7.3',
\ }

NeoBundleLazy 'elzr/vim-json', {
    \ 'description': 'Enhanced JSON support',
    \ 'on_ft': 'json',
\ }

NeoBundleLazy 'ervandew/regex', {
    \ 'description': 'Allows you to test regular expressions',
    \ 'on_cmd': [{
    \   'name': 'Regex',
    \   'complete': 'customlist,RegexComplete',
    \ }],
\ }

NeoBundleLazy 'ervandew/supertab', {
    \ 'description': 'Allows you to use <Tab> for insert completion',
    \ 'on_map': [['i', '<Tab>']],
\ }

NeoBundleLazy 'fishman/vim-vala', {
    \ 'description': 'Vala language support',
    \ 'on_ft': ['genie', 'vala', 'vapi'],
\ }

NeoBundleLazy 'gabrielelana/vim-markdown', {
    \ 'description': 'Enhanced Markdown support',
    \ 'on_ft': 'markdown',
\ }

NeoBundleLazy 'godlygeek/tabular', {
    \ 'description': 'Configurable, flexible, intuitive text aligning',
    \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
\ }

NeoBundleLazy 'gregsexton/gitv', {
    \ 'depends': 'vim-fugitive',
    \ 'description': "A 'gitk clone' plugin",
    \ 'external_command': 'git',
    \ 'on_cmd': 'Gitv',
\ }

NeoBundleLazy 'guns/xterm-color-table.vim', {
    \ 'description': 'All 256 xterm colors with their RGB equivalents',
    \ 'on_cmd': ['XtermColorTable', 'VXtermColorTable'],
\ }

NeoBundle 'jamessan/vim-gnupg', {
    \ 'description': 'Transparent editing of gpg encrypted files',
    \ 'external_command': 'gpg',
\ }

NeoBundleLazy 'jceb/vim-editqf', {
    \ 'description': 'Edit and store quickfix/location list entries',
    \ 'on_cmd': [
    \   {
    \       'name': ['LocLoad', 'LocSave', 'QFLoad', 'QFSave'],
    \       'complete': 'file',
    \   },
    \   'LocAddNote', 'QFAddNote',
    \ ],
    \ 'on_map': [['n', '<Leader>n']],
\ }

NeoBundleLazy 'jceb/vim-fastwordcompleter', {
    \ 'description': 'Editing support through autocompletion',
    \ 'on_cmd': 'AutocompletionStart',
    \ 'on_ft': ['genie', 'python', 'vim'],
\ }

NeoBundle 'justincampbell/vim-eighties', {
    \ 'description': 'Automatically resizes your windows',
\ }

NeoBundle 'kien/rainbow_parentheses.vim', {
    \ 'description': 'Better rainbow parentheses',
\ }

NeoBundle 'kshenoy/vim-signature', {
    \ 'description': 'A plugin to place, toggle and display marks',
    \ 'disabled': !has('signs'),
\ }

NeoBundleLazy 'leafo/moonscript-vim', {
    \ 'description': 'Language support for moonscript',
    \ 'on_ft': 'moon',
\ }

NeoBundleLazy 'ledger/vim-ledger', {
    \ 'description': 'Language support for ledger',
    \ 'on_ft': 'ledger',
\ }

NeoBundle 'magus/localcfg', {
    \ 'description': 'Help for customising based on features',
\ }

NeoBundleLazy 'mattn/emmet-vim', {
    \ 'description': 'Plugins for HTML and CSS hi-speed coding',
    \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ 'vim_version': '7.0',
\ }

NeoBundleLazy 'mattn/webapi-vim', {
    \ 'description': 'An interface to web APIs',
    \ 'external_commanpd': 'curl',
    \ 'vim_version': '7.0',
\ }

" vim-signature apparently can integrate with this, but how?
NeoBundle 'mhinz/vim-signify', {
    \ 'description': 'Use signs to indicate VCS state',
    \ 'external_command': 'git',
\}

NeoBundleLazy 'michaeljsmith/vim-indent-object', {
    \ 'description': 'Text objects based on indent levels',
    \ 'on_ft': ['ledger', 'moon', 'python'],
    \ 'on_map': [['ov', 'aI', 'ai', 'iI', 'ii']],
\ }

NeoBundleLazy 'mitsuhiko/vim-jinja', {
    \ 'description': 'Language support for jinja',
    \ 'on_ft': 'jinja',
\ }

NeoBundleLazy 'mitsuhiko/vim-rst', {
    \ 'description': 'Enhanced reST support',
    \ 'on_ft': 'rst',
\ }

NeoBundleLazy 'mmozuras/vim-github-comment', {
    \ 'depends': 'webapi-vim',
    \ 'description': 'Comment on GitHub directly',
    \ 'on_cmd': 'GHComment',
    \ 'external_command': ['git', 'xdg-open'],
\ }

NeoBundleLazy 'moll/vim-bbye', {
    \ 'description': 'delete buffers without breaking your layout',
    \ 'on_cmd': [{
    \   'name': 'Bdelete',
    \   'complete': 'buffer',
    \  }],
    \ 'on_map': [['n', '<Leader>q']],
\ }

NeoBundle 'nathanaelkane/vim-indent-guides', {
    \ 'augroup': 'indent_guides',
    \ 'description': 'A plugin for visually displaying indent levels',
\ }

NeoBundle 'rhysd/committia.vim', {
    \ 'description': 'More pleasant editing on commit message',
    \ 'external_command': 'git',
\ }

NeoBundleLazy 'rking/ag.vim', {
    \ 'description': 'A plugin for the_silver_searcher',
    \ 'on_cmd': ['Ag', 'AgBuffer'],
    \ 'external_command': 'ag',
\ }

NeoBundleLazy 'rust-lang/rust.vim', {
    \ 'description': 'Language support for rust',
    \ 'on_ft': 'rust',
\ }

NeoBundle (g:vcs_cst ? 'vcs_cst::JNRowe' : 'scrooloose') . '/syntastic', {
    \ 'description': 'Syntax checking on the fly',
    \ 'disabled': !has('quickfix'),
\ }
let s:bundle = neobundle#get('syntastic')
function! s:bundle.hooks.on_post_source(bundle)
    " Use our pretty icons instead of the default text.
    if has('signs')
        for [k, v] in items({"error": "✘", "warning": "⚠", "info": "☁"})
            let s:capped = toupper(k[0]) . k[1:]
            if (&termencoding ==# "utf-8") || has("gui_running")
                execute("sign define Syntastic" . s:capped . " text=". v .
                    \ " texthl=" . s:capped .
                    \ " icon=" .  expand("~/.vim/icons/" . k . ".png"))
            else
                execute("sign define Syntastic" . s:capped .
                    \ " text=" . s:capped[0] . s:capped[0] . " texthl=" . s:capped)
            endif
        endfor
    endif
endfunction

NeoBundleLazy 'sjl/clam.vim', {
    \ 'description': 'Easily work with shell commands',
    \ 'on_cmd': ['Clam', 'ClamVisual'],
\ }

NeoBundleLazy 'sjl/gundo.vim', {
    \ 'description': 'Graph your undo tree',
    \ 'on_cmd': 'GundoToggle',
\ }

NeoBundleLazy 'spolu/dwm.vim', {
    \ 'description': 'Tiled Window Management for Vim',
    \ 'on_func': ['DWM_Focus', 'DWM_New', 'DWM_Rotate'],
\ }

NeoBundleLazy 'szw/vim-maximizer', {
    \ 'description': 'Maximizes and restores the current window',
    \ 'on_cmd': 'MaximizerToggle',
    \ 'on_map': [['n', '<C-w>o']],
\ }

NeoBundleLazy 'terryma/vim-expand-region', {
    \ 'description': 'Incremental visual selection',
    \ 'on_map': [['nv', '+', '-']],
\ }

NeoBundleLazy 'terryma/vim-multiple-cursors', {
    \ 'description': 'True Sublime Text multiple selection',
    \ 'on_map': [['nx', '<C-n>']],
\ }

NeoBundleLazy 'tpope/vim-commentary', {
    \ 'description': 'Comment stuff out',
    \ 'on_cmd': 'Commentary',
    \ 'on_map': 'gc',
\ }

NeoBundle 'tpope/vim-fugitive', {
    \ 'description': 'A Git wrapper so awesome, it should be illegal',
    \ 'external_command': 'git',
\ }

NeoBundleLazy 'tpope/vim-jdaddy', {
    \ 'description': 'JSON manipulation and pretty printing',
    \ 'on_ft': 'json',
\ }

NeoBundle 'tpope/vim-projectionist', {
    \ 'description': 'Project configuration',
\ }

NeoBundle 'tpope/vim-repeat', {
    \ 'description': 'Repeat for plugin maps',
\ }

" This is pinned as it can massively affect functionality, see
" tpope/vim-sensible@2c57c5f4 for an example.
NeoBundle 'tpope/vim-sensible', '680a5c69', {
    \ 'description': "One step above 'nocompatible' mode",
\ }

NeoBundle 'tpope/vim-speeddating', {
    \ 'description': 'Increment dates, times, and more',
\ }

NeoBundle 'tpope/vim-sleuth', {
    \ 'description': 'Heuristically set buffer options',
\ }

NeoBundleLazy 'tpope/vim-surround', {
    \ 'description': 'Plugin for deleting, changing, and adding "surroundings"',
    \ 'on_map': [
    \   ['i', '<C-G>S', '<C-G>s', '<C-s>'],
    \   ['n', 'cS', 'cs', 'ds', 'yS', 'ys'],
    \   ['x', 'S'],
    \ ],
\ }

NeoBundleLazy 'ujihisa/unite-colorscheme', {
    \ 'depends': 'unite.vim',
    \ 'description': 'Colourscheme source for unite.vim',
    \ 'external_command': 'ctags',
\ }

NeoBundle 'vim-airline/vim-airline', {
    \ 'depends': [
    \   'NrrwRgn',
    \   'syntastic',
    \   'vim-airline-themes',
    \   'vim-signify',
    \   'vim-fugitive',
    \ ],
    \ 'description': "Lean & mean status/tabline for vim that's light as air",
\ }

NeoBundle 'vim-airline/vim-airline-themes', {
    \ 'description': 'Official theme repository for vim-airline',
\ }

NeoBundle 'vim-utils/vim-husk', {
    \ 'description': 'Mappings that boost command line mode',
\ }

NeoBundle 'vim-utils/vim-line', {
    \ 'description': '"inner line" text object',
\ }

NeoBundleLazy 'vim-utils/vim-man', {
    \ 'description': 'Enhanced man support',
    \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
\ }

NeoBundleLazy 'vim-utils/vim-vertical-move', {
    \ 'description': 'Motions to move a cursor without changing the column',
    \ 'on_map': ['[v', ']v'],
\ }

" vim-scripts bundles {{{
NeoBundleLazy 'Toggle', {
    \ 'description': 'Toggle values under the cursor',
    \ 'on_func': 'Toggle',
    \ 'on_map': [
    \   ['i', '<C-T>'],
    \   ['n', '+'],
    \ ],
\ }

NeoBundleLazy 'po.vim--Jelenak', {
    \ 'description': 'Extended support for GNU gettext',
    \ 'on_ft': 'po',
\ }

NeoBundleLazy 'uri-ref', {
    \ 'description': 'Painless footer references',
    \ 'on_ft': 'mail',
    \ 'terminal': 1,
\ }
" }}}

" Nasty bundled packages {{{
" These packages are being removed, either by finding a usable remote location
" or by deletion.
call neobundle#local("~/.vim/internal/", {
    \ 'on_cmd': 'Snip',
\ })
" }}}

NeoBundleSaveCache
