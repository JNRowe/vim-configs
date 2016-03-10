if !neobundle#load_cache('~/.vim/neobundle.vim')
    finish
end

let g:vcs_cst = neobundle#config#get_types('vcs_cst') != {}

NeoBundleFetch 'Shougo/neobundle.vim', {
    \ 'depends': 'Shougo/vimproc',
    \ 'vim_version': '7.2',
\ }

NeoBundleLazy 'AndrewRadev/sideways.vim', {
    \ 'on_cmd': ['SidewaysLeft', 'SidewaysRight'],
\ }

NeoBundle 'JNRowe/vim-jnrowe', {
    \ 'gui': 1,
\ }

NeoBundleLazy (g:vcs_cst ? 'vcs_cst::cstrager' : 'Lokaltog') . '/vim-easymotion', {
    \ 'on_map': '<Leader><Leader>',
    \ 'vim_version': '7.4',
\ }

NeoBundleLazy 'Raimondi/delimitMate', {
    \ 'on_i': 1,
\ }

NeoBundleLazy 'Shougo/context_filetype.vim', {
    \ 'on_i': 1,
\ }

NeoBundleLazy 'Shougo/junkfile.vim', {
    \ 'autoload': {
    \   'commands': 'JunkfileOpen',
    \   'unite_sources': ['junkfile', 'junkfile/new'],
    \ },
\ }

if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'disabled': !has('lua'),
        \ 'on_i': 1,
        \ 'vim_version':'7.3.885',
    \ }
else
    NeoBundleLazy 'Shougo/neocomplcache', {
        \ 'disabled': has('lua'),
        \ 'on_i': 1,
    \ }
endif

NeoBundleLazy 'Shougo/neomru.vim', {
    \ 'depends': 'Shougo/unite.vim',
    \ 'on_unite': ['neomru/directory', 'neomru/file'],
\ }

NeoBundleLazy 'Shougo/neosnippet', {
    \ 'depends': ['Shougo/context_filetype.vim', 'Shougo/neosnippet-snippets'],
    \ 'on_i': 1,
\ }

NeoBundleLazy 'Shougo/neosnippet-snippets', {
    \ 'on_i': 1,
\ }

NeoBundle 'Shougo/unite.vim'

NeoBundleLazy 'Shougo/unite-outline', {
    \ 'depends': 'Shougo/unite.vim',
    \ 'on_unite': 'outline',
\ }

NeoBundleLazy 'Shougo/vimfiler.vim', {
    \ 'depends': 'Shougo/unite.vim',
    \ 'on_cmd': [
    \   {
    \       'name': ['VimFiler', 'VimFilerDouble'],
    \       'complete': 'customlist,vimfiler#complete',
    \   },
    \   'VimFilerExplorer',
    \ ],
    \ 'on_map': [['n', '<Plug>']],
    \ 'explorer': 1,
\ }

NeoBundle 'Shougo/vimproc', {
    \ 'build': 'make',
\ }

NeoBundleLazy 'bitc/vim-bad-whitespace', {
    \ 'on_cmd': ['HideBadWhitespace', 'ToggleBadWhitespace'],
    \ 'on_i': 1,
\ }

NeoBundleLazy 'blindFS/vim-taskwarrior', {
    \ 'on_cmd': ['TW', 'TWEditTaskrc'],
\ }

NeoBundle 'bling/vim-airline', {
    \ 'depends': [
    \   'chrisbra/NrrwRgn',
    \   'scrooloose/syntastic',
    \   'mhinz/vim-signify',
    \   'tpope/vim-fugitive',
    \ ],
\ }

NeoBundle 'chrisbra/NrrwRgn'

NeoBundleLazy 'chrisbra/csv.vim', {
    \ 'on_ft': 'csv',
\ }

NeoBundle 'chrisbra/Recover.vim'

NeoBundleLazy 'chrisbra/unicode.vim', {
    \ 'on_cmd': ['Digraphs', 'SearchUnicode', 'UnicodeName', 'UnicodeTable'],
\ }

NeoBundle 'chrisbra/vim_faq'

NeoBundle 'ciaranm/securemodelines'

NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'on_ft': 'python',
    \ 'disabled': !has('python'),
\ }

NeoBundleLazy 'dhruvasagar/vim-table-mode', {
    \ 'on_cmd': ['TableModeToggle', 'Tableize'],
    \ 'on_ft': 'rst',
\ }

NeoBundleLazy 'editorconfig/editorconfig-vim', {
    \ 'disabled': !has('python'),
    \ 'on_i': 1,
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
    \ 'on_i': 1,
\ }

NeoBundleLazy 'godlygeek/tabular', {
    \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
\ }

NeoBundleLazy 'fishman/vim-vala', {
    \ 'on_ft': ['genie', 'vala', 'vapi'],
\ }

NeoBundleLazy 'gabrielelana/vim-markdown', {
    \ 'on_ft': 'markdown',
\ }

NeoBundleLazy 'gregsexton/gitv', {
    \ 'on_cmd': 'Gitv',
    \ 'depends': 'tpope/vim-fugitive',
    \ 'external_command': 'git',
\ }

NeoBundleLazy 'guns/xterm-color-table.vim', {
    \ 'on_cmd': ['XtermColorTable', 'VXtermColorTable'],
\ }

NeoBundle 'jamessan/vim-gnupg', {
    \ 'external_command': 'gpg'
\ }

NeoBundleLazy 'jceb/vim-fastwordcompleter', {
    \ 'on_i': 1,
\ }

NeoBundleLazy 'jceb/vim-editqf', {
    \ 'on_cmd': [
    \   'LocAddNote', 'LocLoad', 'LocSave',
    \   'QFAddNote', 'QFLoad', 'QFSave',
    \ ],
    \ 'on_map': [['n', '<Leader>n']],
\ }

NeoBundle 'justincampbell/vim-eighties'

NeoBundle 'kien/rainbow_parentheses.vim'

NeoBundle 'kshenoy/vim-signature', {
    \ 'disabled': !has('signs'),
\ }

NeoBundleLazy 'leafo/moonscript-vim', {
    \ 'on_ft': 'moon',
\ }

NeoBundleLazy 'ledger/vim-ledger', {
    \ 'on_ft': 'ledger',
\ }

NeoBundleLazy 'mattn/emmet-vim', {
    \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
\ }

" vim-signature apparently can integrate with this, but how?
NeoBundle 'mhinz/vim-signify'

NeoBundleLazy 'michaeljsmith/vim-indent-object', {
    \ 'on_ft': ['ledger', 'moon', 'python'],
    \ 'on_map': [['ov', 'aI', 'ai', 'iI', 'ii']],
\ }

NeoBundleLazy 'mihaifm/bufstop', {
    \ 'on_cmd': ['Bufstop', 'BufstopFast'],
\ }

NeoBundleLazy 'mitsuhiko/vim-jinja', {
    \ 'on_ft': 'jinja',
\ }

NeoBundleLazy 'mitsuhiko/vim-rst', {
    \ 'on_ft': 'rst',
\ }

NeoBundleLazy 'mmozuras/vim-github-comment', {
    \ 'on_cmd': 'GHComment',
    \ 'depends': 'mattn/webapi-vim',
\ }

NeoBundleLazy 'moll/vim-bbye', {
    \ 'on_cmd': 'Bdelete',
\ }

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundleLazy 'reinh/vim-makegreen', {
    \ 'on_cmd': 'MakeGreen',
\ }

NeoBundle 'rhysd/committia.vim', {
    \ 'external_command': 'git',
\ }

NeoBundleLazy 'rking/ag.vim', {
    \ 'on_cmd': ['Ag', 'AgBuffer'],
    \ 'external_command': 'ag',
\ }

NeoBundleLazy 'rust-lang/rust.vim', {
    \ 'on_ft': 'rust',
\ }

NeoBundle 'scrooloose/syntastic', {
    \ 'disabled': !has('quickfix'),
\ }

NeoBundleLazy 'sjl/clam.vim', {
    \ 'on_cmd': 'Clam',
\ }

NeoBundleLazy 'sjl/gundo.vim', {
    \ 'on_cmd': 'GundoToggle',
\ }

NeoBundleLazy 'spolu/dwm.vim', {
    \ 'on_func': ['DWM_Focus', 'DWM_New', 'DWM_Rotate'],
\ }

NeoBundle 'terryma/vim-expand-region'

NeoBundleLazy 'terryma/vim-multiple-cursors', {
    \ 'on_map': [['nx', '<C-n>']],
\ }

NeoBundle 'tpope/vim-characterize'

NeoBundle 'tpope/vim-commentary'

NeoBundle 'tpope/vim-fugitive', {
    \ 'external_command': 'git'
\ }

NeoBundleLazy 'tpope/vim-jdaddy', {
    \ 'on_ft': 'json',
\ }

NeoBundle 'tpope/vim-projectionist'

NeoBundle 'tpope/vim-repeat'

NeoBundle 'tpope/vim-sensible'

NeoBundle 'tpope/vim-sleuth'

NeoBundle 'tpope/vim-speeddating'

NeoBundle 'tpope/vim-surround'

NeoBundleLazy 'ujihisa/unite-colorscheme', {
    \ 'on_unite': 'colorscheme'
\ }

NeoBundleLazy 'vim-scripts/Toggle', {
    \ 'on_func': 'Toggle',
\ }

NeoBundleLazy 'vim-scripts/ZoomWin', {
    \ 'on_map': [['n', '<C-w>o']],
\ }

NeoBundleLazy 'vim-scripts/dbext.vim', {
    \ 'on_cmd': 'DBPromptForBufferParameters',
\ }

NeoBundleLazy 'vim-scripts/uri-ref', {
    \ 'on_ft': 'mail',
\ }

NeoBundle 'vim-utils/vim-husk'

NeoBundle 'vim-utils/vim-line'

NeoBundleLazy 'vim-utils/vim-man', {
    \ 'on_cmd': ['Man', 'Vman'],
\ }

NeoBundleLazy 'vim-utils/vim-vertical-move', {
    \ 'on_map': ['[v', ']v'],
\ }

" Nasty bundled packages {{{
" These packages are being removed, either by finding a usable remote location
" or by deletion.
NeoBundleLocal ~/.vim/internal/
" }}}

NeoBundleDocs
NeoBundleSaveCache
