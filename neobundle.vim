if neobundle#load_cache('~/.vim/neobundle.vim')
    NeoBundleLazy 'Shougo/neobundle.vim', {
        \ 'depends': [
        \   ['Shougo/vimproc', {
        \       'build': {
        \           'mac': 'make',
        \           'linux': 'make',
        \       },
        \   }],
        \ ],
        \ 'fetch': 1,
        \ 'vim_version': '7.2',
    \ }

    NeoBundleLazy 'AndrewRadev/sideways.vim', {
        \ 'on_cmd': ['SidewaysLeft', 'SidewaysRight'],
    \ }

    NeoBundle 'JNRowe/vim-jnrowe', {
        \ 'gui': 1,
    \ }

    NeoBundle 'Lokaltog/vim-easymotion'

    NeoBundleLazy 'Raimondi/delimitMate', {
        \ 'autoload': {
        \   'insert': 1,
        \ }
    \ }

    if has('lua')
        NeoBundleLazy 'Shougo/neocomplete.vim', {
            \ 'autoload': {
            \   'insert': 1,
            \ },
            \ 'disabled': !has('lua'),
            \ 'vim_version':'7.3.885',
        \ }
    else
        NeoBundleLazy 'Shougo/neocomplcache', {
            \ 'autoload': {
            \   'insert': 1,
            \ },
            \ 'disabled': has('lua'),
        \ }
    endif

    NeoBundleLazy 'Shougo/neomru.vim', {
        \ 'autoload': {
        \   'unite_sources': ['neomru/directory', 'neomru/file'],
        \ }
    \ }

    NeoBundleLazy 'Shougo/neosnippet', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'depends': [
        \   ['Shougo/context_filetype.vim', {
        \       'autoload': {
        \           'insert': 1,
        \       },
        \   }],
        \   ['Shougo/neosnippet-snippets', {
        \       'autoload': {
        \           'insert': 1,
        \       },
        \   }],
        \ ],
    \ }

    NeoBundleLazy 'Shougo/unite.vim', {
        \ 'on_cmd': 'Unite',
    \ }
    NeoBundleLazy 'Shougo/unite-outline', {
        \ 'autoload': {
        \   'unite_sources': 'outline'
        \ }
    \ }

    NeoBundleLazy 'airblade/vim-gitgutter', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'disabled': !has('signs'),
        \ 'external_command': 'git',
    \ }

    NeoBundleLazy 'bitc/vim-bad-whitespace', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'on_cmd': 'ToggleBadWhitespace',
    \ }

    NeoBundleLazy 'blindFS/vim-taskwarrior', {
        \ 'on_cmd': ['TW', 'TWEditTaskrc'],
    \ }

    NeoBundle 'bling/vim-airline'

    NeoBundleLazy 'chrisbra/NrrwRgn', {
        \ 'on_cmd': ['NR', 'NarrowRegion', 'NW', 'NUD', 'NRL'],
    \ }

    NeoBundleLazy 'chrisbra/CheckAttach', {
        \ 'on_ft': 'mail',
    \ }

    NeoBundleLazy 'chrisbra/csv.vim', {
        \ 'on_ft': 'csv',
    \ }

    NeoBundle 'chrisbra/Recover.vim'

    NeoBundleLazy 'chrisbra/unicode.vim', {
        \ 'on_cmd': ['Digraphs', 'SearchUnicode', 'UnicodeName', 'UnicodeTable'],
    \ }

    NeoBundle 'chrisbra/vim_faq'

    NeoBundleLazy 'ciaranm/detectindent', {
        \ 'on_cmd': 'Detectindent',
    \ }

    NeoBundle 'ciaranm/securemodelines'

    NeoBundleLazy 'davidhalter/jedi-vim', {
        \ 'on_ft': 'python',
        \ 'disabled': !has('python'),
    \ }

    NeoBundleLazy 'editorconfig/editorconfig-vim', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'disabled': !has('python'),
    \ }

    NeoBundleLazy 'ehamberg/vim-cute-python', 'moresymbols', {
        \ 'on_ft': 'python',
        \ 'disabled': !has('conceal'),
    \ }

    NeoBundleLazy 'elzr/vim-json', {
        \ 'on_ft': 'json',
    \ }

    NeoBundleLazy 'ervandew/regex', {
        \ 'on_cmd': 'Regex',
    \ }

    NeoBundleLazy 'ervandew/supertab', {
        \ 'autoload': {
        \   'insert': 1,
        \ }
    \ }

    NeoBundleLazy 'godlygeek/tabular', {
        \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
    \ }

    NeoBundleLazy 'gabrielelana/vim-markdown', {
        \ 'on_ft': 'markdown',
    \ }

    NeoBundleLazy 'gregsexton/gitv', {
        \ 'on_cmd': 'Gitv',
        \ 'depends': [
        \   ['tpope/vim-fugitive', {
        \       'augroup' : 'fugitive',
        \       'on_cmd': ['Gblame', 'Gdiff', 'Git', 'Gcommit', 'Glog',
        \                  'Gstatus'],
        \       'external_command': 'git'
        \   }],
        \ ],
        \ 'external_command': 'git',
    \ }

    NeoBundle 'int3/vim-extradite'

    NeoBundle 'jceb/vim-editqf'

    NeoBundleLazy 'guns/xterm-color-table.vim', {
        \ 'on_cmd': 'XtermColorTable',
    \ }

    NeoBundle 'jamessan/vim-gnupg', {
        \ 'external_command': 'gpg'
    \ }

    NeoBundleLazy 'jceb/vim-fastwordcompleter', {
        \ 'autoload': {
        \   'insert': 1,
        \ }
    \ }

    NeoBundleLazy 'junkblocker/patchreview-vim', {
        \ 'on_cmd': ['DiffReview', 'PatchReview'],
    \ }

    NeoBundle 'justincampbell/vim-eighties'

    NeoBundle 'kien/rainbow_parentheses.vim'

    NeoBundleLazy 'leafo/moonscript-vim', {
        \ 'on_ft': 'moon',
    \ }

    NeoBundleLazy 'ledger/vim-ledger', {
        \ 'on_ft': 'ledger',
    \ }

    NeoBundleLazy 'majutsushi/tagbar', {
        \ 'on_cmd': 'TagbarToggle',
    \ }

    NeoBundle 'mhinz/vim-startify'

    NeoBundleLazy 'michaeljsmith/vim-indent-object', {
        \ 'on_ft': 'python',
    \ }

    NeoBundleLazy 'mihaifm/vimpanel', {
        \ 'on_cmd': ['VimpanelCreate', 'VimpanelLoad'],
    \ }

    NeoBundle 'mitsuhiko/vim-jinja', {
        \ 'on_ft': 'jinja',
    \ }

    NeoBundleLazy 'mmozuras/vim-github-comment', {
        \ 'on_cmd': 'GHComment',
        \ 'depends': 'mattn/webapi-vim',
    \ }

    NeoBundleLazy 'rking/ag.vim', {
        \ 'on_cmd': ['Ag', 'grep'],
        \ 'external_command': 'ag',
    \ }

    NeoBundleLazy 'scrooloose/nerdtree', {
        \ 'on_cmd': ['NERDTreeFind', 'NERDTreeToggle'],
    \ }

    NeoBundleLazy 'rust-lang/rust.vim', {
        \ 'on_ft': 'rust',
    \ }

    NeoBundleLazy 'scrooloose/syntastic', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'disabled': !has('quickfix'),
    \ }

    NeoBundleLazy 'sjl/clam.vim', {
        \ 'on_cmd': 'Clam',
    \ }

    NeoBundle 'sjl/gundo.vim', {
        \ 'on_cmd': 'GundoToggle',
    \ }

    NeoBundle 'spolu/dwm.vim'

    NeoBundle 'terryma/vim-multiple-cursors' , {
        \ 'autoload': {
        \   'insert': 1,
        \ }
    \ }

    NeoBundle 'tpope/vim-characterize'

    NeoBundle 'tpope/vim-commentary'

    NeoBundle 'tpope/vim-jdaddy', {
        \ 'on_ft': 'json',
    \ }

    NeoBundle 'tpope/vim-ragtag', {
        \ 'on_ft': ['html', 'xml', 'xsl'],
    \ }

    NeoBundle 'tpope/vim-repeat'

    NeoBundle 'tpope/vim-sensible'

    NeoBundle 'tpope/vim-speeddating'

    NeoBundle 'tpope/vim-surround'

    NeoBundleLazy 'tsukkee/unite-tag', {
        \ 'autoload': {
        \   'unite_sources': ['tag', 'tag/file']
        \ }
    \ }

    NeoBundleLazy 'ujihisa/unite-colorscheme', {
        \ 'autoload': {
        \   'unite_sources': 'colorscheme'
        \ }
    \ }

    NeoBundleLazy 'vim-scripts/DotOutlineTree', {
        \ 'on_ft': 'rst',
    \ }

    NeoBundle 'vim-scripts/RST-Tables', {
        \ 'on_ft': 'rst',
    \ }

    NeoBundleLazy 'vim-scripts/TaskList.vim', {
        \ 'on_map': '<Plug>TaskList',
    \ }

    NeoBundleLazy 'vim-scripts/Toggle', {
        \ 'on_func': 'Toggle',
    \ }

    NeoBundle 'vim-scripts/ZoomWin'

    NeoBundleLazy 'vim-scripts/dbext.vim', {
        \ 'on_cmd': 'DBPromptForBufferParameters',
    \ }

    NeoBundle 'vim-scripts/python_match.vim', {
        \ 'on_ft': 'python',
    \ }

    NeoBundleLazy 'vim-scripts/uptime.vim', {
        \ 'on_cmd': 'Uptime',
    \ }

    NeoBundleLazy 'vim-scripts/uri-ref', {
        \ 'on_ft': 'mail',
    \ }

    NeoBundleLazy 'vim-utils/vim-man', {
        \ 'on_cmd': ['Man', 'Vman'],
    \ }

    NeoBundleSaveCache
endif
