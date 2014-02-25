" Use our pretty icons instead of the default text.
if (&termencoding ==# "utf-8") || has("gui_running")
    execute("sign define SyntasticError text=✘ texthl=Error icon=" .
        \ expand("~/.vim/icons/error.svg"))
    execute("sign define SyntasticWarning text=⚠ texthl=Warning icon=" .
        \ expand("~/.vim/icons/warning.svg"))
    execute("sign define SyntasticInfo text=☁ texthl=Error icon=" .
        \ expand("~/.vim/icons/info.svg"))
else
    execute("sign define SyntasticError text=EE texthl=Error icon=" .
        \ expand("~/.vim/icons/error.svg"))
    execute("sign define SyntasticWarning text=WW texthl=Warning icon=" .
        \ expand("~/.vim/icons/warning.svg"))
    execute("sign define SyntasticInfo text=II texthl=Error icon=" .
        \ expand("~/.vim/icons/info.svg"))
endif
