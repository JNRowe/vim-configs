if exists("g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

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

" vim: fdm=marker:
