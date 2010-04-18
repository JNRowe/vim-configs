if exists("current_compiler")
  finish
endif
let current_compiler = "vala"

setlocal efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
