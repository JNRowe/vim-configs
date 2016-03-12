if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:localcfg_cfgs = ['abbr']
let g:localcfg_features = ['autocmd', 'gui', 'menu']
