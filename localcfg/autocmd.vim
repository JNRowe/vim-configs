if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Scrub all autocommands
autocmd!

syntax on
filetype plugin indent on

" Edit files in already open sessions.
" exists() is needed so that re-sourcing this file is possible.
if !exists("*EditExisting")
    runtime! macros/editexisting.vim
endif

if exists("+omnifunc")
    autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

" Configure my autocommands {{{
augroup jnrowe
autocmd!

" We don't want to edit patch backup files by accident [again]
autocmd BufRead *.orig set readonly

autocmd FileType man,startify set nospell

autocmd FileType help,man setlocal colorcolumn=""

autocmd FileType css,html EmmetInstall

" Reread the vimrc after writing.
" Note: This *can* cause problems, so be careful!
autocmd BufWritePost ~/.vimrc,~/.vim/vimrc source %
autocmd BufWritePost ~/.vim/localcfg/*.vim
    \ if exists("g:loaded_lcfg_" . expand("%:t:r:gs?[\.-]?_?")) |
    \   execute("unlet g:loaded_lcfg_" .
    \           expand("%:t:r:gs?[\.-]?_?")) |
    \ endif |
    \ call localcfg#docfg()
autocmd BufWritePost ~/.vim/ftdetect/*.vim
    \ if exists("g:loaded_ftd_" . expand("%:t:r:gs?[\.-]?_?")) |
    \   execute("unlet g:loaded_ftd_" .
    \           expand("%:t:r:gs?[\.-]?_?")) |
    \ endif |
    \ source %

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

" Make stdin buffers temporary by default.  Potentially dangerous, but I only
" use them this way.
autocmd StdinReadPost * set buftype=nofile

" Turn off search highlighting when entering a buffer
autocmd BufEnter * nohlsearch
" Turn off search highlighting when idle
autocmd CursorHold * nohlsearch | redraw

" Always do a full syntax refresh, this is still fast enough on
" a netbook
autocmd BufEnter * syntax sync fromstart

" Open quickfix window, if there are any entries
autocmd QuickFixCmdPost * belowright cwindow 5

" Only highlight cursor line in active window
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

autocmd BufReadPost * if !exists("b:meta_dir") |
    \   let s:proot = FindRootDirectory() |
    \   if s:proot != "" |
    \       let b:meta_dir = s:proot . "/.meta" |
    \   endif |
    \ endif |
    \ if exists("b:meta_dir") && type(b:meta_dir) == type("") |
    \   if index(split(&spellfile, ","), b:meta_dir . '/en.utf-8.add') == -1 |
    \       execute("setlocal spellfile+=" . b:meta_dir . "/en.utf-8.add") |
    \   endif |
    \   if !exists("b:meta_abbr") && filereadable(b:meta_dir . '/abbr.vim') |
    \       execute("source " . b:meta_dir . "/abbr.vim") |
    \       let b:meta_abbr = 1 |
    \   endif |
    \ endif
augroup END
" }}}
