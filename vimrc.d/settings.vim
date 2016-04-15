if exists("g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

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
if has('cryptv')
    if has("patch-7.4.399")
        set cryptmethod=blowfish2
    else
        let v:warningmsg = "Using old blowfish cryptmethod"
        echohl WarningMsg
        echomsg v:warningmsg
        echohl none
        set cryptmethod=blowfish
    endif
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
if has('folding')
    set foldcolumn=2
    set foldlevelstart=99
    set foldmethod=syntax
    set foldtext=MyFoldText()
endif
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
set hidden
set ignorecase
set infercase
set isfname-=\=
set lazyredraw
if has('linebreak')
    set linebreak
endif
set list
" Show tabs and trailing whitespace {{{
if &termencoding ==# "utf-8" || has("gui_running")
    set listchars=tab:␉·,extends:…,nbsp:␠
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
if has('filterpipe')
    set noshelltemp
endif
set shiftround
set shiftwidth=4
set shortmess+=I
if has('cmdline_info') && has('showcmd')
    set showcmd
endif
set showfulltag
set showmatch
set smartcase
set softtabstop=4
if has('spell')
    set spell
    set spellfile=~/.vim/spell/en.utf-8.add
    set spelllang=en_gb
endif
set splitbelow
set splitright
set nostartofline
set suffixes+=.lua,.pyc,.pyo
set textwidth=80
set tildeop
set notimeout
set title
set ttimeout
set ttyfast
if has("persistent_undo")
    set undofile
    let &undodir = g:vim_data_dir . '/undo//,' . &undodir
endif
set updatetime=7500
if has('viminfo')
    execute "set viminfo='1000,<1000,h,n" . g:vim_cache_dir . "/viminfo"
endif
if has('virtualedit')
    set virtualedit=block
endif
set whichwrap+=<,>,[,]
if has('wildignore')
    set wildignore+=*.log,*.pdf,*.swp,*.[ao],*.py[co],*~,*.db
endif
set wildmode^=longest
" }}}

" Characters to show for wrapped lines
if has('linebreak')
    let &showbreak="» "
endif

" Fancy window titles where possible {{{
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F " File name
    set titlestring+=\ -\ %{v:progname} " Program name
endif " }}}

" Custom foldtext setting {{{
if has('folding')
    function! MyFoldText()
        let nlines = v:foldend - v:foldstart + 1
        return v:folddashes . getline(v:foldstart)[:winwidth(0)-10] . ' ▼ ' .
            \ nlines . ' lines '
    endfunction
endif
" }}}

" vim: fdm=marker: