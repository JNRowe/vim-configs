" vim compiler file
" Compiler:		hlint (haskell verifier)
" Maintainer:   Vincent B. (twinside@free.fr)
" Last Change:  2010 march 02
" Version:      1.02
" Changelog:
"   1.02. - Fixed shellpipe problem (thanks to Martin Krauskopf).
"         - swtiching to vba distribution.
"   1.01. - Setting up makeprg.
"
if exists("hlint")
  finish
endif
let current_compiler = "hlint"

let s:cpo_save = &cpo
set cpo-=C

setlocal errorformat=%f:%l:%c:\ %t%*[a-zA-Z]:\ %m
setlocal makeprg=hlint\ %

" ensure shellpipe is set to default (might be changed by 
" compiler/ghc.vim)
setlocal shellpipe=>

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim

