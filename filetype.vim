" Vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead,BufNewFile *.vala setfiletype vala
autocmd BufRead,BufNewFile *.vapi setfiletype vala

" mutt
autocmd BufRead,BufNewFile **/.mutt/*.rc setfiletype muttrc

" redo
autocmd BufRead,BufNewFile *.do setfiletype sh
autocmd BufRead,BufNewFile *.do let g:is_posix=1

autocmd BufNewFile,BufRead ~/.pypirc setfiletype dosini
