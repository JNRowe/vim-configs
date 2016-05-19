if SLoaded(expand("<sfile>"))
    finish
endif

" Edit files in already open sessions.
" exists() is needed so that re-sourcing this file is possible.
if !exists("*EditExisting")
    runtime macros/editexisting.vim
endif

" Configure my autocommands {{{
augroup jnrowe
    autocmd!

    if exists("+omnifunc")
        autocmd Filetype *
            \ if &omnifunc == "" |
            \   setlocal omnifunc=syntaxcomplete#Complete |
            \ endif
    endif

    autocmd InsertLeave *
        \ if &paste |
        \   set nopaste |
        \ endif

    " Create missing directories when saving files
    autocmd BufWritePre *
        \ if !isdirectory(expand('%:h', 1)) |
        \   call mkdir(expand('%:h', 1), 'p') |
        \ endif

    " We don't want to edit patch backup files by accident [again]
    autocmd BufRead *.orig set readonly

    autocmd FileType man,startify set nospell

    autocmd FileType help,man setlocal colorcolumn=""

    autocmd FileType css,html EmmetInstall

    " Reread the config files after writing.
    " Note: This *can* cause problems, so be careful!
    autocmd BufWritePost ~/.vim/vimrc source %
    autocmd BufWritePost ~/.vim/localcfg/*.vim
        \ call SUnLoad(expand("<afile>", ":p")) |
        \ call localcfg#docfg()
    autocmd BufWritePost ~/.vim/ftdetect/*.vim,~/.vim/vimrc.d/*.vim
        \ call SUnLoad(expand("<afile>", ":p")) |
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
        \ else |
        \   call setpos(".", getpos("'\"")) |
        \ endif

    " Make stdin buffers temporary by default.  Potentially dangerous, but
    " I only use them this way.
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

    function! MetaDetect(file)
        let l:p = resolve(fnamemodify(a:file, ":p:h"))

        while l:p != "/"
            if isdirectory(l:p . "/.meta")
                return l:p . "/.meta"
            endif
            let l:p = fnamemodify(l:p, ":h")
        endwhile
    endfunction

    autocmd BufReadPost * if !exists("b:meta_dir") |
        \   let b:meta_dir = MetaDetect(expand('<afile>')) |
        \ endif |
        \ if type(b:meta_dir) == type("")
        \       && index(split(&spellfile, ","),
        \                b:meta_dir . '/en.utf-8.add') == -1 |
        \   execute "setlocal spellfile+=" . b:meta_dir . "/en.utf-8.add" |
        \   if !exists("b:meta_abbr")
        \           && filereadable(b:meta_dir . '/abbr.vim') |
        \       execute "source " . b:meta_dir . "/abbr.vim" |
        \       let b:meta_abbr = 1 |
        \   endif |
        \ endif
augroup END
" }}}
