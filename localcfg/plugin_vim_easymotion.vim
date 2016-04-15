if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

" Would be nicer if it was home row and then home row for repeats
let g:EasyMotion_keys = 'qwertyuiopzxcvbnmn,.asdfghjkl;'
let g:EasyMotion_use_smartsign_gb = 1
let g:EasyMotion_enter_jump_first = 1
