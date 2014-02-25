" Vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead,BufNewFile *.vala setfiletype vala
autocmd BufRead,BufNewFile *.vapi setfiletype vala

" ledger
autocmd BufNewFile,BufRead *.ldg setfiletype ledger

" moon
autocmd BufNewFile,BufRead *.moon setfiletype moon

" mutt
autocmd BufRead,BufNewFile **/.mutt/*.rc setfiletype muttrc
