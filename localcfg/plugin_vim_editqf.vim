if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

autocmd BufEnter *
    \ let g:editqf_saveqf_filename = g:vim_data_dir . "/quickfix/" .
    \   expand("%:p:~:gs?/?_?.dat") |
    \ let g:editqf_saveloc_filename = g:vim_data_dir . "/location/" .
    \   expand("%:p:~:gs?/?_?.dat")
