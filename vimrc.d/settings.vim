scriptencoding utf-8

" General settings {{{
set autochdir
set backup
set backupcopy=auto,breakhardlink
let &backupdir = g:vim_cache_dir . '/backup//,' . &backupdir
call mkdir(g:vim_cache_dir . '/backup', 'p')
set backupskip+=*.mht
if has('balloon_eval')
    set ballooneval
endif
set breakindent
set breakindentopt=sbr
set colorcolumn=+1
set completeopt+=longest,menuone
if has('conceal')
    set concealcursor=nc
    set conceallevel=2
endif
set confirm
if has('cryptv')
    if has('patch-7.4.401')
        set cryptmethod=blowfish2
    else
        let v:warningmsg = 'Using old blowfish cryptmethod'
        echohl WarningMsg
        echomsg v:warningmsg
        echohl none
        set cryptmethod=blowfish
    endif
endif
if filereadable('/usr/share/dict/words')
    set dictionary^=/usr/share/dict/words
endif
let &directory = g:vim_cache_dir . '/swap//,' . &directory
call mkdir(g:vim_cache_dir . '/swap', 'p')
set encoding=utf-8
set expandtab
set fileencoding=utf-8
if v:lang =~? 'utf-8'
    set fileencodings=utf-8,latin1,default
endif
if &termencoding ==# 'utf-8' || has('gui_running')
    set fillchars+=vert:│
endif
if has('folding')
    set fillchars+=fold:\  " Intentional trailing space
    set foldcolumn=2
    set foldlevelstart=99
    set foldmethod=syntax
    set foldtext=MyFoldText()
endif
set formatoptions+=rnl1
set formatoptions-=wvb
if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m
else
    let &grepprg = 'grep -nH '
        \ . '--exclude-from=' . g:xdg_data_dir . '/grep_excludes $* /dev/null'
endif
set hidden
set ignorecase
set infercase
set isfname-=\=
set keywordprg=:Man
set lazyredraw
if has('linebreak')
    set linebreak
endif
set list
" Show tabs and trailing whitespace {{{
if &termencoding ==# 'utf-8' || has('gui_running')
    set listchars=tab:␉·,extends:…,nbsp:␠
    if has('conceal')
        set listchars+=conceal:Δ
    endif
else
    set listchars=tab:>-,extends:>,nbsp:_
endif
" }}}
set matchpairs+=<:>
set matchtime=3
set nrformats+=octal
set nonumber
set pastetoggle=<F4>
if has('insert_expand')
    set pumheight=10
endif
if has('pythonx') && has('python3')
    set pyxversion=3
endif
set report=0
set scrolloff=100
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
set noshowmode
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
if has('persistent_undo')
    set undofile
    let &undodir = g:vim_data_dir . '/undo//,' . &undodir
    call mkdir(g:vim_data_dir . '/undo', 'p')
endif
set updatetime=7500
if has('mksession')
    let &viewdir = g:vim_cache_dir . '/view'
endif
if has('viminfo')
    set viminfo='1000,<1000,h
    let &viminfofile = g:vim_cache_dir . '/viminfo'
endif
if has('virtualedit')
    set virtualedit=block
endif
set whichwrap+=<,>,[,]
if has('wildignore')
    set wildignore+=*.pdf,*.swp,*.[ao],*.py[co],*~,*.db
endif
set wildmode^=longest
" }}}

" Characters to show for wrapped lines
if has('linebreak')
    let &showbreak='» '
endif

" Fancy window titles where possible {{{
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F " File name
    set titlestring+=\ -\ %{v:progname} " Program name
endif
" }}}

" Custom foldtext setting {{{
if has('folding')
    function! MyFoldText()
        function s:shorten(text, line_str)
            let l:text = a:text
            " Non-getline() text length
            let l:base = 19
            let l:text_width = winwidth(0) - v:foldlevel - len(a:line_str) - l:base
            if strlen(l:text) > l:text_width
                let l:text = l:text[:l:text_width] . '…'
            endif
            return l:text
        endfunction

        " Parsing foldtext() may be brittle, but manual creation is loads of
        " work; whitespace, &cms regex escaping(C fex), &fdr, no scanf(), etc
        return substitute(foldtext(), '^+-\(-\+\)\s*\(\d\+\) lines: \(.*\)',
            \             {m -> repeat('─', v:foldlevel) . ' ' .
            \                   s:shorten(m[3], m[2]) . '▼ ' . m[2] . ' lines'},
            \             '')
    endfunction
endif
" }}}

" vim: fdm=marker:
