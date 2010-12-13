if exists("current_compiler")
  finish
endif
let current_compiler = "pep8"

setlocal makeprg=pep8\ --repeat\ %
setlocal efm=%f:%l:%c:\ %t%n\ %m

