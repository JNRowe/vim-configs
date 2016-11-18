" Show highlight group of the current text {{{
" From vim wiki
command! ShowHighlightGroup
    \ echo 'hi<' . synIDattr(synID(line('.'), col('.'), v:true), 'name') .
    \   '> trans<' . synIDattr(synID(line('.'), col('.'), v:false), 'name') .
    \   '> lo<' . synIDattr(synIDtrans(synID(line('.'), col('.'), v:true)),
    \                       'name') .
    \   '>'
" }}}

" Flag toggling function {{{
" From http://vim.wikia.com/wiki/Handy_option_flag_toggler
function! ToggleFlag(option, flag)
    execute 'let l:lopt = &' . a:option
    if l:lopt =~# ('.*' . a:flag . '.*')
        execute 'set ' . a:option . '-=' . a:flag
    else
        execute 'set ' . a:option . '+=' . a:flag
    endif
endfunction
" }}}

" vim: fdm=marker:
