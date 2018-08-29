let g:snips_author = systemlist('git -C ~ config user.name')[0] .
    \ ' <' . systemlist('git -C ~ config user.email')[0] . '>'

let g:snips_github = 'https://github.com/JNRowe'
