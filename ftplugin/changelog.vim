let g:changelog_username = systemlist('git config user.name')[0] .
    \ ' <' . systemlist('git config user.email')[0] . '>'
