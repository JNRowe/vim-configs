if SLoaded(expand('<sfile>'))
    finish
endif

let g:calendar_mark = 'left-fit'
let g:calendar_monday = 1
let g:calendar_weeknm = 1
let g:calendar_filetype = 'rst'

if has('autocmd')
    augroup jnrowe_cal
        autocmd FileType calendar HideBadWhitespace
    augroup END
endif
