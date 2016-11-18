let g:calendar_mark = 'left-fit'
let g:calendar_monday = v:true
let g:calendar_weeknm = v:true
let g:calendar_filetype = 'rst'

if has('autocmd')
    augroup jnrowe_cal
        autocmd FileType calendar HideBadWhitespace
    augroup END
endif
