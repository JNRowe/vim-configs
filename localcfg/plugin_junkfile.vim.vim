if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

let g:junkfile#directory = g:vim_cache_dir . '/junk'

" Override default JunkfileOpen, 'cos I hate the time format
command! -nargs=? JunkfileOpen
    \call junkfile#open(strftime('%FT%T-'), <q-args>)
command! JunkfileToday call junkfile#open_immediately(strftime('%F.rst'))
