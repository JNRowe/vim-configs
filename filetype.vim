" Vala
autocmd BufRead,BufNewFile *.vala setfiletype vala
autocmd BufRead,BufNewFile *.vapi setfiletype vala
autocmd BufRead,BufNewFile *.gs setfiletype genie

" python-distribute config file
autocmd BufNewFile,BufRead ~/.pypirc setfiletype dosini

" editorconfig
autocmd BufRead,BufNewFile .editorconfig setfiletype dosini

" mutt
autocmd BufRead,BufNewFile **/.mutt/*.rc setfiletype muttrc

" redo
autocmd BufRead,BufNewFile *.do setfiletype sh
autocmd BufRead,BufNewFile *.do let g:is_posix=1
