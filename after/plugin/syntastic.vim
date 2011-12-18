" Use our pretty icons instead of the default text.
execute("sign define SyntasticError text=EE texthl=Error icon=" .
    \ expand("~/.vim/icons/error.svg"))
execute("sign define SyntasticWarning text=WW texthl=Warning icon=" .
    \ expand("~/.vim/icons/warning.svg"))
execute("sign define SyntasticInfo text=II texthl=Error icon=" .
    \ expand("~/.vim/icons/info.svg"))

