" vim: set isfname-=/:
" Above modeline is so that ':Econfig <C-r><C-f>' works

if !neobundle#load_cache('~/.vim/neobundle.vim')
    finish
end

let g:vcs_cst = neobundle#config#get_types('vcs_cst') != {}

NeoBundleFetch 'Shougo/neobundle.vim', {
    \ 'depends': 'vimproc',
    \ 'vim_version': '7.2',
\ }

NeoBundleLazy 'AndrewRadev/sideways.vim', {
    \ 'on_cmd': ['SidewaysLeft', 'SidewaysRight'],
    \ 'on_map': [['n', '[sideways]']],
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
    \ 'on_cmd': 'JunkfileOpen',
    \ 'on_unite': 'junkfile',
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
        \ 'external_command': 'ctags',
        \ 'on_i': 1,
    \ }
endif

NeoBundleLazy 'Shougo/neomru.vim', {
    \ 'on_unite': 'neomru',
\ }

NeoBundleLazy 'Shougo/neosnippet', {
    \ 'depends': 'neosnippet-snippets',
    \ 'on_i': 1,
    \ 'on_map': [['iv', '<C-k>']],
\ }

NeoBundleLazy 'Shougo/neosnippet-snippets', {
    \ 'on_i': 1,
\ }

NeoBundle 'Shougo/unite.vim'

NeoBundleLazy 'Shougo/unite-outline', {
    \ 'depends': 'unite.vim',
    \ 'external_command': 'ctags',
\ }

NeoBundleLazy 'Shougo/vimfiler.vim', {
    \ 'depends': 'unite.vim',
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
\ }

NeoBundleLazy 'bitc/vim-bad-whitespace', {
    \ 'on_cmd': ['HideBadWhitespace', 'ToggleBadWhitespace'],
    \ 'on_i': 1,
\ }

NeoBundleLazy 'blindFS/vim-taskwarrior', {
    \ 'external_command': 'task',
    \ 'on_cmd': ['TW', 'TWEditTaskrc'],
\ }

NeoBundle (g:vcs_cst ? 'vcs_cst::cstrager' : 'bling') . '/vim-airline', {
    \ 'depends': [
    \   'NrrwRgn',
    \   'syntastic',
    \   'vim-signify',
    \   'vim-fugitive',
    \ ],
\ }

NeoBundle 'chrisbra/NrrwRgn', {
    \ 'vim_version': '7.4',
\ }

NeoBundle 'chrisbra/Recover.vim', {
    \ 'vim_version': '7.3',
\ }

NeoBundleLazy 'chrisbra/csv.vim', {
    \ 'on_ft': 'csv',
\ }

NeoBundleLazy 'chrisbra/unicode.vim', {
    \ 'on_cmd': ['Digraphs', 'SearchUnicode', 'UnicodeName', 'UnicodeTable'],
    \ 'on_map': [
    \   ['i', '<C-x><C-z>', '<C-x><C-g>'],
    \   ['n', '<Plug>(UnicodeGA)'],
    \ ],
    \ 'vim_version': '7.4',
\ }

NeoBundle 'chrisbra/vim_faq', {
    \ 'vim_version': '6.0',
\ }

NeoBundle 'ciaranm/securemodelines'
let s:bundle = neobundle#get('securemodelines')
function! s:bundle.hooks.on_post_source(bundle)
    let g:secure_modelines_allowed_items += [
        \ "isfname", "isf",
        \ "spl",
        \ "scrolloff", "so",
    \ ]
endfunction

NeoBundleLazy 'davidhalter/jedi-vim', {
    \ 'on_ft': 'python',
    \ 'disabled': !has('python'),
\ }

NeoBundleLazy 'dhruvasagar/vim-table-mode', {
    \ 'on_cmd': ['TableModeToggle', 'Tableize'],
    \ 'on_ft': 'rst',
    \ 'on_map': [['nx', '<Leader>t']],
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
    \ 'on_cmd': [{
    \   'name': 'Regex',
    \   'complete': 'customlist,RegexComplete',
    \ }],
\ }

NeoBundleLazy 'ervandew/supertab', {
    \ 'on_map': [['i', '<Tab>']],
\ }

NeoBundleLazy 'fishman/vim-vala', {
    \ 'on_ft': ['genie', 'vala', 'vapi'],
\ }

NeoBundleLazy 'gabrielelana/vim-markdown', {
    \ 'on_ft': 'markdown',
\ }

NeoBundleLazy 'godlygeek/tabular', {
    \ 'on_cmd': ['Tabularize', 'AddTabularPipeline'],
\ }

NeoBundleLazy 'gregsexton/gitv', {
    \ 'on_cmd': 'Gitv',
    \ 'depends': 'vim-fugitive',
    \ 'external_command': 'git',
\ }

NeoBundleLazy 'guns/xterm-color-table.vim', {
    \ 'on_cmd': ['XtermColorTable', 'VXtermColorTable'],
\ }

NeoBundle 'jamessan/vim-gnupg', {
    \ 'external_command': 'gpg',
\ }

NeoBundleLazy 'jceb/vim-editqf', {
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
    \ 'on_cmd': 'AutocompletionStart',
    \ 'on_ft': ['genie', 'python', 'vim'],
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

NeoBundle 'magus/localcfg'

NeoBundleLazy 'mattn/emmet-vim', {
    \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
    \ 'vim_version': '7.0',
\ }

NeoBundleLazy 'mattn/webapi-vim', {
    \ 'external_commanpd': 'curl',
    \ 'vim_version': '7.0',
\ }

" vim-signature apparently can integrate with this, but how?
NeoBundle 'mhinz/vim-signify', {
    \ 'external_command': 'git',
\}

NeoBundleLazy 'michaeljsmith/vim-indent-object', {
    \ 'on_ft': ['ledger', 'moon', 'python'],
    \ 'on_map': [['ov', 'aI', 'ai', 'iI', 'ii']],
\ }

NeoBundleLazy 'mitsuhiko/vim-jinja', {
    \ 'on_ft': 'jinja',
\ }

NeoBundleLazy 'mitsuhiko/vim-rst', {
    \ 'on_ft': 'rst',
\ }

NeoBundleLazy 'mmozuras/vim-github-comment', {
    \ 'on_cmd': 'GHComment',
    \ 'depends': 'webapi-vim',
    \ 'external_command': ['git', 'xdg-open'],
\ }

NeoBundleLazy 'moll/vim-bbye', {
    \ 'on_cmd': [{
    \   'name': 'Bdelete',
    \   'complete': 'buffer',
    \  }],
    \ 'on_map': [['n', '<Leader>q']],
\ }

NeoBundle 'nathanaelkane/vim-indent-guides', {
    \ 'augroup': 'indent_guides',
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

NeoBundle (g:vcs_cst ? 'vcs_cst::JNRowe' : 'scrooloose') . '/syntastic', {
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
    \ 'on_cmd': ['Clam', 'ClamVisual'],
\ }

NeoBundleLazy 'sjl/gundo.vim', {
    \ 'on_cmd': 'GundoToggle',
\ }

NeoBundleLazy 'spolu/dwm.vim', {
    \ 'on_func': ['DWM_Focus', 'DWM_New', 'DWM_Rotate'],
\ }

NeoBundleLazy 'terryma/vim-expand-region', {
    \ 'on_map': [['nv', '+', '-']],
\ }

NeoBundleLazy 'terryma/vim-multiple-cursors', {
    \ 'on_map': [['nx', '<C-n>']],
\ }

NeoBundleLazy 'tpope/vim-commentary', {
    \ 'on_cmd': 'Commentary',
    \ 'on_map': 'gc',
\ }

NeoBundle 'tpope/vim-fugitive', {
    \ 'external_command': 'git',
\ }

NeoBundleLazy 'tpope/vim-jdaddy', {
    \ 'on_ft': 'json',
\ }

NeoBundle 'tpope/vim-projectionist'

NeoBundle 'tpope/vim-repeat'

" This is pinned as it can massively affect functionality, see
" tpope/vim-sensible@2c57c5f4 for an example.
NeoBundle 'tpope/vim-sensible', '680a5c69'

NeoBundle 'tpope/vim-speeddating'

NeoBundle 'tpope/vim-sleuth'

NeoBundleLazy 'tpope/vim-surround', {
    \ 'on_map': [
    \   ['i', '<C-G>S', '<C-G>s', '<C-s>'],
    \   ['n', 'cS', 'cs', 'ds', 'yS', 'ys'],
    \   ['x', 'S'],
    \ ],
\ }

NeoBundleLazy 'ujihisa/unite-colorscheme'

NeoBundle 'vim-utils/vim-husk'

NeoBundle 'vim-utils/vim-line'

NeoBundleLazy 'vim-utils/vim-man', {
    \ 'on_cmd': ['Man', 'Mangrep', 'Vman'],
\ }

NeoBundleLazy 'vim-utils/vim-vertical-move', {
    \ 'on_map': ['[v', ']v'],
\ }

" vim-scripts bundles {{{
NeoBundleLazy 'Toggle', {
    \ 'on_func': 'Toggle',
    \ 'on_map': [
    \   ['i', '<C-T>'],
    \   ['n', '+'],
    \ ],
\ }

NeoBundleLazy 'ZoomWin', {
    \ 'on_map': [['n', '<C-w>o']],
\ }

NeoBundleLazy 'uri-ref', {
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
