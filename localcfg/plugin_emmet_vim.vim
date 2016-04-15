if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

let g:user_emmet_complete_tag = 1
let g:user_emmet_install_global = 0

let g:iser_emmet_settings = {
    \ 'variables': {
    \   'locale': "en-GB",
    \ },
    \ 'htmljinja': {
    \   'extends': 'html',
    \ },
\ }
