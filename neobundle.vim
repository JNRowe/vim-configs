autocmd BufWritePost neobundle.vim source ~/.vim/neobundle.vim

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'JNRowe/vim-jnrowe'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'Raimondi/delimitMate', {
    \ 'autoload': {
    \   'insert': 1,
    \ }
\ }
NeoBundleLazy 'Rykka/colorv.vim', {
    \ 'autoload': {
    \   'commands': ['ColorV', 'ColorVPreview'],
    \   'filetypes': 'css',
    \ },
    \ 'gui': 1,
    \ 'stay_same': 1,
\ }
NeoBundleLazy 'Shougo/junkfile.vim', {
    \ 'autoload': {
    \   'commands': 'JunkfileOpen',
    \   'unite_sources': ['junkfile', 'junkfile/new']
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
NeoBundle 'Shougo/vimproc', {
    \ 'build': {
    \   'mac' : 'make -f make_mac.mak',
    \   'unix' : 'make -f make_unix.mak',
    \ },
\ }
NeoBundleLazy 'airblade/vim-gitgutter', {
    \ 'autoload': {
    \   'insert': 1,
    \ },
    \ 'external_command': 'git',
\ }
NeoBundleLazy 'bitc/vim-bad-whitespace', {
    \ 'autoload': {
    \   'insert': 1,
    \ }
\ }
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
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
NeoBundle 'chrisbra/unicode.vim'
NeoBundle 'chrisbra/vim_faq'
NeoBundleLazy 'ciaranm/detectindent', {
    \ 'autoload': {
    \   'insert': 1,
    \ }
\ }
NeoBundle 'ciaranm/securemodelines'
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ }
\ }
NeoBundleLazy 'editorconfig/editorconfig-vim', {
    \ 'autoload': {
    \   'insert': 1,
    \ }
\ }
NeoBundleLazy 'ehamberg/vim-cute-python', 'moresymbols', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ },
    \ 'disabled': !has('conceal'),
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
NeoBundle 'fs111/pydoc.vim', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ },
\ }
NeoBundleLazy 'godlygeek/tabular', {
    \ 'autoload': {
    \   'commands': ['Tabularize', 'AddTabularPipeline'],
    \ }
\ }
NeoBundleLazy 'gregsexton/MatchTag', {
    \ 'autoload': {
    \   'filetypes': ['html', 'xml', 'xsl'],
    \ }
\ }
NeoBundle 'gregsexton/gitv'
NeoBundle 'int3/vim-extradite'
NeoBundle 'jceb/vim-editqf'
NeoBundleLazy 'guns/xterm-color-table.vim', {
    \ 'autoload': {
    \   'commands': 'XtermColorTable',
    \ }
\ }
NeoBundleLazy 'jceb/vim-fastwordcompleter', {
    \ 'autoload': {
    \   'insert': 1,
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
NeoBundleLazy 'scrooloose/nerdtree', {
    \ 'autoload': {
    \   'commands': ['NERDTreeFind', 'NERDTreeToggle'],
    \ }
\ }
NeoBundleLazy 'scrooloose/syntastic', {
    \ 'autoload': {
    \   'insert': 1,
    \ }
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
NeoBundle 'tpope/vim-fugitive', {'external_command': 'git'}
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
NeoBundle 'vim-scripts/DotOutlineTree', {
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
NeoBundle 'vim-scripts/python_match.vim', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ }
\ }

NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git', {
    \ 'external_command': 'gpg'
\ }
