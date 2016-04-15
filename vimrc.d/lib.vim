if exists("g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

" Flag toggling function {{{
" From http://vim.wikia.com/wiki/Handy_option_flag_toggler
function! ToggleFlag(option, flag)
    execute 'let lopt = &' . a:option
    if lopt =~# (".*" . a:flag . ".*")
        execute 'set ' . a:option . '-=' . a:flag
    else
        execute 'set ' . a:option . '+=' . a:flag
    endif
endfunction
" }}}

" vim: fdm=marker:
