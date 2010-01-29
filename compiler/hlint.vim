" vim compiler file
" Compiler:		hlint (haskell verifier)
" Maintainer:   Vincent B. (twinside@free.fr)
" Last Change:  2009 déc. 30
if exists("hlint")
  finish
endif
let current_compiler = "hlint"

let s:cpo_save = &cpo
set cpo-=C

setlocal errorformat=%f:%l:%c:\ %t%*[a-zA-Z]:\ %m
setlocal makeprg=hlint\ %

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim

