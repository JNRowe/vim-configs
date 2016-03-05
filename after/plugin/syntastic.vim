" Use our pretty icons instead of the default text.
if has('signs')
    for [k, v] in items({"error": "✘", "warning": "⚠", "info": "☁"})
        let s:capped = toupper(k[0]) . k[1:]
        if (&termencoding ==# "utf-8") || has("gui_running")
            execute("sign define Syntastic" . s:capped . " text=". v .
                \ " texthl=" . s:capped .
                \ " icon=" .  expand("~/.vim/icons/" . k . ".png"))
        else
            execute("sign define Syntastic" . s:capped .
                \ " text=" . s:capped[0] . s:capped[0] . " texthl=" . s:capped)
        endif
    endfor
endif
