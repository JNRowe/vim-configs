if SLoaded(expand("<sfile>"))
    finish
endif

let g:calendar_mark = 'left-fit'
let g:calendar_monday = 1
let g:calendar_weeknm = 1
let g:calendar_filetype = 'rst'

if has("autocmd")
    autocmd FileType calendar HideBadWhitespace
endif
