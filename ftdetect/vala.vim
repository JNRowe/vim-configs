autocmd BufRead,BufNewFile *.vala set filetype=vala
autocmd BufRead,BufNewFile *.vapi set filetype=vala
autocmd BufRead *.vala,*.vapi setlocal errorformat=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead,BufNewFile *.gs set filetype=genie
