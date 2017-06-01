autocmd BufRead *.vala,*.vapi setlocal errorformat=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead,BufNewFile *.vala,*.vapi setlocal filetype=vala
autocmd BufRead,BufNewFile *.gs setlocal filetype=genie
