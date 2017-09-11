let g:textobj#quote#matchit = v:true

augroup jnrowe_textobj_quote
    autocmd!
    autocmd FileType rst call textobj#quote#init()
    autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END
