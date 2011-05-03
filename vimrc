" vim: sw=4 sts=4 et tw=80 fdm=marker:

scriptencoding utf-8

set nocompatible

if v:version < 703
    let v:warningmsg="Vim version 7.3 or higher is required for some of the " .
        \ "functionality in this vimrc"
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
endif

" Pull in local settings.  This is only for local required while reading this
" file.
if filereadable(expand("~/.vim/vimrc-local.pre"))
    source ~/.vim/vimrc-local
endif

call pathogen#runtime_append_all_bundles("external")
call pathogen#helptags()

" General settings {{{
set autoindent
set autowrite
set noautowriteall
set backspace=indent,eol,start
set nobackup
set backupcopy=auto,breakhardlink
if has("ballooneval")
    set ballooneval
endif
set colorcolumn=+1
set completeopt=longest,menuone,preview
set confirm
set cryptmethod=blowfish
set cursorline
set dictionary+=/usr/share/dict/words
set directory=~/.vim/tmp//
set display=lastline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set foldcolumn=2
set foldlevelstart=99
set foldmethod=syntax
set foldtext=MyFoldText()
set formatoptions+=tcrqn2l1
set formatoptions-=wvb
set nofsync
set grepprg=grep\ -nH\ --exclude='.*.swp'\ --exclude=tags\ $*
set guioptions+=chR
set hidden
set history=1000
set ignorecase
set incsearch
set infercase
set isfname-=\=
set joinspaces
set lazyredraw
set linespace=1
set matchpairs+=<:>
set nonumber
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F4>
set report=0
set scrolloff=5
set shiftround
set shiftwidth=4
set showcmd
set showfulltag
set showmatch
set showtabline=1
set smartcase
set smarttab
set softtabstop=4
set spell
set spelllang=en_gb
set splitright
set nostartofline
set suffixes+=.pyc,.pyo
set swapsync=
set tags+=ctags;tags;
set textwidth=80
set tildeop
set title
set ttyfast
set undodir=~/.vim/undo/
set undofile
set viminfo=!,'1000,<1000,h,n~/.vim/viminfo
set virtualedit=block
set whichwrap+=<,>,[,]
set wildignore+=*.log,*.pdf,*.swp,*.o,*.pyc,*.pyo,*~,*.obj,*.db
set wildmenu
set wildmode=longest,full
" }}}

" Characters to show for wrapped lines
let &showbreak="» "

" Use securemodelines.vim {{{
set nomodeline
let g:secure_modelines_verbose = 0
let g:secure_modelines_modelines = 15
" }}}

" taglist settings {{{
let Tlist_Exit_OnlyWindow = 1
let Tlist_Inc_Winwidth = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Enable_Fold_Column = 0
nnoremap <silent> <F7> :TlistUpdate<CR>
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <silent> <F9> :TlistSync<CR>
" }}}

" Syntax files settings {{{
let b:nroff_is_groff=1 " Default to groff
let g:sh_fold_enabled=1 " Fold here-doc chunks
let is_bash=1 " Default to bash for sh syntax
let python_highlight_all=1 " Highlight everything possible for python
" }}}

" Load abbreviations {{{
if filereadable(expand("~/.vim/abbr"))
    source ~/.vim/abbr
endif
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

    " Fancy fancy % matching
    runtime! macros/matchit.vim

    " Edit files in already open sessions.
    " exists() is needed so that re-sourcing this file is possible.
    if !exists("*EditExisting")
        runtime! macros/editexisting.vim
    endif

    " Reread the vimrc after writing.
    " Note: This *can* cause problems, so be careful!
    autocmd BufWritePost .vimrc source %

    " Attempt filetype detection after writing.
    autocmd BufWritePost * if empty(&ft) | filetype detect | endif

    " Automatically chmod +x shell scripts
    autocmd BufWritePost *.sh silent !chmod +x %

    " Use :make to compile C/C++, even without a Makefile
    autocmd FileType c,cpp
        \ if filereadable('Makefile') |
        \   let &makeprg = "gcc -o %< %" |
        \ endif

    " Add Python tags when editing Python files
    autocmd FileType python setlocal tags+=$HOME/.vim/tags/python2.7.ctags

    " Set filetype specific commands for keyword lookup
    autocmd FileType python setlocal keywordprg=pydoc
    autocmd FileType vim setlocal keywordprg=:help

    " Mark lines longer than 80 chars as an error
    autocmd BufWinEnter * call ToggleLongLineHL()

    " List mode makes little sense in terminal windows
    autocmd FileType conque_term setlocal nolist

    " Make <Return> jump to tag in help files
    autocmd FileType help nmap <buffer> <Return> <C-]>
    autocmd FileType help nmap <buffer> <Backspace> <C-T>

    autocmd FileType text setlocal textwidth=72

    " Don't restore saved position for git buffers.
    " This is most useful in commit messages.
    autocmd BufReadPost * if &ft =~# '^git' | execute "normal gg" | endif

    autocmd BufNewFile,BufRead /tmp/*-sup.*
        \ set ft=mail |
        \ set ts=2 sw=2 et

    " Use filetype specific omnicompletion for certain filetypes
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    autocmd BufNewFile,BufRead /tmp/ditz*
        \ set ft=rst |
        \ set ts=2 sw=2 et

    autocmd BufNewFile,BufRead *.ldg set ft=ledger

    " Options for reST editing {{{
    autocmd FileType rst setlocal makeprg=rst2html.py\ %\ /dev/null
    " Map UU/Uu/U_ to add =/-/' underlining for headings respectively
    " You may not like this as it overrides the standard U mapping, but I never
    " use it.
    autocmd FileType rst
        \ map <buffer> UU yyp<C-v>$r=i<ESC> |
        \ map <buffer> Uu yyp<C-v>$r-i<ESC> |
        \ map <buffer> U_ yyp<C-v>$r'i<ESC>
    " }}}

    autocmd FileType html,liquid,xhtml,xml
        \ imap <buffer> <Leader>& &amp; |
        \ imap <buffer> <Leader>< &lt; |
        \ imap <buffer> <Leader>> &gt; |
        \ imap <buffer> <Leader>" &quot; |
        \ imap <buffer> <Leader><Space> &nbsp;

    " Toggle tab/wrap settings when editing Makefiles
    autocmd BufEnter Makefile set wrap noexpandtab nosmarttab
    autocmd BufLeave Makefile set nowrap expandtab smarttab

    " Turn off search highlighting when entering a buffer
    autocmd BufEnter * nohls
    " Turn off search highlighting when idle
    autocmd CursorHold * nohls | redraw

    " Always do a full syntax refresh, this is still fast enough on
    " a netbook
    autocmd BufEnter * syntax sync fromstart

    " Current directory follows the file being edited for local files
    autocmd BufEnter *
        \ if bufname("") !~ '^[[:alnum:]]*://' |
        \   silent! lcd %:p:h |
        \ endif

    " Open quickfix window, if there are any entries
    autocmd QuickFixCmdPost * belowright cwindow 5

    " make timing, from http://github.com/ciaranm/dotfiles-ciaranm/ {{{
    autocmd QuickFixCmdPre make let g:make_start_time=localtime()

    autocmd QuickFixCmdPost make
        \ let g:make_total_time=localtime() - g:make_start_time |
        \ echo printf("Time taken: %dm%2.2ds", g:make_total_time / 60,
        \   g:make_total_time % 60)
    " }}}

    " Simple status for quickfix/help windows {{{
    autocmd FileType help setlocal statusline=%t%h%=%p%%
    autocmd FileType taglist setlocal nospell |
        \ setlocal statusline=%f
    " }}}

    " Recalculate the long line warning when idle and after saving
    " from got-ravings.blogspot.com/2009/07/vim-pr0n-combating-long-lines.html
    autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

    " Session management {{{

    " Enable the following two autocmds if you wish session management to
    " automatically.
    "autocmd VimEnter * call LoadSession()
    "autocmd VimLeave * call SaveSession()

    function! SaveSession()
        if g:load_sessions == 1
            execute "mksession! ~/.vim/view/auto_session.vim"
        endif
    endfunction

    function! LoadSession()
        if argc() == 0
            let g:load_sessions = 1
            if filereadable(expand("~/.vim/view/auto_session.vim"))
                execute "source ~/.vim/view/auto_session.vim"
            endif
        else
            let g:load_sessions = 0
        endif
    endfunction
    " }}}
endif
" }}}

" Fancy status bar {{{
set laststatus=2
set statusline=
set statusline+=%-3.3n
if winwidth(0) > 90 " Full file name in wide windows
   set statusline+=%F
else
   set statusline+=%f
endif
set statusline+=%h%m%r%w " Flags
set statusline+=\[%{empty(&filetype)?'none':&filetype}
" Include encoding if not UTF-8
set statusline+=%{&encoding!='utf-8'?','.&encoding:''}
" Include file format if not Unix
set statusline+=%{&fileformat!='unix'?','.&fileformat:''}
" Display formatoptions if non-default
set statusline+=%{&formatoptions!='tcrqn2l1'?','.&formatoptions:''}
set statusline+=]
"set statusline+=\ %{VimBuddy()} " vim buddy
set statusline+=%{StatuslineLongLineWarning()}
set statusline+=%{CapsLockStatusline()}
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%= " Align to right
set statusline+=0x%B/%-8b\ " Current character
set statusline+=%-14.(%l,%c%V%)\ %<%P " Offset
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

    " Shift insert works the same as in a terminal
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    set guifont=Monaco\ 13
    colorscheme jnrowe

    if has('title')
        set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
    endif
    " }}}
else
    " Terminal specific settings {{{

    " Set up the menus so emenu works properly
    source $VIMRUNTIME/menu.vim

    if &t_Co > 88
        colorscheme inkpot
    elseif &t_Co == 88
        colorscheme jnrowe
    else
        colorscheme elflord
    endif
    if $TERM ==# "linux" ||
        \ (exists("$COLORFGBG") && split($COLORFGBG, ";")[0] == 15)
        set background=dark
    else
        set background=light
    endif

    " Change the cursor colour for insert mode {{{
    if &term =~? '^rxvt' && exists('&t_SI')
        let &t_SI="\<Esc>]12;purple\x7"
        let &t_EI="\<Esc>]12;green\x7"
    endif " }}}
    " }}}
endif

" Gentoo bug summary browser
let g:bugsummary_browser="opera -newpage '%s'"

" Show tabs and trailing whitespace {{{
if (&termencoding ==# "utf-8") || has("gui_running")
    set list listchars=tab:»·,trail:·,extends:…,nbsp:‗
else
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
endif " }}}

" Map Shift-F12 to switch between light and dark
function! Switch_background()
    if &background ==# "light"
        set background=dark
    else
        set background=light
    endif
endfunction
map <S-F12> :call Switch_background()<CR>

" Toggle line numbering, or re-enable numbering from line 0 if relative
" numbering is enabled.
map <C-F12> :set number!<CR>
" Set relative numbering
map <M-F12> :set relativenumber<CR>

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
if has("menu")
    amenu L&ocations.&Awesome.rc
        \ :execute("e " . expand("$XDG_CONFIG_HOME/awesome/rc.lua"))<CR>
    amenu L&ocations.&Awesome.theme
        \ :execute("e " . expand("$XDG_CONFIG_HOME/awesome/theme.lua"))<CR>
    amenu L&ocations.&Openbox.autostart
        \ :execute("e " . expand("$XDG_CONFIG_HOME/openbox/autostart.sh"))<CR>
    amenu L&ocations.&Openbox.menu
        \ :execute("e " . expand("$XDG_CONFIG_HOME/openbox/menu.xml"))<CR>
    amenu L&ocations.&Openbox.rc
        \ :execute("e " . expand("$XDG_CONFIG_HOME/openbox/rc.xml"))<CR>
    amenu L&ocations.&gitconfig :e ~/.gitconfig<CR>
    amenu L&ocations.&ledger :e ~/.ledger.dat<CR>
    amenu L&ocations.&musca
        \ :execute("e " . expand("$XDG_CONFIG_HOME/musca/start"))<CR>
    amenu L&ocations.&vim.&rc :e ~/.vimrc<CR>
    amenu L&ocations.&vim.rc-&local :e ~/.vim/vimrc-local<CR>
    amenu L&ocations.&zsh.&functions :e ~/.zsh/functions-local<CR>
    amenu L&ocations.&zsh.&zshrc :e ~/.zshrc<CR>
endif " }}}

" Don't use default keys for scratch plugin
let no_scratch_maps = 1

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
" Delete trailing whitespace:
nmap <F12> :%s/\s\+$//<CR>
vmap <F12> :s/\s\+$//<CR>
" }}}

" Flag toggling function {{{
" From http://vim.wikia.com/wiki/Handy_option_flag_toggler
function! ToggleFlag(option,flag)
    execute('let lopt = &' . a:option)
    if lopt =~# (".*" . a:flag . ".*")
        execute('set ' . a:option . '-=' . a:flag)
    else
        execute('set ' . a:option . '+=' . a:flag)
    endif
endfunction
" }}}

" Don't attempt to load csapprox if gui isn't supported
if !has("gui")
    let g:CSApprox_loaded = 1
endif

" from got-ravings.blogspot.com/2009/07/vim-pr0n-combating-long-lines.html {{{
"
" Return a warning for "long lines" {{{
"
" where "long" is either &textwidth or 80 (if no &textwidth is set)
"
" Returns:
"   ''
"       if no long lines
"   '[#x,my,$z]'
"       if long lines are found, were x is the number of long lines,
"       y is the median length of the long lines and z is the length of
"       the longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                \ '#' . len(long_line_lens) . "," .
                \ 'm' . s:Median(long_line_lens) . "," .
                \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction " }}}

" Return a list containing the lengths of the long lines in this buffer {{{
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction " }}}

" Find the median of the given array of numbers {{{
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction " }}}
" }}}

" Toggle long lines highlighting, adapted from the Wiki {{{
nnoremap <silent> <Leader>l :call ToggleLongLineHL()<CR>

function! ToggleLongLineHL()
    if exists('w:HLL1')
        silent! call matchdelete(w:HLL1)
        silent! call matchdelete(w:HLL2)
        set colorcolumn=0
        unlet w:HLL1
    elseif &textwidth > 0
        set colorcolumn=+1
        let w:HLL1=matchadd('Search',
            \ '\%<' . (&tw + 1) . 'v.\%>' . (&tw - 2) . 'v', -1)
        let w:HLL2=matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1)
    else
        set colorcolumn=81
        let w:HLL1=matchadd('Search', '\%<81v.\%>78v', -1)
        let w:HLL2=matchadd('ErrorMsg', '\%>80v.\+', -1)
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

    let x = printf(&cms, printf(fmt, &ft, &ts, &sw, &tw, (&et?"et":"noet")))
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
    noremap ,dp :diffput<CR>
    noremap ,dg :diffget<CR>
    noremap ,du :diffupdate<CR>
    vnoremap < :diffget<CR>
    vnoremap > :diffput<CR>
endif
" }}}

" Delete vcscommand plugin's buffer when hiding
let VCSCommandDeleteOnHide=1

" Maps for gundo {{{
nnoremap <LocalLeader># :GundoToggle<CR>
" }}}

" Maps for capslock plugin {{{
nmap <Leader>i i<Plug>CapsLockToggle
imap <C-L> <Plug>CapsLockToggle
" }}}

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
" The following mappings may not be to your liking, but I never use +/- for line
" movement.
nmap - zc
nmap + zo

vmap - zf
" }}}

" Supertab settings {{{
let g:SuperTabDefaultCompletionType='context'
" }}}

" Syntastic settings {{{
let g:syntastic_enable_signs=1
" }}}

" gist-vim settings {{{
let g:gist_clip_command="xsel -b"
" }}}

" showmarks settings {{{
let g:showmarks_enable=0
let g:showmarks_ignore_type="phq"
" }}}

" vala syntax settings {{{
let vala_comment_strings = 1
let vala_space_errors = 1
let vala_no_tab_space_error = 1
" }}}

" nerdtree settings {{{
map <LocalLeader>n :NERDTreeToggle<CR>
let g:NERDTreeCaseSensitiveSort = 1
" }}}

" conque settings {{{
" I use the default for Tlist
let g:ConqueTerm_ToggleKey = '<S-F9>'
let g:ConqueTerm_PyVersion = 3
" }}}

" toggle_words maps {{{
imap <C-M-T> <C-O>:ToggleWord<CR>
nmap <C-M-T> :ToggleWord<CR>
vmap <C-M-T> <ESC>:ToggleWord<CR>
" }}}

" tasklist settings {{{
map <LocalLeader>v <Plug>TaskList
let g:tlWindowPosition = 1
let g:tlRememberPosition = 1
" }}}

" Sign support {{{
" Waaaay too much execute nastiness :/
function! SignDefine(type, ...)
    let capped = toupper(a:type[0]) . a:type[1:]
    let text = capped[0] . capped[0]
    let hl_type = a:0 == 1 ? a:1 : capped . "MSG"
    execute("sign define " . capped . " text=" . text . " texthl=" . hl_type .
        \ " icon=" . expand("~/.vim/icons/" . a:type . ".svg"))
    execute("map <silent> <Leader>s" . a:type[0] . " :call MakeSign('" .
        \ capped . "')<CR>")
    execute("amenu icon=~/.vim/icons/" . a:type . ".svg ToolBar." .
        \ capped . " :call MakeSign('" . capped . "')<CR>")
    execute("tmenu ToolBar." . a:type . " Insert a" .
        \ (a:type[0] =~? "[aeiou]" ? "n" : "") . " " . a:type .
        \ " sign")
endfunction

amenu ToolBar.-Sep- :
call SignDefine("info", "Todo")
call SignDefine("warning")
call SignDefine("error")

function! MakeSign(type)
    execute(":sign place " . line(".") . " line=" . line(".") .
        \ " name=" . a:type . " file=" . expand("%:p"))
endfunction
map <silent> <Leader>sc :execute("sign unplace " . line("."))<CR>
" }}}

" Show highlight group of the current text {{{
" From vim wiki
command! ShowHighlightGroup
    \ echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name") .
    \ '> trans<' . synIDattr(synID(line("."), col("."), 0), "name") .
    \ "> lo<" . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name") .
    \ ">"
" }}}

" Pull in local settings.  This file is for all site specific settings.
if filereadable(expand("~/.vim/vimrc-local"))
    source ~/.vim/vimrc-local
endif
