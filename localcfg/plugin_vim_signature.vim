if !has('signs')
    finish
endif

" This replaces my custom info/warn/error sign code with [1-3] markers,
" basically just a convenience because I'm really used to the icons.
"
" Note to self: Names are from US S-<digit> keymap.
for [s:k, s:v] in items({'!': ['info', 'Todo'], '@': 'warning', '#': 'error'})
    if type(s:v) == v:t_list
        let s:icon = s:v[0]
        let s:hl = s:v[1]
    else
        let s:icon = s:v
        let s:hl = toupper(s:v[0]) . s:v[1:] . 'MSG'
    endif
    unlet s:v
    " This is brittle *and* dirty, but there isn't much way around it.
    " See 47ceaf9cbd970450953bdf3e84e281473a579ac0
    execute 'sign define ' .
        \ 'Signature_' . s:k . '_SignatureMarkerText_SignatureMarkerLine' .
        \ ' icon=' . expand('~/.vim/icons/' . s:icon . '.png') .
        \ ' text=' . toupper(s:icon[0] . s:icon[0]) . ' texthl=' . s:hl
endfor
