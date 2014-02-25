autocmd BufWritePost neobundle.vim source ~/.vim/neobundle.vim

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'JNRowe/vim-jnrowe'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundleLazy 'Rykka/colorv.vim', {
    \ 'autoload': {
    \   'filetypes': 'css',
    \ },
    \ 'stay_same': 1,
\ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bitc/vim-bad-whitespace'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'chrisbra/NrrwRgn'
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
NeoBundle 'ciaranm/detectindent'
NeoBundle 'ciaranm/securemodelines'
NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ }
\ }
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundleLazy 'ehamberg/vim-cute-python', 'moresymbols', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ },
\ }
NeoBundle 'ervandew/regex'
NeoBundle 'ervandew/supertab'
NeoBundle 'fs111/pydoc.vim', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ },
\ }
NeoBundle 'godlygeek/tabular'
NeoBundleLazy 'gregsexton/MatchTag', {
    \ 'autoload': {
    \   'filetypes': 'xml',
    \ }
\ }
NeoBundle 'gregsexton/gitv'
NeoBundle 'int3/vim-extradite'
NeoBundle 'jceb/vim-editqf'
NeoBundle 'jceb/vim-fastwordcompleter'
NeoBundle 'jceb/vim-hier'
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
NeoBundle 'majutsushi/tagbar'
" Required by vim-github-comment
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'michaeljsmith/vim-indent-object', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ }
\ }
NeoBundle 'mihaifm/vimpanel'
NeoBundle 'mmozuras/vim-github-comment'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/clam.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-jdaddy', {
    \ 'autoload': {
    \   'filetypes': 'json',
    \ }
\ }
NeoBundle 'tpope/vim-ragtag', {
    \ 'autoload': {
    \   'filetypes': 'xml',
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
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'vim-scripts/Toggle'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'vim-scripts/python_match.vim', {
    \ 'autoload': {
    \   'filetypes': 'python',
    \ }
\ }

NeoBundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
