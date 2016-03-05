" This replaces my custom info/warn/error sign code with [1-3] markers,
" basically just a convenience because I'm really used to the icons.
"
" Note to self: Names are from US S-<digit> keymap.
if has('signs')
    for [k, v] in items({"!": ["info", "Todo"], "@": "warning", "#": "error"})
        if type(v) == 3
            let s:icon = v[0]
            let s:hl = v[1]
        else
            let s:icon = v
            let s:hl = toupper(v[0]) . v[1:] . "MSG"
        end
        unlet v
        execute("sign define Signature_" . k .
            \ " icon=" . expand("~/.vim/icons/" . s:icon . ".png") .
            \ " text=" . toupper(s:icon[0] . s:icon[0]) . " texthl=" . s:hl)
    endfor
end
