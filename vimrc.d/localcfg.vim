if exists("g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Read all optional configs for build-dependent settings and external packages
let g:localcfg_cfgs = []
if has('localmap')
    let g:localcfg_cfgs += ['abbr']
endif
let g:localcfg_features = [
    \ 'autocmd', 'diff', 'gui_macvim', 'gui_running', 'menu', 'quickfix'
\ ]
for s:bundle in values(dein#get())
    let s:cfgname = 'plugin_' . substitute(s:bundle.name, '-', '_', 'g')
    let g:localcfg_cfgs += [(get(s:bundle, 'if', 1) ? '' : 'not') . s:cfgname]
endfo
call localcfg#docfg()
