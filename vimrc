scriptencoding utf-8

set nocompatible

if v:version < 704
    let v:warningmsg = "Vim version 7.4 or higher is required for some of "
        \ "the functionality in this vimrc"
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
endif

" Pull in local settings.  This is only for locally required settings while
" reading this file.
if filereadable(expand("~/.vim/vimrc.pre"))
    source ~/.vim/vimrc.pre
endif

" Find appropriate directory for data files {{{
let g:xdg_cache_dir = expand(empty($XDG_CACHE_HOME)
    \                        ? '~/.cache' : '$XDG_CACHE_HOME')
let g:xdg_config_dir = expand(empty($XDG_CONFIG_HOME)
    \                         ? '~/.config' : '$XDG_CONFIG_HOME')
let g:xdg_data_dir = expand(empty($XDG_DATA_HOME)
    \                       ? '~/.local/share' : '$XDG_DATA_HOME')

let g:vim_cache_dir = g:xdg_cache_dir . "/vim"
let g:vim_config_dir = g:xdg_config_dir . "/vim"
let g:vim_data_dir = g:xdg_data_dir . "/vim"
" }}}

" Fire up dein, and setup plugins {{{
set runtimepath^=~/.vim/external/dein.vim/

let g:dein_repos_dir = g:vim_cache_dir . '/dein/repos'

" Disable netrw, as it clashes with plugins
let g:loaded_netrwPlugin = 1

if dein#load_state(g:vim_cache_dir . '/dein')
    call dein#begin(g:vim_cache_dir . '/dein',
        \ ['~/.vim/vimrc', '~/.vim/dein.vim'])

    source ~/.vim/dein.vim

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    echo "Missing plugins"
endif
" }}}

" General settings {{{
set backup
set backupcopy=auto,breakhardlink
let &backupdir = g:vim_cache_dir . '/backup//,' . &backupdir
if has("balloon_eval")
    set ballooneval
endif
set colorcolumn=+1
set completeopt+=longest
if has('conceal')
    set concealcursor=nc
    set conceallevel=2
endif
set confirm
if v:version > 704 || v:version == 704 && has("patch399")
    set cryptmethod=blowfish2
else
    let v:warningmsg = "Using old blowfish cryptmethod"
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
    set cryptmethod=blowfish
endif
set cursorline
if filereadable('/usr/share/dict/words')
    set dictionary^=/usr/share/dict/words
endif
let &directory = g:vim_cache_dir . '/swap//,' . &directory
set encoding=utf-8
set expandtab
set fileencoding=utf-8
if v:lang =~? 'utf-8'
    set fileencodings=utf-8,latin1,default
endif
set foldcolumn=2
set foldlevelstart=99
set foldmethod=syntax
set foldtext=MyFoldText()
set formatoptions+=rnl1
set formatoptions-=wvb
set gdefault
if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m
else
    let &grepprg = "grep -nH "
        \ "--exclude-from=" . g:xdg_data_dir . "/grep_excludes $* /dev/null"
endif
set guiheadroom=0
set guioptions+=chR
set guioptions-=T
set guioptions-=m
set guioptions-=r
set hidden
set ignorecase
set infercase
set isfname-=\=
set lazyredraw
set list
" Show tabs and trailing whitespace {{{
if &termencoding ==# "utf-8" || has("gui_running")
    set listchars=tab:␉―,extends:…,nbsp:␠
    if has('conceal')
        set listchars+=conceal:Δ
    endif
else
    set listchars=tab:>-,extends:>,nbsp:_
endif
" }}}
set matchpairs+=<:>
set nonumber
set pastetoggle=<F4>
set report=0
set scrolloff=10
set shiftround
set shiftwidth=4
set shortmess+=I
set showcmd
set showfulltag
set showmatch
set smartcase
set softtabstop=4
set spell
set spellfile=~/.vim/spell/en.utf-8.add
set spelllang=en_gb
set splitbelow
set splitright
set nostartofline
set suffixes+=.lua,.pyc,.pyo
set textwidth=80
set tildeop
set title
set ttyfast
if has("persistent_undo")
    set undofile
    let &undodir = g:vim_data_dir . '/undo//,' . &undodir
endif
execute("set viminfo='1000,<1000,h,n" . g:vim_cache_dir . "/viminfo")
set virtualedit=block
set whichwrap+=<,>,[,]
set wildignore+=*.log,*.pdf,*.swp,*.[ao],*.py[co],*~,*.db
set wildmode^=longest
" }}}

" Characters to show for wrapped lines
let &showbreak="» "

" Syntax files settings {{{
let g:erlang_highlight_special_atoms = 1
let g:is_posix = 1  " Posix is a more realistic default for me
let b:nroff_is_groff = 1  " Default to groff
let g:sh_fold_enabled = 7  " Fold as much as possible
let g:vimsyn_embed = 'lPr'  " lua/Python/ruby only embedded syntax
let g:xml_syntax_folding = 1
let sh_minlines = 400
let is_bash = 1  " Default to bash for sh syntax
let python_highlight_all = 1  " Highlight everything possible for python
" }}}

" Fancy window titles where possible {{{
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F " File name
    set titlestring+=\ -\ %{v:progname} " Program name
endif " }}}

" Quickly move between buffers {{{
map <M-Left> :bprev<CR>
map <M-Right> :bnext<CR>
" }}}

" Navigate tags with keys I find less annoying {{{
map <C-S-Left> <C-T>
map <C-S-Right> <C-]>
" }}}

" Ctrl + up/down to skip paragraphs {{{
nnoremap <C-Up> {
nnoremap <C-Down> }
" }}}

" Remove nasty page skipping mappings {{{
inoremap <S-Up> <C-o>gk
inoremap <S-Down> <C-o>gj
noremap <S-Up> gk
noremap <S-Down> gj
" }}}

" Make c-g verbose by default
nnoremap <C-g> 2<C-g>

" Map Q to reformat paragraphs
nmap Q gqap

" Wrap current word in brackets {{{
nmap ,( mpwbi(<Esc>ea)<Esc>`pl
nmap ,[ mpwbi[<Esc>ea]<Esc>`pl
nmap ,{ mpwbi{<Esc>ea}<Esc>`pl
" }}}

" Shift + left/right to select text {{{
nnoremap <S-Left> vh
nnoremap <S-Right> vl
nnoremap <S-Up> Vk
nnoremap <S-Down> Vj
" }}}

" Toggle current fold
nnoremap <Space> za

" Logical Y mapping, like D
map Y y$

" Insert literal tab, for that once a year when it makes sense
inoremap <silent> <S-Tab> <C-v><Tab>

" Regrab selection after {de,in}dent for simpler repeating
vnoremap < <gv
vnoremap > >gv

" <home> darts between start of line and start of text
inoremap <silent> <home> <C-o>:call HomeSkip()<CR>
nnoremap <silent> <home> :call HomeSkip()<CR>
function! HomeSkip()
    if col('.') != 1
        normal 0
    else
        normal ^
    endif
endfunction

" Function keys {{{
nmap <silent> <F1> :set hlsearch!<CR>
nnoremap <silent> <F2> :set list!<CR>
nmap <silent> <F3> :set expandtab!<CR>
" F4 toggles paste
nmap <silent> <S-F4> :call ToggleFlag("guioptions","m")<CR>
nmap <silent> <C-F4> :call ToggleFlag("guioptions","T")<CR>
" F5 is VimFiler
nmap <F10> :make check<CR>
nmap <S-F10> :execute "make -C " . expand("%:p:h") . " check"<CR>
nmap <F11> :make<CR>
nmap <S-F11> :execute "make -C " . expand("%:p:h")<CR>
nmap <silent> <C-F11> :let @/ = ""<CR>

" Flag toggling function {{{
" From http://vim.wikia.com/wiki/Handy_option_flag_toggler
function! ToggleFlag(option, flag)
    execute('let lopt = &' . a:option)
    if lopt =~# (".*" . a:flag . ".*")
        execute('set ' . a:option . '-=' . a:flag)
    else
        execute('set ' . a:option . '+=' . a:flag)
    endif
endfunction
" }}}

" From godlygeek's vimrc {{{
"
" Insert a modeline on the last line with <Leader>ml
nmap <silent> <Leader>ml :call ModelineStub()<CR>

function! ModelineStub()
    let save_cursor = getpos('.')
    let fmt = ' vim: set ft=%s ts=%d sw=%d tw=%d %s:'

    let x = printf(&cms, printf(fmt, &filetype, &tabstop, &shiftwidth,
        \                       &textwidth,
        \                       (&expandtab ? "et" : "noexpandtab")))
    $put =substitute(substitute(x, '\ \+', ' ', 'g'), ' $', '', '')
    call setpos('.', save_cursor)
endfunction
" }}}

" Custom foldtext setting {{{
function! MyFoldText()
    let nlines = v:foldend - v:foldstart + 1
    return v:folddashes . getline(v:foldstart)[:winwidth(0)-10] . ' ▼ ' .
        \ nlines . ' lines '
endfunction
" }}}

" Vimdiff maps {{{
if &diff
    noremap <LocalLeader>do :diffoff!<CR>
    noremap <LocalLeader>dp :diffput<CR>
    noremap <LocalLeader>dg :diffget<CR>
    noremap <LocalLeader>du :diffupdate<CR>
    vnoremap < :diffget<CR>
    vnoremap > :diffput<CR>
endif
" }}}

" Window management {{{
nmap <C-w><Bar> <C-w>v
nmap <C-w>- <C-w>s
nmap <Tab> <C-w>w
nmap <S-Tab> <C-w>W
" }}}

" Folding support maps {{{
" The following mappings may not be to your liking, but I never use +/- for
" line movement.
nmap - zc
nmap + zo

vmap - zf
" }}}

" Show highlight group of the current text {{{
" From vim wiki
command! ShowHighlightGroup
    \ echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name") .
    \   '> trans<' . synIDattr(synID(line("."), col("."), 0), "name") .
    \   "> lo<" . synIDattr(synIDtrans(synID(line("."), col("."), 1)),
    \                       "name") .
    \   ">"
" }}}

" Read all optional configs for build-dependent settings and external packages
let g:localcfg_cfgs = ['abbr']
let g:localcfg_features = ['autocmd', 'gui', 'gui_macvim', 'menu', 'quickfix']
for s:bundle in values(dein#get())
    let s:cfgname = 'plugin_' . substitute(s:bundle.name, '-', '_', 'g')
    let g:localcfg_cfgs += [(s:bundle.if ? '' : 'not') . s:cfgname]
endfo
call localcfg#docfg()

" vim: fdm=marker:
