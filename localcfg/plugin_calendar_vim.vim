if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

let g:calendar_mark = 'left-fit'
let g:calendar_monday = 1
let g:calendar_weeknm = 1
let g:calendar_filetype = 'rst'

if has("autocmd")
    autocmd FileType calendar HideBadWhitespace
endif
