if exists("g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

" Show highlight group of the current text {{{
" From vim wiki
command! ShowHighlightGroup
    \ echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name") .
    \   '> trans<' . synIDattr(synID(line("."), col("."), 0), "name") .
    \   "> lo<" . synIDattr(synIDtrans(synID(line("."), col("."), 1)),
    \                       "name") .
    \   ">"
" }}}

" vim: fdm=marker:
