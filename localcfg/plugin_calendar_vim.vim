nnoremap [calendar] <Nop>
nmap <LocalLeader>c [calendar]

for [s:key, s:cmd] in [
    \   ['v', ''],
    \   ['h', 'H'],
    \   ['f', 'T'],
    \   ['r', 'VR'],
    \ ]
    execute 'nnoremap <silent> [calendar]' . s:key . ' '
        \ ':Calendar' . s:cmd . '<CR>'
endfor

let g:calendar_no_mappings = v:true
let g:calendar_mark = 'left-fit'
let g:calendar_monday = v:true
let g:calendar_weeknm = 1
let g:calendar_datetime = 'statusline'
let g:calendar_filetype = 'rst'

if has('autocmd')
    augroup jnrowe_cal
        autocmd FileType calendar HideBadWhitespace
    augroup END
endif
