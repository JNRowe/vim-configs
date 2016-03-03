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
        \ 'autoload': {
        \   'commands': ['SidewaysLeft', 'SidewaysRight'],
        \ }
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
        \ 'autoload': {
        \   'commands': 'Unite',
        \ }
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
        \   'commands': 'ToggleBadWhitespace',
        \   'insert': 1,
        \ }
    \ }

    NeoBundleLazy 'blindFS/vim-taskwarrior', {
        \ 'autoload': {
        \   'commands': ['TW', 'TWEditTaskrc'],
        \ }
    \ }

    NeoBundle 'bling/vim-airline'

    NeoBundleLazy 'chrisbra/NrrwRgn', {
        \ 'autoload': {
        \   'commands': ['NR', 'NarrowRegion', 'NW', 'NUD', 'NRL'],
        \ }
    \ }

    NeoBundleLazy 'chrisbra/CheckAttach', {
        \ 'autoload': {
        \   'filetypes': 'mail',
        \ }
    \ }

    NeoBundleLazy 'chrisbra/csv.vim', {
        \ 'autoload': {
        \   'filetypes': 'csv',
        \ }
    \ }

    NeoBundle 'chrisbra/Recover.vim'

    NeoBundleLazy 'chrisbra/unicode.vim', {
        \ 'autoload': {
        \   'commands': ['Digraphs', 'SearchUnicode', 'UnicodeName',
        \                'UnicodeTable'],
        \ },
    \ }

    NeoBundle 'chrisbra/vim_faq'

    NeoBundleLazy 'ciaranm/detectindent', {
        \ 'autoload': {
        \   'commands': 'DetectIndent',
        \ }
    \ }

    NeoBundle 'ciaranm/securemodelines'

    NeoBundleLazy 'davidhalter/jedi-vim', {
        \ 'autoload': {
        \   'filetypes': 'python',
        \ },
        \ 'disabled': !has('python'),
    \ }

    NeoBundleLazy 'editorconfig/editorconfig-vim', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'disabled': !has('python'),
    \ }

    NeoBundleLazy 'ehamberg/vim-cute-python', 'moresymbols', {
        \ 'autoload': {
        \   'filetypes': 'python',
        \ },
        \ 'disabled': !has('conceal'),
    \ }

    NeoBundleLazy 'elzr/vim-json', {
        \ 'autoload': {
        \   'filetypes': 'json',
        \ }
    \ }

    NeoBundleLazy 'ervandew/regex', {
        \ 'autoload': {
        \   'commands': 'Regex',
        \ }
    \ }

    NeoBundleLazy 'ervandew/supertab', {
        \ 'autoload': {
        \   'insert': 1,
        \ }
    \ }

    NeoBundleLazy 'godlygeek/tabular', {
        \ 'autoload': {
        \   'commands': ['Tabularize', 'AddTabularPipeline'],
        \ }
    \ }

    NeoBundleLazy 'gregsexton/gitv', {
        \ 'autoload': {
        \   'commands': 'Gitv',
        \ },
        \ 'depends': [
        \   ['tpope/vim-fugitive', {
        \       'augroup' : 'fugitive',
        \       'autoload': {
        \           'commands': ['Gblame', 'Gdiff', 'Git', 'Gcommit',
        \                        'Glog', 'Gstatus'],
        \       },
        \       'external_command': 'git'
        \   }],
        \ ],
        \ 'external_command': 'git',
    \ }

    NeoBundle 'int3/vim-extradite'

    NeoBundle 'jceb/vim-editqf'

    NeoBundleLazy 'guns/xterm-color-table.vim', {
        \ 'autoload': {
        \   'commands': 'XtermColorTable',
        \ }
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
        \ 'autoload': {
        \   'commands': ['DiffReview', 'PatchReview'],
        \ }
    \ }

    NeoBundle 'justincampbell/vim-eighties'

    NeoBundle 'kien/rainbow_parentheses.vim'

    NeoBundleLazy 'leafo/moonscript-vim', {
        \ 'autoload': {
        \   'filetypes': 'moon',
        \ }
    \ }

    NeoBundleLazy 'ledger/vim-ledger', {
        \ 'autoload': {
        \   'filetypes': 'ledger',
        \ }
    \ }

    NeoBundleLazy 'majutsushi/tagbar', {
        \ 'autoload': {
        \   'commands': 'TagbarToggle',
        \ }
    \ }

    NeoBundle 'mhinz/vim-startify'

    NeoBundleLazy 'michaeljsmith/vim-indent-object', {
        \ 'autoload': {
        \   'filetypes': 'python',
        \ }
    \ }

    NeoBundleLazy 'mihaifm/vimpanel', {
        \ 'autoload': {
        \   'commands': ['VimpanelCreate', 'VimpanelLoad'],
        \ }
    \ }

    NeoBundleLazy 'mmozuras/vim-github-comment', {
        \ 'autoload': {
        \   'commands': 'GHComment',
        \ },
        \ 'depends': 'mattn/webapi-vim',
    \ }

    NeoBundleLazy 'rking/ag.vim', {
        \ 'autoload': {
        \   'commands': ['Ag', 'grep'],
        \ },
        \ 'external_command': 'ag',
    \ }

    NeoBundleLazy 'scrooloose/nerdtree', {
        \ 'autoload': {
        \   'commands': ['NERDTreeFind', 'NERDTreeToggle'],
        \ }
    \ }

    NeoBundleLazy 'rust-lang/rust.vim', {
        \ 'autoload': {
        \   'filetypes': 'rust',
        \ }
    \ }

    NeoBundleLazy 'scrooloose/syntastic', {
        \ 'autoload': {
        \   'insert': 1,
        \ },
        \ 'disabled': !has('quickfix'),
    \ }

    NeoBundleLazy 'sjl/clam.vim', {
        \ 'autoload': {
        \   'commands': 'Clam',
        \ }
    \ }

    NeoBundle 'sjl/gundo.vim', {
        \ 'autoload': {
        \   'commands': 'GundoToggle',
        \ }
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
        \ 'autoload': {
        \   'filetypes': 'json',
        \ }
    \ }

    NeoBundle 'tpope/vim-ragtag', {
        \ 'autoload': {
        \   'filetypes': ['html', 'xml', 'xsl'],
        \ }
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
        \ 'autoload': {
        \   'filetypes': 'rst',
        \ }
    \ }

    NeoBundle 'vim-scripts/RST-Tables', {
        \ 'autoload': {
        \   'filetypes': 'rst',
        \ }
    \ }

    NeoBundleLazy 'vim-scripts/TaskList.vim', {
        \ 'mappings': '<Plug>TaskList',
    \ }

    NeoBundleLazy 'vim-scripts/Toggle', {
        \ 'autoload': {
        \   'functions': 'Toggle',
        \ }
    \ }

    NeoBundle 'vim-scripts/ZoomWin'

    NeoBundleLazy 'vim-scripts/dbext.vim', {
        \ 'autoload': {
        \   'commands': 'DBPromptForBufferParameters',
        \ }
    \ }

    NeoBundle 'vim-scripts/python_match.vim', {
        \ 'autoload': {
        \   'filetypes': 'python',
        \ }
    \ }

    NeoBundleLazy 'vim-scripts/uptime.vim', {
        \ 'autoload': {
        \   'commands': 'Uptime',
        \ }
    \ }

    NeoBundleLazy 'vim-scripts/uri-ref', {
        \ 'autoload': {
        \   'filetypes': 'mail',
        \ }
    \ }

    NeoBundleLazy 'vim-utils/vim-man', {
        \ 'autoload': {
        \   'commands': ['Man', 'Vman'],
        \ }
    \ }

    NeoBundleSaveCache
endif
