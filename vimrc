scriptencoding utf-8

set nocompatible

if v:version < 704
    let v:warningmsg = "Vim version 7.4 or higher is required for some of "
        \ "the functionality in this vimrc"
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
endif

" Pull in local settings.  This is only for local required while reading this
" file.
if filereadable(expand("~/.vim/vimrc-local.pre"))
    source ~/.vim/vimrc-local.pre
endif

" Find appropriate directory for data files, this used to be handled by
" vim-sensible until 2c57c5f4c5446865db532064c763a6a67db2d0bb.
let g:xdg_cache_dir = expand(empty($XDG_CACHE_HOME)
    \                        ? '~/.cache' : '$XDG_CACHE_HOME')
let g:xdg_config_dir = expand(empty($XDG_CONFIG_HOME)
    \                         ? '~/.config' : '$XDG_CONFIG_HOME')
let g:xdg_data_dir = expand(empty($XDG_DATA_HOME)
    \                       ? '~/.local/share' : '$XDG_DATA_HOME')

let g:vim_cache_dir = g:xdg_cache_dir . "/vim"
let g:vim_config_dir = g:xdg_config_dir . "/vim"
let g:vim_data_dir = g:xdg_data_dir . "/vim"

if has('vim_starting')
    set runtimepath+=~/.vim/external/neobundle.vim/
endif

" Fire up neobundle, and setup plugins
source ~/.vim/extconfigs/neobundle.vim.vim
call neobundle#begin(expand('~/.vim/external/', 1))

source ~/.vim/neobundle.vim

NeoBundleCheck
call neobundle#end()

" General settings {{{
set autochdir
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
set linespace=1
set list
" Show tabs and trailing whitespace {{{
if &termencoding ==# "utf-8" || has("gui_running")
    set listchars=tab:»·,extends:…,nbsp:‗
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

" Load abbreviations {{{
if filereadable(expand("~/.vim/abbr"))
    source ~/.vim/abbr
endif
" This file is meant for host specific abbreviations, for example terms that
" are used specifically at the office
if filereadable(expand("~/.vim/abbr-local"))
    source ~/.vim/abbr-local
endif
" }}}

" Autocommands {{{
if has("autocmd")
    " Scrub all autocommands
    autocmd!

    syntax on
    filetype plugin indent on

    " Edit files in already open sessions.
    " exists() is needed so that re-sourcing this file is possible.
    if !exists("*EditExisting")
        runtime! macros/editexisting.vim
    endif

    if has("+omnifunc")
        autocmd Filetype *
            \ if &omnifunc == "" |
            \   setlocal omnifunc=syntaxcomplete#Complete |
            \ endif
    endif

    " We don't want to edit patch backup files by accident
    autocmd BufRead *.orig set readonly

    autocmd FileType man,startify set nospell

    autocmd FileType help,man setlocal colorcolumn=""

    autocmd FileType gitconfig set noexpandtab

    autocmd FileType css,html EmmetInstall

    " Reread the vimrc after writing.
    " Note: This *can* cause problems, so be careful!
    autocmd BufWritePost ~/.vimrc,~/.vim/vimrc,~/.vim/vimrc-local source %

    " Clear the neobundle cache on write
    autocmd BufWritePost neobundle.vim NeoBundleClearCache

    autocmd BufWritePost ~/.vim/extconfigs/*.vim
        \ if exists("g:loaded_extconfigs_" . expand("%:t:r:gs?[\.-]?_?")) |
        \   execute("unlet g:loaded_extconfigs_" .
        \           expand("%:t:r:gs?[\.-]?_?")) |
        \ endif |
        \ so %

    " Attempt filetype detection after writing.
    autocmd BufWritePost *
        \ if empty(&filetype) |
        \   filetype detect |
        \ endif

    " Automatically chmod +x shell scripts
    autocmd BufWritePost *.sh silent !chmod +x %

    " Jump to the last known cursor position if possible.
    " Note: Don't restore saved position for git buffers as it tends not to be
    " useful.
    autocmd BufReadPost *
        \ if &filetype =~# '^git' |
        \   execute "normal gg" |
        \ elseif line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal g`\"" |
        \ endif

    autocmd BufNewFile,BufRead *.rb set sw=2

    " Turn off search highlighting when entering a buffer
    autocmd BufEnter * nohlsearch
    " Turn off search highlighting when idle
    autocmd CursorHold * nohlsearch | redraw

    " Always do a full syntax refresh, this is still fast enough on
    " a netbook
    autocmd BufEnter * syntax sync fromstart

    " Open quickfix window, if there are any entries
    autocmd QuickFixCmdPost * belowright cwindow 5

    " make timing, from http://github.com/ciaranm/dotfiles-ciaranm/ {{{
    autocmd QuickFixCmdPre make let g:make_start_time = localtime()

    autocmd QuickFixCmdPost make
        \ let g:make_total_time = localtime() - g:make_start_time |
        \ echo printf("Time taken: %dm%2.2ds", g:make_total_time / 60,
        \             g:make_total_time % 60)
    " }}}

    " Only highlight cursor line in active window
    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter * setlocal cursorline
endif
" }}}

" Fancy window titles where possible {{{
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F " File name
    set titlestring+=\ -\ %{v:progname} " Program name
endif " }}}

if has("gui_running")
    " GUI specific settings {{{
    set mousemodel=popup_setpos

    " Always display line number in the GUI
    set number
    set relativenumber

    " Shift insert works the same as in a terminal
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    if has('gui_macvim')
        set guifont=Menlo:h13
    else
        set guifont=Consolas\ 13
    endif
    colorscheme jnrowe

    if has('title')
        set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
    endif
    " }}}
else
    " Terminal specific settings {{{

    " Set up the menus so emenu works properly
    source $VIMRUNTIME/menu.vim

    if $TERM ==# "linux" || $TERM =~ "^xterm" || $TERM == "st" ||
        \ $TERM =~ "^st-" || split($COLORFGBG . ";padding", ";")[0] == 15
        set background=dark
    else
        set background=light
    endif
    colorscheme elflord

    " Change the cursor colour for insert mode {{{
    if &term =~? '^rxvt' && exists('&t_SI')
        let &t_SI = "\<Esc>]12;purple\x7"
        let &t_EI = "\<Esc>]12;green\x7"
    endif " }}}
    " }}}
endif

" Gentoo bug summary browser
let g:bugsummary_browser = "opera -newpage '%s'"


" Make C-s do something useful, after disabling term stop!
map <C-S> :shell<CR>

" Omnicompletion rocks, but <C-x><C-o> doesn't. {{{
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" }}}

" Quickly move between buffers {{{
map <M-Left> :bprev<CR>
map <M-Right> :bnext<CR>

map <Esc>1 :buffer 1<CR>
map <Esc>2 :buffer 2<CR>
map <Esc>3 :buffer 3<CR>
map <Esc>4 :buffer 4<CR>
map <Esc>5 :buffer 5<CR>
map <Esc>6 :buffer 6<CR>
map <Esc>7 :buffer 7<CR>
map <Esc>8 :buffer 8<CR>
map <Esc>9 :buffer 9<CR>
map <Esc>0 :buffers<CR>
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

" Lazy typist write binding
nnoremap <Leader>w :w<CR>

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

" Custom menu items {{{
" It checks for, what I consider to be, the most important file in a set and
" only shows the menu if it is exists.  This allows us to list files for
" different hosts without cluttering the menu too much.
if has("menu")
    if filereadable(g:xdg_config_dir . "/awesome/rc.moon")
        amenu L&ocations.&Awesome.rc
            \ :execute("e " . g:xdg_config_dir . "/awesome/rc.moon")<CR>
        amenu L&ocations.&Awesome.theme
            \ :execute("e " . g:xdg_config_dir .
            \          "/awesome/themes/jnrowe/theme.moon")<CR>
    endif
    if filereadable(g:xdg_config_dir . "/openbox/rc.xml")
        amenu L&ocations.&Openbox.autostart
            \ :execute("e " . g:xdg_config_dir . "/openbox/autostart.sh")<CR>
        amenu L&ocations.&Openbox.menu
            \ :execute("e " . g:xdg_config_dir . "/openbox/menu.xml")<CR>
        amenu L&ocations.&Openbox.rc
            \ :execute("e " . g:xdg_config_dir . "/openbox/rc.xml")<CR>
    endif
    if filereadable(g:xdg_config_dir . "/git/config")
        amenu L&ocations.&gitconfig
            \ :execute("e " . g:xdg_config_dir . "/git/config")<CR>
    elseif filereadable(expand("~/.gitconfig"))
        amenu L&ocations.&gitconfig :e ~/.gitconfig<CR>
    endif
    if filereadable(g:xdg_config_dir . "/python/rc")
        amenu L&ocations.&python
            \ :execute("e " . g:xdg_config_dir . "/python/rc")<CR>
    endif
    if filereadable(g:xdg_data_dir . "/ledger/ledger.dat.gpg")
        amenu L&ocations.&ledger
            \ :execute("e " . g:xdg_data_dir . "/ledger/ledger.dat.gpg")<CR>
    endif
    if filereadable(g:xdg_config_dir . "/musca/start")
        amenu L&ocations.&musca
            \ :execute("e " . g:xdg_config_dir . "/musca/start")<CR>
    endif
    if filereadable(expand("~/.vimrc"))
        amenu L&ocations.&vim.&rc :e ~/.vimrc<CR>
        amenu L&ocations.&vim.rc-&local :e ~/.vim/vimrc-local<CR>
        amenu L&ocations.&vim.&neobundle :e ~/.vim/neobundle.vim<CR>
    endif
    if filereadable(expand("~/.zshrc"))
        amenu L&ocations.&zsh.&functions-local :e ~/.zsh/functions-local<CR>
        amenu L&ocations.&zsh.&zshrc :e ~/.zshrc<CR>
    endif
    amenu L&ocations.&xorg.X&modmap :e ~/.Xmodmap
    amenu L&ocations.&xorg.X&resources :e ~/.Xresources
    amenu L&ocations.&xorg.X&initrc :e ~/.xinitrc
    if filereadable(expand("~/.fonts.conf"))
        amenu L&ocations.&freetype :e ~/.fonts.conf<CR>
    elseif filereadable(g:xdg_config_dir . "/fontconfig/fonts.conf")
        amenu L&ocations.&freetype
            \ :execute("e " . g:xdg_config_dir . "/fontconfig/fonts.conf")<CR>
    endif
    if filereadable(expand("~/.gtkrc-2.0"))
        amenu L&ocations.&gtk :e ~/.gtkrc-2.0<CR>
    endif
endif " }}}

" Don't use default keys for scratch plugin
let no_scratch_maps = 1

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
nmap <F1> :set hlsearch!<CR>
nnoremap <F2> :set list!<CR>
nmap <C-F2> <Plug>ShowScratchBuffer
imap <S-F2> <Plug>InsShowScratchBuffer
nmap <F3> :set expandtab!<CR>
" F4 toggles paste
nmap <S-F4> :call ToggleFlag("guioptions","m")<CR>
nmap <C-F4> :call ToggleFlag("guioptions","T")<CR>
" F7-F9 are used for taglist, and are defined above
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

" Display occurrences of current word in quickfix window
nnoremap <Leader>sw :execute "vimgrep ".expand("<cword>")." %"<cr>:copen<cr>
" … and last search
nnoremap <Leader>ss :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Quickfix maps {{{
nmap <Leader>cwc :cclose<CR>
nmap <Leader>cwo :copen 7<CR><C-w>p
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprevious<CR>
nmap <M-Down> :cnext<CR>
nmap <M-Up> :cprevious<CR>
nmap <Leader>cr :crewind<CR>
nmap <Leader>cl :clast<CR>
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

" Read all configs for external packages
runtime! extconfigs/*.vim

" Pull in local settings.  This file is for all site specific settings.
if filereadable(expand("~/.vim/vimrc-local"))
    source ~/.vim/vimrc-local
endif

" vim: fdm=marker:
